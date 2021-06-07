.. meta::
   :description: Installing the browser-based user interface and web service for Micetro by Men&Mice
   :keywords: browser, web application, web service, Micetro, Apache, Microsoft IIS 

.. _install-webapp:

Web Application
===============

Install the Web Application on Linux
------------------------------------

.. important::
  Before you install the the Men&Mice Web Application, make sure you must have a functioning and accessible Apache Web Server running. The Web Application will configure its virtual host.

Extract and install the Men&Mice Web Application install package (as root):

.. code-block:: bash
  :linenos:

  tar -xzvf mmsuite-web-application-10.0.2.linux.x64.tgz
  cd mmsuite-web-application-10.0.2.linux.x64 && ./install --web-virtual-host-domain web-application.domain.tld

Where ``web-application.domain.tld`` is the domain on which the Web Application will be accessed.

Install the Web Application on Windows
--------------------------------------

.. note::
  On Windows, the Web Application requires IIS to be installed. The installer will check if all required components are available.

Install Men&Mice Web Application by double clicking the Microsoft installer file and follow the instructions there.

.. warning::
  If the web application is not installed on the same server as Men&Mice Central, you need to  set the **Web app server host** value to the webserver's hostname through :menuselection:`System settings --> Advanced` in the Management Console for the auto-update feature to work for the Web Application.

Further configuration
"""""""""""""""""""""

.. toctree::
  :maxdepth: 1

  webapp_ssl
  webapp_compression
  webapp_fixed_central
  webserver_proxy_timeout
