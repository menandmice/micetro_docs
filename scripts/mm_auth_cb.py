"""
External authentication module for Micetro.
"""
import json
import sys

IS_PYTHON_VERSION2 = sys.version_info.major == 2

try:
    import requests
except ImportError:
    print(
        json.dumps(
            {
                "error": "DependenciesMissing",
                "description": 'Missing dependency "requests"',
            }
        )
    )
    sys.exit(1)

if IS_PYTHON_VERSION2:
    from urlparse import parse_qsl
    from io import BytesIO as StringIO  # Log to stream
else:  # Python 3
    from urllib.parse import parse_qsl
    from io import StringIO

import logging

log_stream = StringIO()
log_level = logging.WARN


class MMException(Exception):
    """
    Base exception for errors that we are interested in returning to Central
    """

    def __str__(self):
        return json.dumps(
            {"error": self.__class__.__name__, "description": "\n".join(self.args)}
        )


class InvalidInput(MMException):
    """Raised when input is not according to the provided schema."""

    pass


def parse_data_input(raw_data_str):
    try:
        return json.loads(raw_data_str)
    except ValueError as ex:
        logging.exception("Failed to parse JSON input.")
        raise InvalidInput("Invalid JSON")


def verify_input(json_input):
    if "arguments" not in json_input:
        raise InvalidInput("Required node 'arguments' missing from JSON input")
    if "config" not in json_input:
        raise InvalidInput("Required node 'config' missing from JSON input")
    if "endpoint" not in json_input:
        raise InvalidInput("Required node 'endpoint' missing from JSON input")
    if "state" not in json_input:
        raise InvalidInput("Required node 'state' missing from JSON input")

    if json_input["endpoint"] not in {"okta", "microsoft"}:
        raise InvalidInput("Unknown value for 'endpoint' node in JSON input")

    auth_cb_args = dict(parse_qsl(json_input["arguments"]))

    if "error" in auth_cb_args:
        message = auth_cb_args.get("error_description", "")
        raise MMException(
            "Error in callback: [{}] {}".format(auth_cb_args["error"], message)
        )

    if "code" not in auth_cb_args:
        raise MMException("Missing 'code' from arguments")

    return (
        json_input["endpoint"],
        auth_cb_args,
        json_input["config"],
        {
            "code_verifier": json_input["state"].get("code_verifier", ""),
            "nonce": json_input["state"].get("nonce", ""),
        },
    )


def set_loglevel(json_input):
    global log_level
    if "loglevel" in json_input:
        mmll = json_input["loglevel"]
        if mmll > 5:
            log_level = logging.DEBUG
        elif mmll == 5:
            log_level = logging.INFO


def parse_stdin():
    raw_data_str = sys.stdin.read()
    return parse_data_input(raw_data_str)


# Authenticate with Microsoft Azure AD
# Uses MSAL library from Microsoft: https://github.com/AzureAD/microsoft-authentication-library-for-python
def ms_authenticate(args, config, state):
    try:
        import msal
        from msal.authority import AuthorityBuilder, AZURE_PUBLIC
    except ImportError:
        print(
            json.dumps(
                {
                    "error": "DependenciesMissing",
                    "description": 'Missing dependency "msal"',
                }
            )
        )
        sys.exit(1)

    tenant_id = config.get("tenant_id", "common")
    authority = AuthorityBuilder(AZURE_PUBLIC, tenant_id)
    client_credential = config["client_credential"]

    app = msal.ConfidentialClientApplication(
        config["client_id"],
        authority=authority,
        client_credential=client_credential,
        app_name="Micetro",
    )

    scopes = config["scope"]
    for s in {"User.Read", "offline_access", "openid", "profile"}:
        if s not in scopes:
            scopes.append(s)

    # auth_code_flow = app.initiate_auth_code_flow(
    #    scopes=["User.Read"], # Adds offline_access, openid, and profile.
    #    redirect_uri=config["redirect_uri"],
    #    state=args["state"],
    # )

    auth_code_flow = {
        "state": args["state"],
        "redirect_uri": config["redirect_uri"],
        "scope": scopes,
        "code_verifier": state["code_verifier"],
        "nonce": state["nonce"],
    }

    result = app.acquire_token_by_auth_code_flow(
        auth_code_flow,
        auth_response=args,
    )

    if "error" in result:
        if result["error"] in {"interaction_required", "invalid_grant"}:
            return result  # Errors that Central deals with.
        message = result.get("error_description", "")
        raise MMException(
            "Error authenticating: [{}] {}".format(result["error"], message)
        )

    access_token = result.get("access_token")
    ui_res = result.get("id_token_claims")

    logging.debug("Acquired access token ({}...).".format(access_token[:16]))

    logging.debug("ID token claims: {}".format(ui_res))

    graph_endpoint = config.get(
        "groups_uri",
        "https://graph.microsoft.com/v1.0/me/transitiveMemberOf/microsoft.graph.group?$select=displayName,id",
    )
    groups_res = requests.get(
        graph_endpoint, headers={"Authorization": "Bearer {}".format(access_token)}
    ).json()

    # If we get group ids as part of the authentication results we should
    # filter by those since it is possible for admins to limit them in
    # the application config in Azure AD.
    should_filter_groups = "groups" in ui_res
    group_ids = ui_res.get("groups", [])

    if not group_ids:
        logging.warning("No groups in ID token claims.")

    group_names = []
    for group in groups_res.get("value", []):
        if not should_filter_groups or (
            group.get("id") in group_ids and group.get("displayName")
        ):
            group_names.append(group.get("displayName"))

    # Missing permission to see group names, provide IDs instead.
    if not group_names and group_ids:
        group_names = group_ids
        logging.warning("Group names missing, falling back to IDs.")

    user_details = {
        "loginName": ui_res.get("preferred_username", ""),
        "fullName": ui_res.get("name", ""),
        "externalID": ui_res.get("sub", ""),
        "email": ui_res.get("preferred_username", ""),
        "groups": group_names,
        "authenticator": "Microsoft",
    }
    return user_details


