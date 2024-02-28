.. meta::
   :description: User authentication methods available with Micetro
   :keywords: Active directory, Windows active directory,  multi-factor authentication, Azure, Okta
   
.. _webapp-external-auth:

External Authentication
=======================

This section explains the diverse user authentication options offered by Micetro.

Micetro not only provides Local User Authentication but also supports multi-factor authentication (MFA) through two platforms: Microsoft Entra ID and Okta. Additionally, users can authenticate via the Windows Active Directory (AD) user database and Lightweight Directory Access Protocol (LDAP) servers. Furthermore, authentication through a RADIUS server is supported, facilitating centralized authentication management for enhanced security.

.. toctree::
  :maxdepth: 1

  mfa_azure
  mfa_okta
  ad_user_auth
  ldap_user_auth
  radius_user_auth
