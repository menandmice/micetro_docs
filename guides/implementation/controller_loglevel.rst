.. meta::
   :description: How to raise logging level for the Men&Mice DNS Server Controller for troubleshooting
   :keywords: Micetro, DNS, DNS Server Controller, troubleshooting, Linux 

.. _controller-loglevel:

Raise log level for DNS Server Controller
-----------------------------------------

After installing the DNS Server Controller, create the directory ``/var/mmsuite/dns_server_controller/logs/``:

.. code-block:: bash

  mkdir /var/mmsuite/dns_server_controller/logs/

Edit the ``/var/mmsuite/dns_server_controller/preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="/var/mmsuite/dns_server_controller/logs/mmremote.log" />
  <LogLevel value="5" />

Restart the DNS Server Controller:

.. code-block:: bash

  systemctl restart mmremote
