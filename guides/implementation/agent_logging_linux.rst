.. meta::
    :description: How to enable logging for the Micetro DNS and DHCP agents
    :keywords: Micetro, DNS agent, DHCP agent, troubleshooting, Linux

.. _controller-logging-linux:

Configuring logging for Micetro Agents on Linux
===============================================
Follow these instructions to configure logging for the Micetro DNS and DHCP Agents.

DNS Agent
---------
1. After installing the DNS agent, create the logging directory (``/var/cache/bind/mmsuite/`` in Ubuntu, or specify your own):

   .. code-block:: bash
    
    mkdir /var/named/mmsuite/logs/

2. Edit the ``/var/named/mmsuite/preferences.cfg`` file and add/edit the following:

   .. code-block::
      
      <LogFileName value="/var/named/mmsuite/logs/mmremote.log" />
      <LogDestination value="3"/>
      <LogLevel value="5" />

   (Amend the directory path as needed.)

3. Restart the DNS Agent:

   .. code-block:: bash

    systemctl restart mmremoteDHCP Agent

DHCP Agent
----------
1. After installing the DHCP agent, create the logging directory (``/var/mmsuite/dhcp_server_controller/logs/`` or specify your own):

   .. code-block:: bash

    mkdir /var/mmsuite/dhcp_server_controller/logs/

2. Edit the ``/var/mmsuite/dhcp_server_controller/preferences.cfg`` file and add/edit the following:

   .. code-block::
      
      <LogFileName value="/var/mmsuite/dhcp_server_controller/logs/mmremote.log" />
      <LogDestination value="3"/>
      <LogLevel value="5" />

   (Amend the directory path as needed.)

3. Restart the DHCP Agent:

   .. code-block:: bash

    systemctl restart mmremote
