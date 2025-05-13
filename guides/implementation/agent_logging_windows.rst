.. meta::
    :description: How to enable logging for the Micetro DNS and DHCP agents
    :keywords: Micetro, DNS agent, DHCP agent, troubleshooting, Windows

.. _agent-logging-windows:

Configuring logging for Micetro Agents on Windows
=================================================
Follow these instructions to configure logging for the Micetro DNS and DHCP Agents.

DNS Agent
---------
1. After installing the DNS Agent, create the logging directory (``C:\ProgramData\Men and Mice\DNS Server Controller\logs`` or specify your own).

2. Edit the ``C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg`` file and add/edit the following:

   .. code-block::
      
      <LogFileName value="C:\ProgramData\Men and Mice\DNS Server Controller\logs\mmDnslog.txt" />
      <LogDestination value="3"/>
      <LogLevel value="5" />

   (Amend the directory path as needed.)

3. Restart the DNS Agent.

DHCP Agent
----------
1. After installing the DHCP Agent, create the logging directory (``C:\ProgramData\Men and Mice\DHCP Server Controller\logs`` or specify your own).

2. Edit the ``C:\ProgramData\Men and Mice\DHCP Server Controller\preferences.cfg`` file and add/edit the following:

   .. code-block::
      
      <LogFileName value="C:\ProgramData\Men and Mice\DHCP Server Controller\mmremote.log" />
      <LogDestination value="3"/>
      <LogLevel value="5" />
  
   (Amend the directory path as needed.)

3. Restart the DHCP Agent.
