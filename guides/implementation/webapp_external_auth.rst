.. meta::
   :description: User authentication methods available with Micetro
   :keywords: Active directory, Windows active directory,  multi-factor authentication, Azure, Okta
   
.. _webapp-external-auth:

External Authentication
=======================

This section explains the diverse user authentication options offered by Micetro.

Micetro not only provides Local User Authentication but also supports multi-factor authentication (MFA) through two platforms: Azure and Okta. Additionally, users can authenticate via the Windows Active Directory (AD) user database and Lightweight Directory Access Protocol (LDAP) servers. Furthermore, authentication through a RADIUS server is supported, facilitating centralized authentication management for enhanced security.

.. toctree::
  :maxdepth: 1

  mfa_azure
  mfa_okta
  ad_user_auth
  ldap_user_auth
  radius_user_auth



Addendum
^^^^^^^^

**Troubleshooting**

Logging for External Authentication can be enabled by putting your Central log in ll6.

**External changes to user profiles**

External changes to user’s email, full name, and group membership are automatically replicated in Micetro on next login.

**Separate hosts for Micetro Central and Micetro Web Application**

The Web Application/Web service is traditionally on the same host as the Micetro Central and by default, the tool will send queries to “localhost”.  

if Micetro Central is on a different host from the Web Service then you can add the following XML-tag to the preference value to auto-populate the “Server” field at login::

      <DefaultCentralServer value="IP or DNS name of the Men & Mice Central server" />
      
      * Windows - C:\ProgramData\Men and Mice\Central\preferences.cfg 
      * Linux - /var/mmsuite/mmcentral/preferences.cfg
