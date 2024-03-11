.. meta::
   :description: User authentication methods available with Micetro
   :keywords: Active directory, Windows active directory,  multifactor authentication, Azure, Enra ID, mfa, ldap, radius, Okta, external authentication
   
.. _webapp-external-auth:

External Authentication
=======================

Micetro offers a variety of user authentication options to enhance security and streamline access.

In addition to the default local user authentication method, where users authenticate directly with Micetro using their local credentials, Micetro supports multifactor authentication (MFA) through two platforms: Microsoft Entra ID and Okta. When you authenticate with Micetro using external authentication providers like Microsoft Entra ID or Okta, Micetro securely communicates with these platforms to verify your identity. This means that instead of creating and managing separate login credentials within Micetro, you can use the credentials you already have with these trusted platforms. It simplifies the login process and ensures that your authentication is handled with the same level of security maintained by these external providers.

Additionally, users can authenticate via the Windows Active Directory (AD) user database and Lightweight Directory Access Protocol (LDAP) servers. This means that if your organization already uses AD or LDAP for user management, Micetro can seamlessly integrate with these systems to authenticate users.

Furthermore, authentication through a RADIUS server is supported. With RADIUS, organizations can centralize user authentication, authorization, and accounting in a single server, making it easier to manage access controls and ensure security across the network.

.. toctree::
  :maxdepth: 1

  mfa_azure
  mfa_okta
  ad_user_auth
  ldap_user_auth
  radius_user_auth
