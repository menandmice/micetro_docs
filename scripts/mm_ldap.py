"""
LDAP module for the Men & Mice Suite.
"""
import json
import sys
try:
    import ldap
    import ldap.filter
    from ldapurl import isLDAPUrl
except ImportError:
    print(json.dumps({'error': 'DependenciesMissing', 'description': 'Missing dependency "python-ldap"'}))
    sys.exit(1)

IS_PY_LDAP_VERSION2 = ldap.__version__.startswith('2.')

VERSION = (1, 0)


class LdapException(Exception):
    """
    Base exception for LDAP errors that we are interested in returning to Central
    """

    def __str__(self):
        return json.dumps({
            'error': self.__class__.__name__,
            'description': '\n'.join(self.args)
        })


class InvalidInput(LdapException):
    """Raised when input is not according to the provided schema."""
    pass


class InvalidLDAPServerURI(LdapException):
    pass


class InvalidReaderCredentials(LdapException):
    pass


class VersionMismatch(LdapException):
    pass


class EmptyUsernameOrPassword(LdapException):
    pass


class ServerDown(LdapException):
    pass


class AuthenticationFailed(LdapException):
    pass


class BadFilter(LdapException):
    pass


class LDAPClient(object):
    def __init__(self, client, ldap_server, user_search_config):
        self.client = client
        self.ldap_server = ldap_server
        self.user_search_config = user_search_config
        self.configure_client()
        if ldap_server.reader_dn:
            self.has_reader_credentials = True
            self.bind_reader()
        else:
            self.has_reader_credentials = False

    def configure_client(self):
        self.client.protocol_version = ldap.VERSION3
        self.client.timeout = self.ldap_server.default_timeout
        if self.ldap_server.disable_referrals:
            self.client.set_option(ldap.OPT_REFERRALS, 0)

        if self.ldap_server.skip_cert_verification:
            self.client.set_option(ldap.OPT_X_TLS_REQUIRE_CERT, ldap.OPT_X_TLS_NEVER)
        else:
            self.client.set_option(ldap.OPT_X_TLS_REQUIRE_CERT,
                                   ldap.OPT_X_TLS_DEMAND)
        if self.ldap_server.ca_cert_file:
            self.client.set_option(ldap.OPT_X_TLS_CACERTFILE,
                                   self.ldap_server.ca_cert_file)
        # Force libldap to create a new SSL context (must be last TLS option!)
        self.client.set_option(ldap.OPT_X_TLS_NEWCTX, 0)
        if self.ldap_server.use_start_tls:
            self.client.start_tls_s()

    def bind_reader(self):
        """
        Raises LdapException::InvalidReaderCredentials if invalid credentials were specified.
        Raises ldap.LDAPError on other exceptions.
        """
        try:
            self.client.simple_bind_s(self.ldap_server.reader_dn,
                                      self.ldap_server.reader_password)
        except ldap.INVALID_DN_SYNTAX as syntax_error:
            raise InvalidReaderCredentials(
                'Invalid Reader DN syntax. %s' %
                extract_ldap_error(syntax_error)['info'])
        except ldap.INVALID_CREDENTIALS:
            raise InvalidReaderCredentials(
                'Invalid credentials were provided for the LDAP reader')

    def bind_user(self, who, cred):
        """
        Raises LdapException::AuthenticationFailed if invalid credentials were specified.
        Raises ldap.LDAPError on other exceptions.
        """
        if IS_PY_LDAP_VERSION2:
            who = who.encode("utf-8")
            cred = cred.encode("utf-8")
        try:
            self.client.simple_bind_s(who, cred)
        except ldap.INVALID_CREDENTIALS:
            raise AuthenticationFailed('Invalid credentials were provided')

    def authenticate(self, username, password):
        """
        Authenticates `username` with `password`.
        Returns the users distinguished name, the attributes specified in the search config,
        and all groups associated with the user.
        """
        if not self.has_reader_credentials:
            self.bind_user(username, password)
        user_dn, attrs = self.user_search_config.search(self.client, username)
        if IS_PY_LDAP_VERSION2:
            user_dn = unicode(user_dn, "utf-8")
        self.bind_user(user_dn, password)
        groups = self.search_groups(user_dn, username)
        return user_dn, attrs, groups

    def search_groups(self, user_dn, username):
        """
        Returns list of group names `user_dn` or `username` is a member of or None
        if no search configuration for groups was provided.
        """
        group_search_config = self.user_search_config.group_search_config
        if group_search_config is None:
            return None
        if self.has_reader_credentials:
            self.bind_reader()
        search_results = group_search_config.search(self.client, user_dn, username)
        return parse_group_names(search_results,
                                 group_search_config.name_attribute)


