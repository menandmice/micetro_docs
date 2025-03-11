.. meta::
   :description: Installing the browser-based user interface and web service for Micetro on Linux
   :keywords: browser, web application, web service, Micetro, Apache, Microsoft IIS, Linux

.. _install-webapp-linux:

Installing the Micetro Web Application on Linux
===============================================

.. important::
  Before installing the Micetro Web Application, make sure you have an operational Apache Web Server running. The Web Application will configure its own virtual host.

To install the Micetro Web Application on Linux:

1. Extract and install the Micetro Web Application installation package with root privileges:

  .. code-block:: bash

      tar -xzvf micetro-web-application-10.3.5.linux.x64.tgz
      cd micetro-web-application-10.3.5.linux.x64 && ./install --web-virtual-host-domain web-application.domain.tld

    
  where ``web-application.domain.tld`` is the domain where the Web Application will be accessed.

2. Restart the Apache web server:

  .. code-block:: bash

    systemctl restart httpd

3. For RHEL8-based distributions with SELinux enabled, make sure Apache is permitted to connect to the Web Application service:

  .. code-block:: bash

    setsebool httpd_can_network_connect 1 -P

Setting up SSL for the Web Application (Apache)
-----------------------------------------------
By default, the Web Application uses an unencrypted HTTP connection on port ``80``. To use it with HTTPS on port ``443``, follow these steps:

1. Make sure that mod_ssl for Apache is installed:

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

6. Once the keyfiles are placed in their respective directories, edit the ``mmweb.conf`` file in the Apache configuration directory (default ``/etc/httpd/conf``, or use ``find /etc/ -name "mmweb.conf"`` to locate the file) with the following changes:

  * Change ``<VirtualHost *:80>`` to ``<VirtualHost *:443>``.
  * Add the references to the key files (amend the path as necessary):

  .. code-block::

    SSLCertificateFile /etc/pki/tls/certs/mmweb.crt
    SSLCertificateKeyFile /etc/pki/tls/private/mmweb.key

  * Enable SSL:

  .. code-block::

      SSLEngine on
      SSLProtocol all -SSLv2 -SSLv3
      SSLCipherSuite HIGH:3DES:!aNULL:!MD5:!SEED:!IDEA

.. note::
  The default Apache installation may already have a ``<VirtualHost _default_:443>`` directive, which may conflict with the ``mmweb.conf`` file.

  Comment out this existing VirtualHost block to avoid errors.

To verify the Web Application is accessible, navigate to ``https://web-application.domain.tld``. The Micetro Web Application login should be displayed.

Enabling content compression for Apache
---------------------------------------
To speed up response time for large operations, add the following line to `mmws.conf:

.. code-block::

    AddOutputFilterByType DEFLATE application/json

.. _webapp-fixed-central-linux:

Allowing the Micetro Web Application to log into other Central servers
----------------------------------------------------------------------
By default, the Micetro UI and API only allow connecting to a single Micetro Central server, determined during the first login to Micetro after installation.

To allow users to specify a custom Central server to connect to:

1. Log into the server hosting Micetro.

2. Edit the ``preferences.cfg`` file for the Micetro Web Services (``/var/mmsuite/web_services/preferences.cfg``). Add the following line:

  .. code-block::

    LockToDefaultServer = false

3. Restart the ``mmws`` service:

  .. code-block:: bash

    systemctl restart mmws

A :guides:`Server` field will appear on the Micetro login page and the :guilabel:`serverName` field in the API Login command will be honored.

.. _webserver-proxy-timeout-linux:

Increase timeout for webserver proxy
------------------------------------
To ensure that the Web Application operates efficiently with larger change request queues that take longer for Central to process, modify the ``/etc/httpd/conf`` file and increase the mmws proxy timeout value:

.. code-block::

  ProxyTimeOut 60
