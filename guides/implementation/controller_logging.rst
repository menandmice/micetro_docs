.. meta::
   :description: How to enable logging for the Men&Mice DNS Server Controller
   :keywords: Micetro, DNS, DNS Server Controller, troubleshooting, Linux

.. _controller-logging:

Configuring logging for the Men&Mice Server Controllers
=======================================================

.. _dns-controller-loglevel:

DNS Server Controller
---------------------

Linux
^^^^^

After installing the DNS Server Controller, *create* the logging directory (``/var/named/mmsuite/`` in CentOS or ``/var/cache/bind/mmsuite/ in Ubuntu`` or specify your own):

.. code-block:: bash

  mkdir /var/named/mmsuite/logs/

Edit the ``/var/named/mmsuite/preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="/var/named/mmsuite/logs/mmremote.log" />
  <LogDestination value="3"/>
  <LogLevel value="5" />

(Amend the directory path as needed.)

Restart the DNS Server Controller:

.. code-block:: bash

  systemctl restart mmremote

Windows
^^^^^^^

1. After installing the DNS Server Controller, *create* the logging directory (``C:\ProgramData\Men and Mice\DNS Server Controller\logs`` or specify your own).

2. Edit the ``C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="C:\ProgramData\Men and Mice\DNS Server Controller\logs\mmDnslog.txt" />
  <LogDestination value="3"/>
  <LogLevel value="5" />

(Amend the directory path as needed.)

Restart the DNS Server Controller.

.. _dhcp-controller-loglevel:

DHCP Server Controller
----------------------

Linux
^^^^^

After installing the DHCP Server Controller, *create* the logging directory (``/var/mmsuite/dhcp_server_controller/logs/`` or specify your own):

.. code-block:: bash

  mkdir /var/mmsuite/dhcp_server_controller/logs/

Edit the ``/var/mmsuite/dhcp_server_controller/preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="/var/mmsuite/dhcp_server_controller/logs/mmremote.log" />
  <LogDestination value="3"/>
  <LogLevel value="5" />

(Amend the directory path as needed.)

Restart the DHCP Server Controller:

.. code-block:: bash

  systemctl restart mmremote

Windows
^^^^^^^

1. After installing the DHCP Server Controller, *create* the logging directory (``C:\ProgramData\Men and Mice\DHCP Server Controller\logs`` or specify your own).

2. Edit the ``C:\ProgramData\Men and Mice\DHCP Server Controller\preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="C:\ProgramData\Men and Mice\DHCP Server Controller\mmremote.log" />
  <LogDestination value="3"/>
  <LogLevel value="5" />

(Amend the directory path as needed.)

Restart the DHCP Server Controller.
