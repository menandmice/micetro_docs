.. meta::
   :description: Installing the browser-based user interface and web service for Micetro
   :keywords: browser, web application, web service, Micetro, Apache, Microsoft IIS

.. _install-webapp:

Installing the Micetro Web Interface
====================================

Installing the Web Interface on Windows
---------------------------------------

.. note::
  On Windows, the Micetro Web Interface requires IIS to be installed. The installer will verify the presence of all required components.

Install the Micetro Web Interface by double-clicking the Microsoft installer file and following the instructions on the screen.

.. warning::
  If the Micetro Web Interface is installed on a different server than Micetro Central, you need to configure the **Web app server host** to the hostname of the webserver. This setting can be adjusted in the Management Console unser :menuselection:`System settings --> Advanced` to ensure that the auto-update feature for the Web Interface works correctly.

----

Installing the Web Interface on Linux
-------------------------------------

.. important::
  Before installing the Micetro Web Interface, make sure you have an operational Apache Web Server running. The Web Interface will configure its own virtual host.

1. Extract and install the Micetro Web Interface installation package with root privileges:

  .. code-block:: bash

      tar -xzvf micetro-web-application-10.3.5.linux.x64.tgz
      cd micetro-web-application-10.3.5.linux.x64 && ./install --web-virtual-host-domain web-application.domain.tld

    
  Where ``web-application.domain.tld`` is the domain where the Web Application will be accessed.

2. Restart the Apache web server:

  .. code-block:: bash

    systemctl restart httpd

3. For RHEL8-based distributions with SELinux enabled, make sure Apache is permitted to connect to the Web Interface service:

  .. code-block:: bash

    setsebool httpd_can_network_connect 1 -P

Further Configuration
"""""""""""""""""""""

.. toctree::
  :maxdepth: 1

  webapp_ssl
  webapp_compression
  webapp_fixed_central
  webserver_proxy_timeout
