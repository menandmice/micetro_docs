.. meta::
   :description: Managing Appliances in the Micetreo Web Application
   :keywords: Men&Mice appliances, DNS management, DNS/DHCP appliance, DNS caching appliance, Men&Mice, BDDS appliances

.. _webapp-appliance-management:

Appliance Management
====================
There are two types of Men&Mice Appliances: a DNS/DHCP Appliance and a DNS Caching Appliance.

DNS/DHCP Appliance
  Can be used as a DNS and a DHCP server. Once the DNS/DHCP appliance has been configured and added to in :ref:`webapp-server-management`, you work with the DNS and DHCP server just as you would work with the BIND and ISC DHCP servers.

DNS Caching Appliance
  Contains a high-performance Caching-only DNS server. See :ref:`caching-appliance` for information on managing the DNS server on the DNS Caching appliance.

.. note::
  Separate activation keys are required to add and manage a Men&Mice Appliance. The DNS/DHCP Appliance and the DNS Caching Appliance use different activation keys.

Unless otherwise stated, the information in this chapter applies to both the DNS/DHCP Appliance and the DNS Caching Appliance.

To access appliances:

1. Go to the :guilabel:`Admin` page.
2. Click the :guilabel:`Service Management` tab in the upper-left corner.
3. Appliances are displayed under :guilabel:`Appliances` in the left sidebar.

**IMAGE HERE**

.. note::
   For information about how to manage services, see :ref:`webapp-server-management`.

Adding a New Appliance
-----------------------
You must have the permission to administer DNS to add a new appliance to Micetro.

1. Go to the :guilabel:`Admin` page.
2. Click the :guilabel:`Service Management` tab in the upper-left corner.
3. Click :guilabel:`Add Service`. The Add Service wizard opens.
4. Choose the appliance you want to use.
5. Enter the host name of the appliance. Note that this name is also used for the DNS and DHCP services hosted on the appliance.
6. Optionally, provide the IP address of the appliance. The appliance name will still be used when displaying appliance information.
7. Click :guilabel:`Add`.


Editing Appliance Name
------------------------
This feature allows you to change the name or IP Address used to connect to your Men&Mice appliance. This is useful if you want to reference the appliance by a different name or if the appliance's IP address has changed.

To change the appliance name:

1. Locate the relevant appliance.
2. On the :guilabel:`Action` menu, select :guilabel:`Edit appliance`.
3. Change the appliance's name, and/or IP address (optional).

.. Note::
    Changing the name or IP address here only affects how you connect to the Men&Mice Appliance; it does not alter the actual IP address of the appliance itself.

4. Click :guilabel:`Save` when you are done.

Removing Appliances
-------------------

.. Note::
   This command is only available with the Administrator account.

To remove a Men&Mice appliance from Micetro:

1. Select the Appliance(s) you want to remove. To select multiple Appliances, hold down the Ctrl key while making your selection
On the toolbar, click the :guilabel:`Remove` button. A dialog box prompts you to confirm your decision. To remove the Appliance, click :guilabel:`Yes`. Otherwise, click :guilabel:`No` to keep the Appliance.

.. Warning::
   When you remove an appliance from Micetro, the DNS and DHCP servers hosted on the appliance are removed from Micetro as well.

Viewing Appliance History
---------------------------

Adding DNS Resolvers for BDDS Appliances
------------------------------------------
You can add IP addresses of DNS resolver servers.



NTP
--------

Downloading Support Information
--------------------------------
To help in troubleshooting, it is possible to generate and save support information for a Men&Mice Appliance. The support information file contains various information on the Men&Mice Appliance setup and helps the Men&Mice Support team diagnose problems you might have with the Appliance.

To generate a support information file:

1. Locate the applicable Appliance.
2. Right-click and, from the shortcut menu, select :guilabel:`Support Info`. A Save File dialog box displays. A default name for the support information file is mmSupportInfo.tgz. 3. Click :guilabel:`Save` to save the support information file.

.. Note::
   The support information file contains various text files in a .tgz archive. If you are interested in seeing the contents of the support information file, you can use any tool that can extract data from .tgz archives and look at the text files.

Configuring SNMP Monitoring on BDDS Appliances
-----------------------------------------------
You can use SNMP monitoring to get various information about the Men&Mice Appliance and receive SNMP traps if certain events occur on the Appliance.

To configure SNMP Monitoring on the Men&Mice Appliance:

Select the :guilabel:`Services` tab in the Appliance Properties dialog box.
Click the :guilabel:`Configure` button in the SNMP section. The SNMP configuration dialog box displays.

../../images/admin-appliance-snmp.png

Check the :guilabel:`SNMP Agent Enabled` checkbox to enable the SNMP agent. When the SNMP agent is enabled, you can retrieve information about the system using SNMP.
In the Community field, enter The community string (password) to use for the SNMP agent.
In the System Contact field, enter the email address of a contact person for the system.
Check the :guilabel:`SNMP Traps Enabled` checkbox to enable sending of SNMP traps. When sending SNMP traps is enabled, the appliances will send SNMP traps when certain events occur.
In the Trap Manager field, enter the host name of the computer that should receive the SNMP traps.
In the Trap Manager Port field, enter the port number the Manager uses for the SNMP traps.
In the Trap Community field, enter the community string (password) to use for the SNMP traps.
Click :guilabel:`Save` to save your settings and close the dialog box.

Shutting Down or Restarting the BDDS Appliances
-----------------------------------------------
You can shut down or restart the Men&Mice Appliance from the Maintenance tab in the Appliance Properties dialog box.

!DANGER!

If you shutdown the Men&Mice Appliance, it will be turned off and you will need physical access to the Men&Mice Appliance to turn it on again.

To shut down or restart the Men&Mice Appliance:

Select the :guilabel:`Maintenance` tab in the Appliance Properties dialog box.
Click the :guilabel:`Shutdown` or :guilabel:`Restart` button and click :guilabel:`OK` in the confirmation dialog box. The Men&Mice Appliance shuts down or restarts, depending on your selection.


Appliance management in the Men&Mice Management Console
--------------------------------------------------------

.. toctree::
  :maxdepth: 1

  appliance_management