# Authenticate with Okta
# Uses okta_jwt_verifier: https://github.com/okta/okta-jwt-verifier-python
def okta_authenticate(args, config, state):
    try:
        import okta_jwt_verifier
    except ImportError:
        print(
            json.dumps(
                {
                    "error": "DependenciesMissing",
                    "description": 'Missing dependency "okta_jwt_verifier"',
                }
            )
        )
        sys.exit(1)
    import asyncio
    import hashlib

    loop = asyncio.new_event_loop()
    if sys.version_info < (3, 8):
        asyncio.set_event_loop(loop)

    def is_access_token_valid(token, issuer):
        jwt_verifier = okta_jwt_verifier.AccessTokenVerifier(
            issuer=issuer, audience="api://default"
        )
        try:
            loop.run_until_complete(jwt_verifier.verify(token))
            return True
        except Exception:
            logging.exception("AccessTokenVerifier failed")
            return False

    def is_id_token_valid(token, issuer, client_id, nonce):
        encoded_nonce = hashlib.sha256(nonce.encode("ascii")).hexdigest()
        jwt_verifier = okta_jwt_verifier.IDTokenVerifier(
            issuer=issuer, client_id=client_id, audience="api://default"
        )
        try:
            loop.run_until_complete(jwt_verifier.verify(token, nonce=encoded_nonce))
            return True
        except Exception:
            logging.exception("IDTokenVerifier failed")
            return False

    headers = {"Content-Type": "application/x-www-form-urlencoded"}
    query_params = {
        "grant_type": "authorization_code",
        "code": args["code"],
        "code_verifier": state["code_verifier"],
        "redirect_uri": config["redirect_uri"],
    }
    query_params = requests.compat.urlencode(query_params)
    exchange = requests.post(
        config["token_uri"],
        headers=headers,
        data=query_params,
        auth=(config["client_id"], config["client_secret"]),
    ).json()

    if "errorCode" in exchange:
        message = exchange.get("errorSummary", "")
        raise MMException("Error authenticating: " + message)

    # Get tokens and validate
    if "token_type" not in exchange or exchange["token_type"] != "Bearer":
        raise MMException("Unsupported token type. Should be 'Bearer'.")
    if "access_token" not in exchange:
        raise MMException("Missing access_token.")
    if "id_token" not in exchange:
        raise MMException("Missing id_token.")

    access_token = exchange["access_token"]
    id_token = exchange["id_token"]

    logging.debug("Acquired access token ({}...).".format(access_token[:16]))

    if not is_access_token_valid(access_token, config["issuer"]):
        raise MMException("Access token is invalid")

    if not is_id_token_valid(
        id_token, config["issuer"], config["client_id"], state["nonce"]
    ):
        raise MMException("ID token is invalid")

    # Authorization flow successful, get userinfo and login user
    ui_res = requests.get(
        config["userinfo_uri"],
        headers={"Authorization": "Bearer {}".format(access_token)},
    ).json()

    if not ui_res.get("groups", []):
        logging.warning("No groups in user info.")

    user_details = {
        "loginName": ui_res.get("preferred_username", ""),
        "fullName": ui_res.get("name", ""),
        "externalID": ui_res.get("sub", ""),
        "email": ui_res.get("email", ""),
        "idToken": id_token,
        # Assumes an ID Token Claim has been created with the name "groups".
        "groups": ui_res.get("groups", []),
        "authenticator": "Okta",
    }

    return user_details


def main():
    try:
        json_input = parse_stdin()
        endpoint, arguments, config, state = verify_input(json_input)

        set_loglevel(json_input)
        logging.basicConfig(
            stream=log_stream,
            level=log_level,
            format="%(asctime)s [mm_auth_cb] %(message)s",
            datefmt="%H:%M:%S",
        )

        results = {}  # user_details or relogin error
        if endpoint == "microsoft":
            results = ms_authenticate(arguments, config, state)
        else:
            results = okta_authenticate(arguments, config, state)

        log_content = log_stream.getvalue()
        if log_content and log_level == logging.DEBUG:
            results["log"] = log_content

        output = json.dumps(results, ensure_ascii=False)
        if IS_PYTHON_VERSION2:
            print(output.encode("iso-8859-1", "ignore"))
        else:
            print(output)
    except Exception as e:
        log_content = log_stream.getvalue()
        if log_content:
            print(log_content)
            print("=" * 80)
        print(e)
        sys.exit(1)


if __name__ == "__main__":
    main()
