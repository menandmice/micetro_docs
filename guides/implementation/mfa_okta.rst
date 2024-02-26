.. meta::
   :description: How to configure multifactor authentication with Okta
   :keywords: Okta, external authentication, multifactor authentication, mfa
   

.. _mfa-okta:

Multifactor Authentication (MFA) AND Single Sign-On with Okta
=============================================================
Streamline your authentication process by integrating with Azure Active Directory (Azure AD) for MFA and SSO functionalities. After configuration, Micetro’s login page will feature a button directing users to Azure’s authentication URL.
    
Dependency Checklist
---------------------
* Configure and enable SSO and MFA in Okta.

* Micetro web servers must be configured for HTTPS and have a valid certificate.

* Central must have internet access to Okta's endpoints:
  
   * *.okta.com 

* Python with dependent libraries and requests package is installed on the Central server.
  
    * Python 3 required.
      
    * okta_jwt_verifier >=0.2.3 - Verifies Okta access and ID tokens - okta-jwt-verifier · PyPI  
      
    * requests - https://pypi.org/project/requests/ 
      
.. Note::
   If running Central in High Availability (HA) mode, it is recommended to disable the service on one of the partners. This will help ensure that the installation is successful on each server and prevent the servers from failing over during the installation process.

   Installation and configuration must be performed on ALL Central servers in your environment. 
     
  
Installation/Setup
-------------------
To begin the configuration process, you'll need to set up an application within Okta. This step will provide you with the necessary properties required for configuration

.. list-table:: Okta Application
   :widths: 50 50
   :header-rows: 0

   * - Sign-in method
     - OIDC - OpenID Connect
   * - Application type
     - Web Application
   * - Grant type
     - Authorizationo Code (default)
   * - Sign-in redirct URIs
     - [Micetro URL]/mmws/auth_cb/okta
   * - Sign-out redirect URIs (optional)
     - [Micetro URL]
   
**To set up the application**:

   1. Open the Okta Administrator page.

   2. In the left pane, expand **Application** and select **Applications**. 

   3. Click **Create App Integration** on the Applications page. 

   4. Select OIDC as the Sign-in method. 

   5. Select **Web Application** as Application type.

   6. Set Grant type to Authorization Code (default). 

   7. For Sign-in redirect URIs, enter: **https://micetro-central-fqdn/mmws/auth_cb/okta** 

   8. For Sign-out redirect URIs, use: **https://micetro-central-fqdn/** 


Okta Authorization Server
    An Okta config with server_id set to default means that the Default Custom Authorization Server provided by Okta is used. Otherwise, the value should be the name of the Custom Authorization server that has been setup at Okta or be skipped (or empty) if the Org Authorization Server should be used. 

Group authorization
    Both new identity solutions can be used in conjunction with group authorization models in Micetro.

    Group membership synchronization operates by matching group names. Users are automatically added to groups within Micetro that correspond to groups listed by the Okta, including both Active Directory (AD) and internal groups (excluding Built-in groups). Conversely, users are removed from groups within Micetro if their names do not match those listed by Azure AD. If the provider does not list any groups, the user’s group membership remains unchanged.

.. note::
  Okta offers options to filter and transform the provided groups during application setup process.
  
Mapping groups from Okta
    To enable the mapping of group memberships from Okta, an *ID Token Claim* has been created with the name "groups". Add an *OpenID Connect ID Token* to the application of the type “Filter“ with the name “groups“. 

    .. image:: ../../images/oicd-token-claim.png
        :width: 60%
  

Configuring Okta Authentication in Micetro
------------------------------------------
After completing the setup in Okta, the next step is to configure authentication in Micetro by entering the necessary information obtained during the application setup process in Okta. Once you have entered the information, save the configuration. Micetro will then test the integration with Azure to ensure it is working properly.

**To configure and test the authentication**:

1.	On the :guilabel:`Admin` page, select the :guilabel:`Configuration` tab.
2.	Select :guilabel:`Authentication` under :guilabel:`System Settings` in the left pane.
3.	Make sure the :guilabel:`Enable external login` providers checkbox is selected.
4.	Click :guilabel:`Configure` and select Okta in the dropdown list.
5.	Fill out the configuration form with the information collected during the Okta setup process.

    .. image:: ../../images/authentication-configure-okta.png
        :width: 60%
 
    * **Domain**: The domain of your Okta organization. 
    * **Server ID**: The unique identifier for your Okta authorization server.
    * **Client ID**:  A public identifier for your application, generated when you register your application with Okta.
    * **Client secret**: A confidential string known only to the application and the authorization server. It's used to authenticate the identity of the application to Okta when requesting tokens. The Client Secret should be kept secure and not shared publicly.
    * **Redirect URI**: This should match the redirect UI configured in Okta.
    * **Scope** (optional): Scopes define the level of access that the client application is requesting from the user during the authentication process. 
    * **Audience URI**: Specifies the intended recipient of the access token.  

6.	When you’re finished, click :guilabel:`Save and Test`. Micetro will attempt to authenticate via the service and display a success message or a log explaining any failures encountered during the process.

Specifying the Login Options for the Login Page
-----------------------------------------------
By default, the Micetro login page displays options for both internal and external login methods. You can change these login options.

To determine the login options on the Micetro login page, select the desired option in the Authentication view within the system settings:

    * **Enable both built-in and external login providers**: his option allows users to log in using both Micetro's internal login method and external authentication providers.
    * **Hide Micetro user accounts**: Selecting this option will remove the display of Micetro user accounts on the login page, presenting only external login providers.
    * **Disable internal login method**: If you prefer to exclusively offer users Single Sign-On (SSO) or Multi-Factor Authentication (MFA) login options, you can disable the default web app login form. This action removes local or on-premises login options from the web application. However, you still have the option to bypass this at login.

