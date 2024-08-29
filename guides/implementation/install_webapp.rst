.. meta::
   :description: Installing the browser-based user interface and web service for Micetro
   :keywords: browser, web application, web service, Micetro, Apache, Microsoft IIS

.. _install-webapp:

Installing the Micetro Web Interface
====================================

Installing the Web Interface on Linux
-------------------------------------

.. important::
  Before you install the the Micetro Web Interface, make sure you have a functioning and accessible Apache Web Server running. The Web Interface will configure its virtual host.

1. Extract and install the Micetro Web Interface install package (as root):

.. code-block:: bash

    tar -xzvf micetro-web-application-10.3.5.linux.x64.tgz
    cd micetro-web-application-10.3.5.linux.x64 && ./install --web-virtual-host-domain web-application.domain.tld

   
Where ``web-application.domain.tld`` is the domain on which the Web Application will be accessed.

2. Restart the Apache web server:

.. code-block:: bash

  systemctl restart httpd

3. In distributions based on RHEL8 with SELinux enabled, make sure Apache can connect to the web interface service:

.. code-block:: bash

  setsebool httpd_can_network_connect 1 -P

----

Installing the Web Interface on Windows
---------------------------------------

.. note::
  On Windows, the Micetro Web Interface requires IIS to be installed. The installer will check if all required components are available.

Install Micetro Web Interface by double clicking the Microsoft installer file and follow the instructions there.

.. warning::
  If the Micetro Web Interface is not installed on the same server as Micetro Central, you need to  set the **Web app server host** value to the webserver's hostname through :menuselection:`System settings --> Advanced` in the Management Console for the auto-update feature to work for the Web Interface.

Further Configuration
"""""""""""""""""""""

.. toctree::
  :maxdepth: 1

  webapp_ssl
  webapp_compression
  webapp_fixed_central
  webserver_proxy_timeout
