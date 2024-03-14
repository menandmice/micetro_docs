.. meta::
   :description: How to enable logging for the Micetro DNS agent
   :keywords: Micetro, DNS, DNS agent, troubleshooting, Linux

.. _controller-logging:

Configuring Logging for the Micetro Agents
===========================================

.. _dns-controller-loglevel:

DNS Agent
----------

Linux
^^^^^

After installing the DNS agent, *create* the logging directory (``/var/named/mmsuite/`` in CentOS or ``/var/cache/bind/mmsuite/ in Ubuntu`` or specify your own):

.. code-block:: bash

  mkdir /var/named/mmsuite/logs/

Edit the ``/var/named/mmsuite/preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="/var/named/mmsuite/logs/mmremote.log" />
  <LogDestination value="3"/>
  <LogLevel value="5" />

(Amend the directory path as needed.)

Restart the DNS agent:

.. code-block:: bash

  systemctl restart mmremote

Windows
^^^^^^^

1. After installing the DNS agent, *create* the logging directory (``C:\ProgramData\Men and Mice\DNS Server Controller\logs`` or specify your own).

2. Edit the ``C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="C:\ProgramData\Men and Mice\DNS Server Controller\logs\mmDnslog.txt" />
  <LogDestination value="3"/>
  <LogLevel value="5" />

(Amend the directory path as needed.)

Restart the DNS agent.

.. _dhcp-controller-loglevel:

DHCP Agent
----------

Linux
^^^^^

After installing the DHCP agent, *create* the logging directory (``/var/mmsuite/dhcp_server_controller/logs/`` or specify your own):

.. code-block:: bash

  mkdir /var/mmsuite/dhcp_server_controller/logs/

Edit the ``/var/mmsuite/dhcp_server_controller/preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="/var/mmsuite/dhcp_server_controller/logs/mmremote.log" />
  <LogDestination value="3"/>
  <LogLevel value="5" />

(Amend the directory path as needed.)

Restart the DHCP agent:

.. code-block:: bash

  systemctl restart mmremote

Windows
^^^^^^^

1. After installing the DHCP agent, *create* the logging directory (``C:\ProgramData\Men and Mice\DHCP Server Controller\logs`` or specify your own).

2. Edit the ``C:\ProgramData\Men and Mice\DHCP Server Controller\preferences.cfg`` file and add/edit the following:

.. code-block::

  <LogFileName value="C:\ProgramData\Men and Mice\DHCP Server Controller\mmremote.log" />
  <LogDestination value="3"/>
  <LogLevel value="5" />

(Amend the directory path as needed.)

Restart the DHCP agent.
