.. meta::
   :description: How to configure multifactor authentication with Microsoft Entra ID
   :keywords: Azure, Entra ID, external authentication, multifactor authentication, mfa
   

.. _mfa-azure:

Integrating with Microsoft Entra ID 
====================================
Integrating Micetro with Microsoft Entra ID (formerly Azure AD) can simplify the authentication process by providing multifactor authentication (MFA) and single sign-on (SSO) functionalities. After configuration, Micetro's login page will include a button that, when clicked, directs users to Microsoft Entra ID's authentication URL, where they can complete the authentication process using their Entra ID credentials and gain access to Micetro without the need to enter their login credentials repeatedly. 

Dependency Checklist
--------------------
* Configure and enable SSO and MFA in your identity provider.

* Micetro web servers must be configured for HTTPS and have a valid certificate.

* Central must have internet access to Entra ID's endpoints:

    * login.microsoftonline.com

    * graph.microsoft.com
     
* Python with dependent libraries are installed on the Central server.
    
    * msal >=1.17 - The Microsoft Authentication Library that enables Micetro to access the Cloud for AAD - https://pypi.org/project/msal/1.17.0/ 
      
    * requests - https://pypi.org/project/requests/ 
      
  
.. Note::
   If running Central in High Availability (HA) mode, it is recommended to disable the service on one of the partners. This will help ensure that the installation is successful on each server and prevent the servers from failing over during the installation process.

   Installation and configuration must be performed on ALL Central servers in your environment.  
  
Installation/Setup
------------------
Setting up the Application (Microsoft Entra ID)
    To begin the configuration process, you'll need to set up an application within Microsoft Entra ID. This step will provide you with the necessary properties required for configuration.

    During this configuration, ensure you capture the credentials from Entra ID.  

Permissions
    To fetch the user's profile information and group memberships, the application requires the following permissions: 

    .. image:: ../../images/mfa-entra-permissions.png
        :width: 100%


.. Note::
   While the application requests ``User.Read`` from the user, an administrator needs to grant ``GroupMember.Read.All`` permission. Without this permission, group membership syncing may not occur as expected.

Register the Application
   1. Go to the Azure Portal and access Azure Active Directory (AAD).
   
   2. On the left pane, select :guilabel:`App registrations` and then click :guilabel:`New Registration` within the newly opened “blade”.

   3. Enter the name and select the appropriate authentication types. For the Redirect URI, select **web** and enter https://micetro.central.fqdn/mmws/auth_cb/microsoft 

   4. After registering the app, locate the client ID in the essentials panel.

   5. Navigate to **Certificates and Secrets** to generate a new secret for the app's use. 

Group authorization
    The identity solution can be used in conjunction with group authorization models in Micetro.
    
    Group membership synchronization operates by matching group names. Users are automatically added to groups within Micetro that correspond to groups listed by Entra ID, including both Active Directory (AD) and internal groups (excluding Built-in groups). Conversely, users are removed from groups within Micetro if their names do not match those listed by the Entra ID. If Entra ID does not provide any groups, the user's group membership remains unchanged. 

    .. note::
        Entra ID offers options to filter and transform the provided groups during the application setup process.
  
Mapping groups from Microsoft Entra ID
    As Entra ID only returns group ID with the token, the script makes an extra call to Microsoft Graph API to fetch the group names. As there is a limit of about 200 group IDs that can be returned within the JSON Web Token, filtering should be used to supply only the necessary groups. 

    For more information, see `Configure group claims for applications by using Microsoft Entra ID <https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-fed-group-claims>`_

Configuring Central Server
---------------------------

   1. Install Python and dependent libraries and packages on the Central server.
   
      When installing Python, ensure the following:
      
      * Python is available to "all user" (Windows).
      
      * Use Python version 3.7 or newer.
      
      * Python is installed in the "Default" environment.
   
   2. **Confirm that there is a directory called "extensions"** in the Central data directory, and that it contains a Python script named `mm_auth_cb.py` and a signature file. This Python script handles the authentication callback from the external provider. The same script serves both providers. The directory and files are created by the Central installer.

Configuring Entra ID (Azure AD) Authentication in the Micetro Web Interface
----------------------------------------------------------------------------
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
    * **Scope** (optional): Scopes define the level of access that the client application is requesting from the user during the authentication process.
    * **Use Azure US Government endpoints** (optional): Select the Microsoft Graph endpoint you are required to use. 

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


Manual Configuration
---------------------
Instead of using the Micetro Web Interface (see above), it is possible to configure external authentication manually by creating a JSON configuration file in Micetro Central's data directory. At start up the Micetro Central program will search the data directory for a file named `ext_auth_conf.json`.

The structure of the JSON object inside the configuration file is unique for each customer depending on the identity solution that is being configured. 


