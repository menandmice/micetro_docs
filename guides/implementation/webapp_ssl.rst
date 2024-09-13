.. meta::
   :description: Configuring SSL for the Micetro Web Interface
   :keywords: Apache, Microsoft IIS, SSL, Micetro 

.. _webapp-ssl:

Setting Up SSL for the Web Interface
======================================

SSL on Windows (IIS)
--------------------

Configuring SSL Certificate
^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Open the IIS (Internet Information Services) Manager.

2. Select the :guilabel:`Web Server node` in the left sidebar, under **Start Page**, and double-click :guilabel:`Server Certificates` in the middle pane.

  .. image:: ../../images/iis-ssl-step1.png
    :width: 90%

3. In the **Actions** pane, select an action to import an existing .pfx SSL certificate or to create a self-signed certificate. If your certificate is in a format other than .pfx, see the documentation or tools provided by your certificate authority to convert certificates to .pfx format.

4. Select your website under **Sites** in the left sidebar (usually Default Web Site), and then click :guilabel:`Bindings...` in the **Actions** pane on the right.

  .. image:: ../../images/iis-ssl-step2.png
    :width: 90%

5. In the **Site Bindings** dialog box, click :guilabel:`Add`, select **https** on the **Type** menu, and then select the certificate you added in step 3 from the SSL certificate list. Click :guilabel:`OK`.

  .. image:: ../../images/iis-ssl-step3.png
    :width: 70%

  * The **Host Name** and **Require Server Name Indication** fields can be left blank if this the first certificate installed on the server.

Redirecting HTTP Traffic to HTTPS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Navigate to URL Rewrite rules and locate the grayed out HTTP --> HTTPA redirect rule. 

2. Ensure it's postitioned at the top of the list, select it, and click :guilabel:`Enable` under **Actions** on the right side. 

3. Restart the web server. This will automatically redirect all HTTP queries to HTTPS.


Using the IIS Manager
"""""""""""""""""""""

With **Default Web Site** selected in the left sidebar, double-click :guilabel:`URL Rewrite` in the middle pane.

If there's already an *HTTP to HTTPS redirect* rule at the top of the list, no further action is needed.

**To add a new rule**:

1. Click :guilabel:`Add Rules` in the **Actions** pane on the right, then click :guilabel:`OK` to create an empty inbound rule.

2. In the **Name** field, enter *HTTP to HTTPS redirect*.

3. In the **Pattern** field, enter ``(.*)``

4. Under conditions, click :guilabel:`Add` and enter the required condition:

  .. image:: ../../images/iis-ssl-step5.png
    :width: 60%

5. In the **Actions** pane at the bottom, select **Redirect** from the :guilabel:`Action type` drop-down list, set the redirect URL to ``https://{HTTP_HOST}/{R:1}`` and the redirect type to **Permanent (301)**.

  .. image:: ../../images/iis-ssl-step6.png
    :width: 70%

6. Click :guilabel:`Apply` in the **Actions** pane on the left, and then click :guilabel:`Back to rules`.

7. Move the new *HTTP to HTTPS redirect* rule to the top of the list using the :guilabel:`Move Up` button in the **Actions** pane on the right.

SSL on Linux (Apache)
---------------------

By default, the Web Interface uses an unencrypted http connection on port 80. To use it with https on port 443, follow these steps.

1. Ensure that mod_ssl for Apache is installed:

  .. code-block:: bash

    yum install mod_ssl


2. If you have existing SSL key files: 
  * place the .key file in /etc/pki/tls/private/
  * and the .crt and .csr files in /etc/pki/tls/certs/.

3. If you need new SSL keys, generate a keypair:

  .. code-block:: bash

   openssl req -new -nodes -keyout mmweb.key -out mmweb.csr -newkey rsa:4096


4. Create self-signed certificate:

  .. code-block:: bash

    openssl x509 -req -days 365 -in mmweb.csr -signkey mmweb.key -out externaldns3.crt


5. Move the files to the appropriate directories:

  .. code-block:: bash

    cp mmweb.key /etc/pki/tls/private/
    cp mmweb.c* /etc/pki/tls/certs/

6. Once the keyfiles are placed in their respective directories, edit the mmweb.conf file in the Apache configuration directory (default /etc/httpd/conf, or use find /etc/ -name "mmweb.conf" to locate the file) with the following changes:

  * change ``<VirtualHost *:80>`` to ``<VirtualHost *:443>``
  * add in the references to the key files (amend the path as necessary):

  .. code-block::

    SSLCertificateFile /etc/pki/tls/certs/mmweb.crt
    SSLCertificateKeyFile /etc/pki/tls/private/mmweb.key

  * enable SSL:

  .. code-block::

      SSLEngine on
      SSLProtocol all -SSLv2 -SSLv3
      SSLCipherSuite HIGH:3DES:!aNULL:!MD5:!SEED:!IDEA

.. note::
  The default Apache installation may already have a ``<VirtualHost _default_:443>`` directive, which may conflict with the ``mmweb.conf`` file.
  Comment out this existing VirtualHost block to avoid errors.

To verify the Web Interface is accessible, navigate to ``https://web-application.domain.tld``. The Micetro Web Interface login should be displayed.
