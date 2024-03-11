.. meta::
   :description: How to configure multifactor authentication with Microsoft Entra ID
   :keywords: Azure, Entra ID, external authentication, multifactor authentication, mfa
   

.. _mfa-azure:

Integrating with Microsoft Entra ID 
====================================
Integrating Micetro with Microsoft Entra ID (formerly Azure AD) can simplify the authentication process by providing multifactor authentication (MFA) and single sign-on (SSO) functionalities. After configuration, Micetro's login page will include a button that, when clicked, directs users to Microsoft Entra's authentication URL, where they can complete the authentication process using their Entra credentials and gain access to Micetro without the need to enter their login credentials repeatedly. 

Dependency Checklist
--------------------
* Configure and enable SSO and MFA in your identity provider.

* Micetro web servers must be configured for HTTPS and have a valid certificate.

* Central must have internet access to Entra ID's endpoints:

    * login.microsoftonline.com

    * graph.microsoft.com
     
* Python with dependent libraries and requests package is installed on the Central server.
    
    * msal >=1.17 - The Microsoft Authentication Library that enables Micetro to access the Cloud for AAD - https://pypi.org/project/msal/1.17.0/ 
      
    * requests - https://pypi.org/project/requests/ 
      
  
.. Note::
   If running Central in High Availability (HA) mode, it is recommended to disable the service on one of the partners. This will help ensure that the installation is successful on each server and prevent the servers from failing over during the installation process.

   Installation and configuration must be performed on ALL Central servers in your environment.  
  
Installation/Setup
------------------
Setting up the Application (Microsoft Entra ID)
    To begin the configuration process, you'll need to set up an application within Entra ID. This step will provide you with the necessary properties required for configuration.

Microsoft Entra ID
    If you're running Central in High Availability (HA) mode, it's recommended to disable the service on one of the services. During this configuration, ensure you capture the credentials from Entra ID.  

Permissions
    To be able to fetch the user's profile information and group memberships, the application requires the following permissions: 

.. list-table:: Microsoft Graph
   :widths: 20 20 20 20 20
   :header-rows: 1

   * - API/Permission Name
     - Type
     - Description
     - Admin consent request
     - Status
   * - GroupMember.Read.All
     - Delegated
     - Read group memberships
     - Yes
     - Granted for [name]
   * - User.Read
     - Delegated
     - Sign in and read user profile
     - No
     - Granted for [name]

While the application requests ``User.Read`` from the user, an administrator needs to grant ``GroupMember.Read.All`` permission. Without this permission, group membership syncing may not occur as expected.

Register the Application
   1. Go to the Azure Portal and access Azure Active Directory (AAD).
   
   2. On the left pane, select :guilabel:`App registration` and then click :guilabel:`New Registration` within the newly opened “blade”.

   3. Enter the name and select the appropriate authentication types. For the Redirect URI, select web and input https://micetro.central.fqdn/mmws/auth_cb/microsoft 

   4. After registering the app, locate the client ID in the essentials panel.

   5. Navigate to **Certificates and Secrets** to generate a new secret for the app's use. 

Group authorization
    Both new identity solutions can be used in conjunction with group authorization models in Micetro.
    
    Group membership synchronization operates by matching group names. Users are automatically added to groups within Micetro that correspond to groups listed by Entra ID, including both Active Directory (AD) and internal groups (excluding Built-in groups). Conversely, users are removed from groups within Micetro if their names do not match those listed by the Entra ID. If Entra ID does not list any groups, the user's group membership remains unchanged. 

    .. note::
        Entra ID offers options to filter and transform the provided groups during the application setup process.
  
Mapping groups from Microsoft Entra ID
    As Entra ID only returns group ID with the token, the script makes an extra call to Microsoft Graph API to fetch the group names. The Graph URI used can be changed in the config (groups_uri), but it should generally not be needed. As there is a limit of about 200 group IDs that can be returned within the JSON Web Token, filtering should be used to supply only the necessary groups. 

    `Configure group claims for applications by using Microsoft Entra ID <https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-fed-group-claims>`_

Configuring Central Server
---------------------------

   1. Install Python and dependent libraries and packages on the Central server.
   
      When installing Python, ensure the following:
      
      * Python is available to "all user" (Windows).
      
      * Use a Men&Mice tested version of Python (see the dependency checklist).
      
      * Python is installed in the "Default" environment
      
      * Add the following XML-tag to the Preferences.cfg file to set the path::
      
         <PythonExecutablePath value="C:\\Python39\\python.exe" /> 

      * Path for Preferences.cfg:

         * Windows - C:\\ProgramData\\Men and Mice\\Central\\preferences.cfg 
         
         * Linux - /var/mmsuite/mmcentral/preferences.cfg 
         
        .. Note::
            A Central restart is required after this statement is added to the Preferences.cfg file.
   
   2. **Create a new directory called "extensions"** in the Central data directory.
   
         * Windows - C:\\ProgramData\\Men and Mice\\Central\\extensions

         * Linux -  /var/mmsuite/mmcentral/extensions
      
   3. **Download and unzip the Micetro authentication script and signature file** from Github into the newly created extensions directory.  

         * `mm_auth_cb.py.zip <https://github.com/menandmice/micetro_docs/blob/latest/scripts/mm_auth_cb.py.zip.zip>`_  - This Python script handles the authentication callback from the external provider. The same script serves both providers. 

         * `mm_auth_cb.signature.zip <https://github.com/menandmice/micetro_docs/blob/latest/scripts/mm_auth_cb.signature.zip.zip>`_
         
         For security reasons the script is signed and will not be run if there is not a matching signature file mm_auth_cb.signature in the same folder. 
         
   4. **Manually create a json configuration file int he Micetro data directory**.  At start up the Micetro Central program will search the data directory for a file named “ext_auth_conf.json”.  It will read the contents of the file and store it in the database along with the timestamp. 

   The structure of the JSON object inside the configuration file is unique for each customer depending on the identity solution that is being configured. 

   Micetro data directory: 

      Windows:  C:\\ProgramData\\Menandmice\\Central\\ext_auth_conf.json 

      Linux:  /var/mmsuite/mmcentral/ext_auth_conf.json 

   Add the contents below with credentials obtained from your Identity Provider.
   
   Sample config:
     