def parse_group_names(group_results, name_attr):
    """
    Parses results from LDAP group search into a list of group names.
    """
    groups = []
    for distinguished_name, entry in group_results:
        if distinguished_name is not None and name_attr in entry:
            group_name = entry[name_attr]
            if group_name:
                groups.append(group_name[0].decode('utf-8', errors='replace'))

    return groups


def are_credentials_empty(username, password):
    """
    Returns true if `username` or `password` are empty.
    """
    return not username.strip() or not password.strip()


def parse_user_search_results(user_results):
    """
    Parses search results and returns a DN and the entry associated with it.
    Raises AuthenticationFailed if `user_results` does not contain a single entry.
    """
    if len(user_results) == 1:
        dn, entry = user_results[0]
        attributes = {}
        for attr_key, attr_values in entry.items():
            attributes[attr_key] = [v.decode('utf-8', errors='replace') for v in attr_values]
        return dn, attributes
    elif not user_results:
        raise AuthenticationFailed('Failed to map username to a DN')
    else:
        raise AuthenticationFailed('Multiple DNs found for username')


def extract_ldap_error(ldap_error):
    """
    Returns dict with 'info' and 'desc' elements describing the LDAP error
    """
    extracted = {'info': '', 'desc': ''}
    if isinstance(ldap_error, ldap.LDAPError) and len(
            ldap_error.args
    ) > 0:
        if 'info' in ldap_error.args[0]:
            extracted['info'] = ldap_error.args[0]['info']
        if 'desc' in ldap_error.args[0]:
            extracted['desc'] = ldap_error.args[0]['desc']
    else:
        extracted['info'] = ldap_error.__class__.__name__
    return extracted


class LDAPServer(object):
    def __init__(self, server_args):
        """
        Raises InvalidLDAPServerURI if `uri` is invalid.
        Raises InvalidReaderCredentials if `reader_dn` or `reader_password` is an empty string.
        """
        self.uri = server_args['uri']
        self.reader_dn = server_args.get('reader_dn', None)
        self.reader_password = server_args.get('reader_password', None)
        self.disable_referrals = server_args.get('disable_referrals', True)
        self.skip_cert_verification = server_args.get('skip_cert_verification', False)
        self.ca_cert_file = server_args.get('ca_cert_file', None)
        self.use_start_tls = server_args.get('use_start_tls', False)
        self.default_timeout = 30  # Seconds
        if not isLDAPUrl(self.uri):
            raise InvalidLDAPServerURI(
                'Invalid LDAP server URI provided: %s' % self.uri)
        if self.reader_dn is not None or self.reader_password is not None:
            if are_credentials_empty(self.reader_dn, self.reader_password):
                raise InvalidReaderCredentials(
                    'Reader DN and password may not be empty')


class LDAPUserSearchConfig(object):
    def __init__(self, search_args):
        self.base_dn = search_args['base_dn']
        self.search_filter = search_args['search_filter']
        self.scope = get_scope_as_enum(search_args.get('scope', 'subtree'))
        self.attributes = search_args.get('attributes', [])
        if IS_PY_LDAP_VERSION2:
            self.attributes = [a.encode('utf-8') for a in self.attributes]
        if 'group_search_config' in search_args:
            self.group_search_config = LDAPGroupSearchConfig(search_args['group_search_config'])
        else:
            self.group_search_config = None

    def search(self, client, username):
        try:
            search_results = client.search_s(
                base=self.base_dn,
                scope=self.scope,
                filterstr=self.search_filter.format(
                    username=ldap.filter.escape_filter_chars(username)
                ),
                attrlist=self.attributes)
        except ldap.FILTER_ERROR:
            raise BadFilter(
                'Bad search filter when searching for user: {}'.format(
                    self.search_filter))
        non_empty_results = [r for r in search_results if r[0]]
        return parse_user_search_results(non_empty_results)


