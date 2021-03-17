.. _api-auth:

API Authentication methods
==========================

There a few options for authenticating against the M&M API: Using the Login command, using authorization headers against M&M Web services, or using IIS single sign-on

Login command
-------------

This method is available in all versions of M&M, and all the different flavors of the M&M API (SOAP/JSON-RPC/REST). In the REST API, this command is available via the URL commands/Login

The Login command takes in server (for the M&M Central server), user name, and password, and returns a session ID, which should then be used for all other API calls via their session parameter.

The Login command and its parameters is fully documented in the normal SOAP API documentation

.. note::
  Remember to configure HTTPS for the mmws and/or _mmwebext sites for this authentication method

Authorization Headers
---------------------

With the introduction of Men&Mice Web Services and the REST API in version 7.3, it's now also possible to authenticate via HTTP headers, by adding a Basic Authorization header, or with a Negotiate Authorization header, if the client supports it

By using authorization headers for authentication, the Login command becomes unnecessary, and the session ID is not used. The "session" parameter for all the commands must be omitted, and not left blank.

With this authentication method, multiple M&M Web Service instances can be deployed and used simultaneously behind a load balancer to provide a redundancy that is transparent to the API client.

The session IDs, on the other hand, are only valid on the API endpoint (web server) they were created with. So when an API client that uses a session id gets redirected to another Web Server/API Endpoint, the client will get an error that the session id is invalid or expired, and then needs to login again to get a new session id before proceeding.

Basic Authentication
^^^^^^^^^^^^^^^^^^^^

For Basic Authentication, simply include a header like:

.. code-block::
  :linenos:

  Authorization: Basic QWxhZGRpbjpPcGVuU2VzYW1l

where the last part is <user name>:<password>, base64 encoded

For more information on Basic Authorization headers on the client side, see for example here: https://en.wikipedia.org/wiki/Basic_access_authentication

The authorization header authentication method is only available for JSON-RPC and REST APIs, and only if using M&M Web Services as an endpoint (i.e. the URL is <server>/mmws/api or <server>/mmws/json)

.. note::
  Remember to configure HTTPS for the mmws site for this authentication method.

Negotiate Authentication
^^^^^^^^^^^^^^^^^^^^^^^^

Negotiate header Authorization (i.e. Integrated Windows Authentication) is also supported when the client supports it, and when it has been enabled in the M&M Web Services.

This way, the user name and password are not provided in the header, and the API call is executed in the security context of the user that invokes it. In other words, this is the single sign-on authentication option that the M&M Web Services provides.

To enable the Negotiate header Authorization in M&M Web Services, add the following line to C:\ProgramData\Men and Mice\Web Services\preferences.cfg, and restart the M&M Web Services service

.. code-block::
  :linenos:

  <AuthorizationMethods value="Basic,Kerberos,NTLM" />

The order of the methods can be changed, e.g. if NTLM is preferred over Kerberos.

Single Sign-On
--------------

When using M&M Web Services as an API endpoint, refer to the Negotiate header Authorization section above.

When using the M&M Web Extension that comes with the M&M Web Interface as an API endpoint, single sign-on is achieved by invoking a POST http request to

.. code-block::
  :linenos:

  http://<web server>/_mmwebext/mmwebext.dll?RequestSSO

The body of the http request should include simply the M&M Central server name.

If IIS is correctly configured (see https://docs.menandmice.com/x/_g9h), this request will return an XML similar to what the Login SOAP command would return:

.. code-block:: XML
  :linenos:

  <?xml version="1.0" encoding="utf-8"?><soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <soap:Body>
        <LoginResponse xmlns="http://menandmice.com/webservices/">
            <session>UzL9uSNNcLjmlRx1PQsP</session>
            <userName>mydomain\myuser</userName>
        </LoginResponse>
    </soap:Body>
  </soap:Envelope>

The *session* should then be used for all subsequent API commands.
