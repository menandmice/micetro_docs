.. meta::
   :description: How to configure Central for multifactor authentication
   :keywords: central service, microsoft entra id, okta, multifactor authentication

.. _central-entra:

Configuring Central Server for Multifactor Authentication
===========================================================
This topic describes how to configure the Central server for multifactor authentication with Microsoft Entra ID and Okta.


   1. Install Python and dependent libraries and packages on the Central server.
   
      When installing Python, ensure the following:
      
      * Python is available to "all user" (Windows).
      
      * Python is installed in the "Default" environment.
      
      * If Python is not available in the PATH the following line can be added to the ``preferences.cfg`` file to specify where it can be found:
      
         PythonExecutablePath = "C:\\Python\\python.exe"

      * Path for ``preferences.cfg``:

         * Windows - C:\\ProgramData\\Men and Mice\\Central\\preferences.cfg 
         
         * Linux - /var/mmsuite/mmcentral/preferences.cfg 
         
        .. Note::
            A Central restart is required after this statement is added to the ``preferences.cfg`` file.
   
   2. **Create a new directory called "extensions"** in the Central data directory.
   
         * Windows - C:\\ProgramData\\Men and Mice\\Central\\extensions

         * Linux -  /var/mmsuite/mmcentral/extensions
      
   3. **Download and unzip the Micetro authentication script and signature file** from Github into the newly created extensions directory.  

         * `mm_auth_cb.py.zip <https://github.com/menandmice/micetro_docs/blob/latest/scripts/mm_auth_cb.py.zip.zip>`_ - This Python script handles the authentication callback from the external provider. The same script serves both providers. 

         * `mm_auth_cb.signature.zip <https://github.com/menandmice/micetro_docs/blob/latest/scripts/mm_auth_cb.signature.zip.zip>`_
         
         For security reasons, the script is signed and will not be run if there is not a matching signature file ``mm_auth_cb.signature`` in the same folder. 
         
   4. **Manually create a JSON configuration file in the Micetro data directory**.  At start up, Micetro Central will search the data directory for a file named ``ext_auth_conf.json``. It will read the contents of the file and store it in the database along with the timestamp. 

   The structure of the JSON object inside the configuration file is unique for each customer depending on the identity solution that is being configured. 

   Micetro data directory: 

      Windows:  C:\\ProgramData\\Menandmice\\Central\\ext_auth_conf.json 

      Linux:  /var/mmsuite/mmcentral/ext_auth_conf.json 

   Add the contents below with credentials obtained from your Identity Provider.
   
   Sample config:
     
.. code-block::
         
    Microsoft Entra ID:

         { 
            "microsoft": { 
               "tenant_id": "Company_tenant_id (must match Azure)", 
               "client_id": "xxxxxxx-xxxx-xxxx-xxxxx-xxxxxxxxxxx", 
               "client_credential": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", 
               "redirect_uri": "http://localhost/mmws/auth_cb/microsoft (must match what is configured in Azure)" 
            } 
         }	 

    Okta:

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

This will cache the credentials in the database (no need to restart Central). Once Authentication through the Service Providers is established, the JSON configuration file can be deleted. 

*About the credential caching*

The contents of the configuration file `ext_auth_conf.json` are cached in the database; therefore, the file can be deleted after external authentication is up and running. The cached version is updated automatically based on the file timestamp.  

*Clear the cached configuration*

If for some reason you want to clear the cached configuration file in the database: 

1. Empty the `ext_auth_conf.json` configuration file.

2. Go to :menuselection:`Tools->System Settings->Advanced` and ensure that you have the “Default web form” enabled.

3. Test with your browser to ensure you can login locally.

4. Disable the external authentication in System Settings.
      
5. **Enable external authentication in the Micetro system settings**
   In the Management Console, go to :menuselection:`Tools --> System Settings --> Advanced` and search for “external auth”. 
      
      .. image:: ../../images/external-authentication-console.png
          :width: 60%
          :align: center
          
It is also possible to enable it via an API call to ``SetSystemSettings`` with a system setting named ``enableExternalAuthentication`` and value of 1. 

This will enable the single sign-on (SSO) login in the web application. 
