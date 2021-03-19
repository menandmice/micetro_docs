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

  tar -xzvf mmsuite-web-application-9.4.2.linux.x64.tgz
  cd mmsuite-web-application-9.4.2.linux.x64 && ./install --web-virtual-host-domain web-application.domain.tld

Where ``web-application.domain.tld`` is the domain on which the Web Application will be accessed.

Proceed to :ref:`webui-ssl` or :ref:`configuration`.

Install the Web Application on Windows
--------------------------------------

.. note::
  On Windows, the Web Application requires IIS to be installed. The installer will check if all required components are available.

Install Men&Mice Web Application by double clicking the Microsoft installer file and follow the instructions there.

.. warning::
  If the web application is not installed on the same server as Men&Mice Central, you need to  set the **Web app server host** value to the webserver's hostname through :guilabel:`System settings --> Advanced` in the Management Console for the auto-update feature to work for the Web Application.

Proceed to :ref:`webui-ssl` or :ref:`configuration`.