Configure Central Server
^^^^^^^^^^^^^^^^^^^^^^^^
   1. Install Python and dependent libraries and packages on the Central server.
   
   When installing Python please ensure the following:
      * Python is available to "all user" (Windows)
      
      * That you are using a ratified (tested by Men&Mice) version of Python (see dependency checklist)
      
      * Python is installed in the "Default" environment
      
      * Add the below XML-tag to the Preferences.cfg to set the path::
      
         <PythonExecutablePath value="C:\\Python39\\python.exe" /> 

         * Windows - C:\ProgramData\Men and Mice\Central\preferences.cfg 
         
         * Linux - /var/mmsuite/mmcentral/preferences.cfg 
         
   .. Note::
         A Central restart is required after this statement is added to the Preferences.cfg file.
   
   2. **Create a new directory called "extensions"** in the Central data directory.
   
         * Windows - C:\\ProgramData\\Men and Mice\\Central\\extensions

         * Linux -  /var/mmsuite/mmcentral/extensions
      
   3. **Download and unzip the Micetro authentication script and signature file** from Github into the newly created extensions directory.  

         * `mm_auth_cb.py.zip <https://github.com/menandmice/micetro_docs/blob/latest/scripts/mm_auth_cb.py.zip.zip>`_  - This Python script handles the authentication callback from the external provider. The same script serves both providers. 

         * `mm_auth_cb.signature.zip <https://github.com/menandmice/micetro_docs/blob/latest/scripts/mm_auth_cb.signature.zip.zip>`_
         
         For security reasons the script is signed and will not be run if there is not a matching signature file mm_auth_cb.signature found in the same folder. 
         
   4. **Manually create a json configuration file int he Micetro data directory**.  At start up the Micetro Central program will search the data directory for a file named “ext_auth_conf.json”.  It will read the contents of the file and store it in the database along with the timestamp. 

   The structure of the JSON object inside the configuration file is unique for each customer depending on the identity solution that is being configured. 

   Micetro data directory: 

      Windows:  C:\\ProgramData\\Menandmice\\Central\\ext_auth_conf.json 

      Linux:  /var/mmsuite/mmcentral/ext_auth_conf.json 

   Add the contents below with credentials obtained from your Identity Provider.
   
   Sample config: 

.. code-block::
         { 

            "okta": { 

               "domain": "Company_domain.okta.com", 

               "server_id": "xxxxxxxxxxx|'default'", (can be skipped/empty)

               "client_id": "xxxxxxxxxxx", 

               "client_secret": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 

               "redirect_uri": "http://localhost/mmws/auth_cb/okta (must match what is configured in Okta)" 

            } 

         }	 

This will cache the credentials in the DB (no need to restart Central).  Once Authentication through the Service Providers is established, the json configuration file can be deleted. 

*About the credential caching*

The contents of the configuration file ext_auth_conf.json are cached in the database, therefore the file can be deleted after external authentication is up and running.  The cached version is updated automatically based on the file timestamp.  

*Clear the cached configuration*

If for some reason you want to clear the cached configuration file in the database. 

1. Empty the .json configuration file.

2. Go to Console Advanced System Settings and ensure that you have the “Default web form” enabled (Tools->System Settings->Advanced).

3. Test with your browser to ensure you can login locally.

4. Disable the external authentication in System Settings.
      
5. **Enable external authentication in the Micetro system settings**
   In the Management Console, go to :menuselection:`Tools --> System Settings --> Advanced` and search for “external auth”. 
      
      .. image:: ../../images/external-authentication-console.png
          :width: 60%
          :align: center
          
It is also possible to enable it via an API call to SetSystemSettings with a system setting named enableExternalAuthentication and value of 1. 

This will enable the SSO login in the web. 

6. Turn off default login form (optional)
   
   If you only want to offer users SSO/MFA login, you can disable the default web app login form.  
   
   .. image:: ../../images/hide-login-fields.png
      :width: 60%
      :align: center
   
   This will remove local/onprem login in the Web.  However, you still have the option to bypass this at login.  

   .. image:: ../../images/sso-login-external.png
      :width: 60%
      :align: center
      
.. Note::
The form will not be hidden if there is no external provider configured. The login form can be found be clicking the “Log in with Micetro“ down in the left corner of the login page.

Login and Grant User/Group Access
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

At first login, when using Okta, **a new user account is created in Micetro**.  This user account will appear with the type “External”. External changes to user’s email, full name and group membership are synced at subsequent logins by matching the external ID.

A single user profile is thus not shared between an external user authenticated by Okta and AD-integrated SSO, instead they are treated as separate users in Micetro.

By default, all external users are added automatically to the “All users (built-in)” group. If group memberships are among the properties being returned by the identity service, then Micetro will add the user to groups with a matching name inside Micetro.

A few properties are synchronized by Micetro; such as user’s email, full name, and group memberships. Any external changes to these properties are updated in Micetro on the next login.

.. Note::
   After the new External accounts are added (automatically, when user first logs in), administrators will still need to grant access to the DNS/DHCP/IPAM roles. 
   
   If privileges have not yet been granted for the new external accounts, the user will get the below error:
   
   .. image:: ../../images/mfa-error.png
      :width: 60%
      :align: centerActive Directory User Authentication