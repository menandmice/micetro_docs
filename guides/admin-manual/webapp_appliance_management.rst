.. meta::
   :description: Managing Appliances in the Micetreo Web Application
   :keywords: Men&Mice appliances, DNS management, DNS/DHCP appliance, DNS caching appliance, Men&Mice, BDDS appliances

.. _webapp-appliance-management:

Integrating Appliances
=======================
Micetro offers seamless integration with compatible DNS/DHCP appliances, available in both hardware and virtual machine configuration. One of the key benefits of using Micetro with DNS/DHCP appliances is automation. It can automate routine tasks such as IP address allocation, DNS record updates, and DHCP lease management. This reduces manual effort and minimizes the risk of configuration errors.

There are two types of appliances available within Micetro: 

DNS/DHCP Appliance
  Serves both DNS and DHCP functions. Once configured and added to your server management, you can manage it just like BIND and ISC DHCP servers.
DNS Caching Appliance
  Contains a high-performance Caching-only DNS server. For information about managing the DNS server on the DNS Caching appliance, see :ref:`caching-appliance`.

.. note::
  Separate activation keys are required for adding and managing appliances, and distinct activation keys are used for the DNS/DHCP Appliance and the DNS Caching Appliance.

Unless otherwise stated, the information in this chapter applies to both the DNS/DHCP Appliance and the DNS Caching Appliance.

Appliances are accessed and managed on the :guilabel:`Admin` page:

.. image:: ../../images/appliances-10.6.png
   :width: 80%

Adding a New Appliance to Micetro
---------------------------------
You must have the permissions to administer DNS in order to add an appliance to Micetro.

Add a DNS/DHCP Server to Micetro to effectively manage services, optimize deployment processes, and oversee day-to-day server operations, all through the intuitive Micetro user interface. Once the appliance has been added and configured, you can interact with the services just as you would with other DNS and DHCP services within Micetro.

**To add an appliance**:

1. Navigate to the :guilabel:`Service Management` tab on the :guilabel:`Admin` page and click :guilabel:`Add Service`. The Add Service wizard opens.

   .. image:: ../../images/add-servive-dialog.png
      :width: 65%

2. Select the appliance you wish to integrate. 
3. Provide the host name for the appliance, which will also be used for the DNS and DHCP services hosted on the appliance.
4. Optionally, enter the IP address of the appliance. The appliance name will still be used when displaying appliance information.
5. Click :guilabel:`Add`.

Editing Appliance Name
------------------------
You can change the name or IP Address used to connect to your appliance. This is useful if you need to refer to the Appliance by another name or if you are connecting to the Appliance by an IP Address and the IP Address has changed.

**To change the appliance name**:

1. Go to the :guilabel:`Service Management` tab on the :guilabel:`Admin` page. 
2. In the filtering sidebar, select :guilabel:`Appliances`, then locate the specific appliance you wish to edit.
3. On the :guilabel:`Action` menu, select :guilabel:`Edit appliance`. You can also access this option on the Row menu by clicking :guilabel:`...`.
4. Modify the appliance's name, and/or IP address (optional).

.. Note::
    Changing the name or IP address here only affects how you connect to the appliance. It does not alter the actual IP address of the appliance itself.

5. Click :guilabel:`Save` when you are done.

Removing Appliances
-------------------
This command is only available for the Administrator role.

.. Warning::
   When you remove an appliance from Micetro, the DNS and DHCP servers hosted on the appliance are removed from Micetro as well.

**To remove an appliance from Micetro**:

1. Select the appliance(s) you want to remove. To select multiple appliances, hold down the Ctrl key while making your selection.
2. On the :guilabel:`Action` menu, select :guilabel:`Remove appliance`. Click :guilabel:`Yes` to confirm.

Viewing Appliance History
---------------------------
The :guilabel:`View history` option on the :guilabel:`Action` or the Row menu :guilabel:`...` opens the History window that shows a log of all changes that have been made to the appliance, including the date and time of the change, the name of the user who made it, the actions performed, and any comments entered by the user when saving changes to objects. For more information about how to view change history, see :ref:`view-change-history`.


Adding DNS Resolvers for BDDS Appliances
------------------------------------------
You can add IP addresses of DNS resolver servers.



NTP
--------

Downloading Support Information for BDDS Appliances
----------------------------------------------------
To help in troubleshooting, you may be asked to download support information for your BDDS appliance. This support information file holds crucial details about your appliance setup, aiding our support team in diagnosing and resolving any issues you may encounter.

the compression format for Data rakes for BDDS and perhaps if the filename are the same



**To download support information**:

1. Locate the specific BDDS appliance you are troubleshooting.
2. On the :guilabel:`Action` menu, select :guilabel:`Get support info`. You can also access this option on the Row menu :guilabel:`...`. 
3. Click :guilabel:`Download`.
4. Once the download is complete, forward the downloaded file to support@bluecatnetwoks.com.

.. Note::
   The support information file is packaged as a .tgz archive and contains various text files. If you wish to view the contents of the support information file, you can use any tool capable of extracting data from .tgz archives to access and review the enclosed text files.

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

Shutting Down or Restarting BDDS Appliances
--------------------------------------------
You can shut down or restart the BDDS appliances.
A big difference is that for Micetro appliances you need to have physical access to the machine to turn it on again, for BDDS on hardware we have a Dell iDRAC (also more generally called an IPMI) on the machine which can be used for remote management to the machine including turning.
.. warning::
   If you shut down the appliance, it will be turned off and you will need physical access to the appliance to turn it on again.

**To shut down or restart appliances**:

1. Select the appliance you want to restart or shut down.
2. On the :guilabel:`Action` menu, select :guilabel:`Shut down appliance` or :guilabel:`Restart appliance` and click :guilabel:`Yes` in the confirmation dialog box. The appliance shuts down or restarts, depending on your selection.

Appliance management in the Men&Mice Management Console
--------------------------------------------------------

.. toctree::
  :maxdepth: 1

  appliance_management
