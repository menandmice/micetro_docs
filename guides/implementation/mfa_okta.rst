.. meta::
   :description: How to configure multifactor authentication with Okta
   :keywords: Okta, external authentication, multifactor authentication, mfa
   

.. _mfa-okta:

Integrating with Okta
=====================
Integrating Micetro with Okta can simplify the authentication process by providing multi-Factor authentication (MFA) and single sign-on (SSO) functionalities. After configuration, Micetro's login page includes a button that, when clicked, directs users to Okta's authentication URL, where they can complete the authentication process using their Okta credentials and gain access to Micetro without needing to repeatedly enter their login credentials. 

Dependency checklist
---------------------
* Configure and enable SSO and MFA in Okta.

* Central must have internet access to Okta's endpoints:
  
   * *.okta.com 

* Python with dependent libraries are installed on the Central server.
  
    * Python 3.8 or newer required.
      
    * okta_jwt_verifier >=0.2.3 - Verifies Okta access and ID tokens - okta-jwt-verifier · PyPI  
      
    * requests - https://pypi.org/project/requests/ 
      
.. note::
   If running Micetro Central in High Availability (HA) mode, it's recommended to disable the service on one of the partners. This helps to ensure that the installation is successful on each server and prevents the servers from failing over during the installation process.

   Installation and configuration must be performed on *ALL* Central servers in your environment. 
     
  
Installation/setup
-------------------
To begin the configuration process, you need to set up an application within Okta. This step will provide you with the necessary properties required for configuration.
 
**To set up the application**:

1. In the Okta Admin Console, go to **Applications** and select **Applications**. 

2. Click **Create App Integration** on the Applications page. 

3. Select **OIDC - OpenID Connect** as the Sign-in method. 

4. Select **Web Application** as Application type.

5. Set Grant type to **Authorization Code** (default). 

6. For Sign-in redirect URIs, enter **http://micetro-central-fqdn/mmws/auth_cb/okta**. 

7. For Sign-out redirect URIs, use **http://micetro-central-fqdn/**. 


Okta Authorization Server
    When configuring Okta, setting the ``server_id`` to **default** means that the Default Custom Authorization Server provided by Okta is used. Otherwise, the value should be the name of the Custom Authorization server that has been set up at Okta. If the Org Authorization Server is preferred, skip the ``server_id`` or leave it empty. 

Group authorization
    Both new identity solutions can be used in conjunction with group authorization models in Micetro.

    Group membership synchronization operates by matching group names. Users are automatically added to groups within Micetro that correspond to groups listed by Okta, including both Active Directory (AD) and internal groups (excluding Built-in groups). Conversely, users are removed from groups within Micetro if their names do not match those listed by Okta. If Okta does not provide any groups, the user's group membership remains unchanged.

.. note::
  Okta offers options to filter and transform the provided groups during the application setup process.
  
Mapping groups from Okta
    To enable the mapping of group memberships from Okta, an **ID Token Claim** has been created with the name "groups". To integrate this, include an **OpenID Connect ID Token** in the application configured as type "Filter" and designated with the name "groups". 

    .. image:: ../../images/oicd-token-claim.png
        :width: 70%
  
Configuring the Central server
------------------------------
1. Install Python and dependent libraries and packages on the Central server.
   
   When installing Python please ensure the following:
      * Python is available to "all users" (Windows).
      
      * That you are using a ratified (tested by Men&Mice) version of Python (refer to the dependency checklist).
      
      * Use Python version 3.8 or newer is installed in the "Default" environment.
   
2. Confirm that there is a directory called "extensions" in the Micetro Central data directory and that it contains a Python script named ``mm_auth_cb.py`` and a signature file. This Python script handles the authentication callback from the external provider. The same script serves both providers. The directory and files are created during the installation of Micetro Central.
      
Configuring Okta authentication in the Micetro Web Application
--------------------------------------------------------------
After completing the setup in Okta, the next step is to configure authentication in Micetro by entering the necessary information obtained during the application setup process. Once you have entered the information, save the configuration. Micetro then tests the integration with Okta to make sure it's working properly.

**To configure and test the authentication**:

1.	On the **Admin** page, select the :guilabel:`Configuration` tab.
2.	Select :guilabel:`Authentication` under :guilabel:`System Settings` in the left sidebar.
3.	Make sure the :guilabel:`Enable external login` providers checkbox is selected.
4.	Click :guilabel:`Configure` and select :guilabel:`Okta` in the dropdown.
5.	Complete the configuration form with the information collected during the Okta setup process.

    .. image:: ../../images/authentication-configure-okta.png
        :width: 70%
 
   * **Domain**: The domain of your Okta organization. 
   * **Server ID**: The unique identifier for your Okta authorization server.
   * **Client ID**: A public identifier for your application, generated when you register your application with Okta.
   * **Client secret**: A confidential string known only to the application and the authorization server. It's used to authenticate the identity of the application to Okta when requesting tokens. The client secret should be kept secure and not shared publicly.
   * **Redirect URI**: This should match the redirect UI configured in Okta.
   * **Scope** (optional): Scopes define the level of access that the client application is requesting from the user during the authentication process. 
   * **Audience URI**: Specifies the intended recipient of the access token.  

6.	When completed, select :guilabel:`Save and Test`. Micetro will attempt to authenticate via the service and display a success message or a log explaining any failures encountered during the process.
7. (Optional). If you want to provide only SSO/MFA login, you can disable the internal login method. This removes the local login from the Micetro login page. However, you can still bypass this restriction at login. The internal login method can be found by selecting :guilabel:`Log in with Micetro` in the bottom left corner of the login page.

      .. image:: ../../images/sso-login-external.png  
         :width: 70%

   For more information about login options in Micetro, refer to :ref:`admin-authentication`.

User authentication and access management
-----------------------------------------
Upon first login using Okta, a new user account is created in Micetro, categorized as “External”. Subsequent logins synchronize external changes to the user's email, full name, and group memberships by matching the external ID.

It's important to note that external user accounts authenticated via Okta and those integrated with AD-integrated SSO are treated as distinct entities within Micetro, each with its distinct user profile.

By default, all external users are automatically added to the “All users (built-in)” group. If group memberships are included in the properties returned by Okta, Micetro adds users to groups with matching names.

Micetro ensures synchronization of several key properties including email, full name, and group memberships. Any external changes to these properties are updated in Micetro upon subsequent logins.

.. note::
    
   Despite the automatic addition of new External accounts during initial login, administrators must manually grant access to the DNS/DHCP/IPAM roles.   
    
   Failure to grant privileges for these new external accounts will result in an error for the user.   

   .. image:: ../../images/mfa-error.png
      :width: 60%
      :align: center

Manual configuration via config file
-------------------------------------
Instead of using the Micetro Web Application (see above), it's possible to manually configure external authentication by creating a JSON configuration file in Micetro Central's data directory. 
The structure of the JSON object inside the configuration file is unique for each customer depending on the identity solution that being configured.

For more information on configuring external authentication manually, refer to the `documentation on multi-factor authentication for version 10.3 <https://docs.menandmice.com/en/10.3/guides/implementation/external_auth/#single-sign-on-sso-and-multi-factor-authentication-mfa>`_.
