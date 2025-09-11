.. meta::
    :description: Installing the browser-based user interface and web service for Micetro on Windows and further configurations
    :keywords: browser, web application, web service, Micetro, Microsoft IIS, Windows
 
.. _install-webapp-windows:
 
Installing the Micetro Web Application on Windows
=================================================
.. note::
    On Windows, the Micetro Web Application requires Microsoft Internet Information Services (IIS) to be installed. The installer will verify the presence of all required components.
 
To install the Micetro Web Application, double-click on the Microsoft installer file and follow the instructions on the screen.
 
.. warning::
    If the Micetro Web Application is installed on a different server than Micetro Central, you'll need to configure the :guilabel:`Web app server host` to the hostname of the webserver. This setting can be adjusted in the System Settings on the **Admin** page. Check :menuselection:`System Settings --> Advanced` to make sure that the auto-update feature for the Web Application works correctly.
 
Setting up SSL for the Web Application
--------------------------------------
To set up a secure sockets layer (SSL) for the Web Application, follow these instructions.

.. note::
    Make sure that certificates include a Subject Alternative Name (SAN) so that web browsers mark the site as secure.
 
Configuring SSL certificate
^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
1. Open the IIS Manager.
 
2. Select the :guilabel:`Web Server node` in the left sidebar, under **Start Page**, and double-click :guilabel:`Server Certificates` in the middle pane.
 
    .. image:: ../../images/iis-ssl-step1.png
        :width: 90%
 
3. In the **Actions** pane, select an action to import an existing .pfx SSL certificate or to create a self-signed certificate. If your certificate is in a format other than .pfx, refer to the documentation or tools provided by your certificate authority to convert certificates to .pfx format.
 
4. Select your website under **Sites** in the left sidebar (usually Default Web Site), and then click :guilabel:`Bindings...` in the **Actions** pane on the right.
 
    .. image:: ../../images/iis-ssl-step2.png
        :width: 90%
 
5. In the **Site Bindings** dialog box, click :guilabel:`Add`, select **https** from the :guilabel:`Type` dropdown, and then select the certificate you added in Step 3 from the :guilabel:`SSL certificate` list. Click :guilabel:`OK`.
 
    .. image:: ../../images/iis-ssl-step3.png
        :width: 70%
 
   * The :guilabel:`Host name` and :guilabel:`Require Server Name Indication` fields can be left empty if this the first certificate installed on the server.
 
Redirecting HTTP traffic to HTTPS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
1. Navigate to **URL Rewrite rules** and locate the grayed out **HTTP --> HTTPS** redirect rule. 
 
2. Make sure it's postitioned at the top of the list, select it, and click :guilabel:`Enable` under **Actions** on the right side. 
 
3. Restart the web server. This automatically redirects all HTTP queries to HTTPS.
 
Using the IIS Manager
"""""""""""""""""""""
With **Default Web Site** selected in the left sidebar, double-click :guilabel:`URL Rewrite` in the middle pane.
 
If there's already an **HTTP to HTTPS redirect** rule at the top of the list, no further action is needed.
 
**To add a new rule**:
 
1. Select :guilabel:`Add Rules` in the **Actions** pane on the right, then click :guilabel:`OK` to create an empty inbound rule.
 
2. In the :guilabel:`Name` field, enter **HTTP to HTTPS redirect**.
 
3. In the :guilabel:`Pattern` field, enter ``(.*)``.
 
4. Under **Conditions**, select :guilabel:`Add` and enter the required condition:

    .. image:: ../../images/iis-ssl-step5.png
        :width: 60%
 
5. In the **Actions** pane at the bottom, select **Redirect** from the :guilabel:`Action type` dropdown, set the redirect URL to ``https://{HTTP_HOST}/{R:1}`` and the redirect type to **Permanent (301)**.
 
    .. image:: ../../images/iis-ssl-step6.png
        :width: 70%
 
6. Select :guilabel:`Apply` in the **Actions** pane on the left, and then click :guilabel:`Back to rules`.
 
7. Move the new **HTTP to HTTPS redirect** rule to the top of the list using the :guilabel:`Move Up` button in the **Actions** pane on the right.
 
 
.. _webapp-fixed-central-windows:
 
Allowing the Web Application to log into other Micetro Central servers
----------------------------------------------------------------------
By default, the Micetro UI and API only allow connecting to a single Micetro Central server, determined during the first login to Micetro after installation.
 
To allow users to specify a custom Micetro Central server to connect to:
 
1. Edit the ``preferences.cfg`` file for the Micetro Web Services located at ``c:\\ProgramData\\Men and Mice\\Web Services\\preferences.cfg`` by adding the following line to define the default Micetro Central server name:
 
   .. code-block::
    
    <DefaultCentralServer value="your Micetro Central DNS name or IP" />
    
   .. note::
    If ``DefaultCentralServer`` is not specified, the web service will use the first-specified Micetro Central server, typically ``localhost``.

2. Add the following XML-tag to lock the web service to use the default Micetro Central server:

   .. code-block::
    
    <LockToDefaultServer value="0" />
 
2. Restart the Micetro Web Services Windows service.
 
A :guilabel:`Server` field will appear on the Micetro login page and the ``serverName`` field in the API Login command will be honored.
 
.. _webserver-proxy-timeout-windows:
 
Increase timeout for webserver proxy
------------------------------------
To ensure that the Web Application operates efficiently with larger change request queues that take longer for Central to process, modify the ``/etc/httpd/conf`` file and increase the mmws proxy timeout value:
 
.. code-block::
    
    ProxyTimeOut 60