class LDAPGroupSearchConfig():
    def __init__(self, search_args):
        self.base_dn = search_args['base_dn']
        self.search_filter = search_args['search_filter']
        self.scope = get_scope_as_enum(search_args.get('scope', 'subtree'))
        self.name_attribute = search_args.get('name_attribute', 'name')
        if IS_PY_LDAP_VERSION2:
            self.name_attribute = self.name_attribute.encode('utf-8')

    def get_filter_str(self, user_dn, username):
        filterstr=self.search_filter.format(
                    dn=ldap.filter.escape_filter_chars(user_dn),
                    username=ldap.filter.escape_filter_chars(username))
        if IS_PY_LDAP_VERSION2 and type(filterstr) == unicode:
            return filterstr.encode("utf-8")
        return filterstr



    def search(self, client, user_dn, username):
        try:
            return client.search_s(
                base=self.base_dn,
                scope=self.scope,
                filterstr=self.get_filter_str(user_dn, username),
                attrlist=[self.name_attribute])
        except ldap.FILTER_ERROR:
            raise BadFilter(
                'Bad search filter when searching for groups: {}'.format(
                    self.search_filter))


def get_scope_as_enum(scope):
    if scope == 'subtree':
        return ldap.SCOPE_SUBTREE
    if scope == 'one_level':
        return ldap.SCOPE_ONELEVEL
    raise InvalidInput('Valid scope values are \'subtree\' and \'one_level\'')


def main():
    try:
        args = parse_stdin()
        user_details = attempt_to_authenticate(args)
        if IS_PY_LDAP_VERSION2:
            print(json.dumps(user_details, ensure_ascii=False).encode("utf-8"))
        else:
            print(json.dumps(user_details, ensure_ascii=False))
    except LdapException as exception:
        print(exception)
        sys.exit(1)


def attempt_to_authenticate(args):
    """
    Verifies `args` and proceeds to attempt to authenticate a user.
    Returns the user details if successful.
    """
    submitted_username, submitted_password, ldap_server, user_search_config = verify_input(
        args)
    ldap_connection = None
    try:
        ldap_connection = init_client(ldap_server.uri)
        ldap_client = LDAPClient(ldap_connection, ldap_server, user_search_config)
        user_dn, user_attrs, groups = ldap_client.authenticate(
            submitted_username, submitted_password)
        output = {'user_dn': user_dn, 'user_attrs': user_attrs}
        if groups is not None:
            output['groups'] = groups
        return output
    except ldap.SERVER_DOWN as server_down_error:
        raise ServerDown('Unable to connect to LDAP server: {desc}. Details: {info}'.format(
            **extract_ldap_error(server_down_error)))
    except ldap.LDAPError as ldap_error:
        raise LdapException('LDAP error occurred: {desc}. {info}'.format(**extract_ldap_error(ldap_error)))
    finally:
        if ldap_connection is not None:
            ldap_connection.unbind_s()


def parse_data_input(raw_data_str):
    try:
        try:
            return json.loads(raw_data_str)
        except ValueError:
            if not IS_PY_LDAP_VERSION2:
                raise
            try:
                return json.loads(raw_data_str, encoding='utf-8')
            except ValueError:
                return json.loads(raw_data_str, encoding='latin-1')
    except ValueError :
        raise InvalidInput('Invalid JSON')


def parse_stdin():
   raw_data_str = sys.stdin.read()
   return parse_data_input(raw_data_str)


def verify_input(args):
    try:
        version = tuple(args['version'])
        if version[0] != VERSION[0]:
            raise VersionMismatch('MismatchedVersion',
                                  'Script is at version %s.%s' % version)

        submitted_username = args['submitted_username']
        submitted_password = args['submitted_password']
        if are_credentials_empty(submitted_username, submitted_password):
            raise InvalidInput('Username and password may not be empty')
        ldap_server = LDAPServer(args['server'])
        user_config_args = args['user_search_config']

        user_search_config = LDAPUserSearchConfig(user_config_args)
        return submitted_username, submitted_password, ldap_server, user_search_config

    except KeyError as e:
        raise InvalidInput('Missing input key: %s' % str(e))


def init_client(uri):
    if IS_PY_LDAP_VERSION2:
        return ldap.initialize(uri, trace_level=0)
    return ldap.initialize(uri, bytes_mode=False, trace_level=0)

if __name__ == '__main__':
    main()