.. code-block::
         
         { 

            "microsoft": { 

               "tenant_id": "Company_tenant_id (must match Azure)", 

               "client_id": "xxxxxxx-xxxx-xxxx-xxxxx-xxxxxxxxxxx", 

               "client_credential": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 

               "redirect_uri": "http://localhost/mmws/auth_cb/microsoft (must match what is configured in Azure)" 

            } 

         }	 


This will cache the credentials in the DB (no need to restart Central).  Once Authentication through the Service Providers is established, the json configuration file can be deleted. 

*About the credential caching*

The contents of the configuration file `ext_auth_conf.json` are cached in the database, therefore the file can be deleted after external authentication is up and running. The cached version is updated automatically based on the file timestamp.  

*Clear the cached configuration*

If for some reason you want to clear the cached configuration file in the database. 

1. Empty the .json configuration file.

2. Go to :menuselection:`Tools->System Settings->Advanced` and ensure that you have the “Default web form” enabled..

3. Test with your browser to ensure you can login locally.

4. Disable the external authentication in System Settings.
      
5. **Enable external authentication in the Micetro system settings**
   In the Management Console, go to :menuselection:`Tools --> System Settings --> Advanced` and search for “external auth”. 
      
      .. image:: ../../images/external-authentication-console.png
          :width: 60%
          :align: center
          
It is also possible to enable it via an API call to SetSystemSettings with a system setting named enableExternalAuthentication and value of 1. 

This will enable the SSO login in the web. 
    
Configuring Entra ID (Azure AD) Authentication in Micetro
---------------------------------------------------------
After completing the setup in Entra ID, the next step is to configure authentication in Micetro by entering the necessary information obtained during the application setup process. Once you have entered the information, save the configuration. Micetro will then test the integration with Entra ID to ensure it is working properly. 

**To configure and test the authentication**:

1.	On the :guilabel:`Admin` page, select the :guilabel:`Configuration` tab.
2.	Select :guilabel:`Authentication` under :guilabel:`System Settings` in the left pane.
3.	Make sure the :guilabel:`Enable external login providers` checkbox is selected.
4.	Click :guilabel:`Configure` and select :guilabel:`Azure AD` in the dropdown list.
5.	Fill out the configuration form with the information collected during the Entra ID setup process.

    .. image:: ../../images/mfa-configure-azure.png
        :width: 60%
 
    * **Client ID**: A unique identifier for your application within Entra ID. 
    * **Client credential**: Enter the appropriate credential.
    * **Redirect URI**: This should match the redirect UI configured in Entra ID.
    * **Scope** (optional): 
    * **Use Azure US Government endpoints** (optional): Select the Microsoft Graph endpoint you prefer to use. 

6.	When you're finished, click :guilabel:`Save and Test` Micetro will attempt to authenticate via the service and display a success message or a log explaining any failures encountered during the process.
7. Optional. If you want to provide only SSO/MFA login, you can disable the internal login method. This will remove the local login from the Micetro login page. However, you can still bypass this restriction at login. The internal login method can be found by clicking **Log in with Micetro** in the bottom left corner of the login page.

   .. image:: ../../images/sso-login-external.png  
      :width: 60%

   For more information about login options in Micetro, see :ref:`admin-authentication`.

User Authentication and Access Management
-----------------------------------------

Upon first login using Entra ID, a new user account is created in Micetro, categorized as “External”. Subsequent logins synchronize external changes to the user's email, full name, and group memberships by matching the external ID.

It's important to note that external user accounts authenticated via Entra ID and those integrated with AD-integrated SSO are treated as distinct entities within Micetro, each with its distinct user profile.

By default, all external users are automatically added to the “All users (built-in)” group. If group memberships are included in the properties returned by Entra ID, Micetro will add users to groups with matching names.

Micetro ensures synchronization of several key properties including email, full name, and group memberships. Any external changes to these properties are updated in Micetro upon subsequent logins.

.. Note::
    
   Despite the automatic addition of new External accounts during initial login, administrators must manually grant access to the DNS/DHCP/IPAM roles.   
    
   Failure to grant privileges for these new external accounts will result in an error for the user.   

   .. image:: ../../images/mfa-error.png
      :width: 45%
      :align: center