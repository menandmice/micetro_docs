.. _install-webui:

.. toctree::
  :maxdepth: 2
  :hidden:

  webui_ssl
  webui_compression

Web Application
===============

.. important::
  Before you install the the Men&Mice Web Application, make sure you must have a functioning and accessible Apache Web Server running. The Web Application will configure its virtual host.

Extract and install the Men&Mice Web Application install package (as root):

.. code-block:: bash
  :linenos:

  tar -xzvf mmsuite-web-application-9.4.2.linux.x64.tgz
  cd mmsuite-web-application-9.4.2.linux.x64 && ./install --web-virtual-host-domain web-application.domain.tld

Where ``web-application.domain.tld`` is the domain on which the Web Application will be accessed.
