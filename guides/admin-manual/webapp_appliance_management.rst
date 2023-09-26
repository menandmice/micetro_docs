.. meta::
   :description: Managing Appliances in the Micetreo Web Application
   :keywords: Men&Mice appliances, DNS management, DNS/DHCP appliance, DNS caching appliance, Men&Mice, BDDS appliances

.. _webapp-appliance-management:

Integrating and Managing Appliances
===================================
Micetro offers seamless integration with compatible DNS/DHCP appliances, available in both hardware and virtual machine configuration. One of the key benefits of using Micetro with DNS/DHCP appliances is automation. It can automate routine tasks such as IP address allocation, DNS record updates, and DHCP lease management. This reduces manual effort and minimizes the risk of configuration errors.

There are two types of appliances available within Micetro: 

DNS/DHCP Appliance
  Serves both DNS and DHCP functions. Once configured and added to your :ref:`webapp-server-management`, you can manage it just like BIND and ISC DHCP servers.
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
You must have the permissions to administer DNS to add an appliance to Micetro.

Add a DNS/DHCP Server to Micetro to effectively manage services, optimize deployment processes, and oversee day-to-day server operations, all through the intuitive Micetro user interface. Once the appliance has been added and configured, you can interact with the services just as you would with other DNS and DHCP services within Micetro.

**To add an appliance**:

1. Navigate to the :guilabel:`Service Management` tab on the :guilabel:`Admin` page, and click :guilabel:`Add Service`. The Add Service wizard opens.

   .. image:: ../../images/add-servive-dialog.png
      :width: 65%

2. Select the appliance you wish to integrate. 
3. Provide the host name for the appliance, which will also be used for the DNS and DHCP services hosted on the appliance.
4. Optionally, enter the IP address of the appliance. The appliance name will still be used when displaying appliance information.
5. Click :guilabel:`Add`. The appliance is added to the **Appliances** section, and its associated services are listed under **DNS Services** and **DHCP Services**.

Editing Appliance Name
------------------------
You can change the name or IP Address used to connect to your appliance. This is useful if you need to refer to the Appliance by another name or if you are connecting to the Appliance by an IP Address and the IP Address has changed.

**To change the appliance name**:

1. Go to the :guilabel:`Service Management` tab on the :guilabel:`Admin` page. 
2. In the filtering sidebar, select :guilabel:`Appliances`, then select the specific appliance you wish to edit.
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
To ensure optimal performance of your BDDS appliance, you can add the IP addresses of DNS resolver servers. This step helps your appliance efficiently resolve domain names and provide accurate network services.

**To add DNS resolvers**:

1. Locate the specific BDDS appliance for which you want to configure DNS resolvers. Ensure you select the correct appliance to avoid any disruptions in network services.
2. On the :guilabel:`Action` menu, select :guilabel:`DNS resolvers`. You can also access this option on the Row menu :guilabel:`...`.
3. In the DNS resolvers configuration dialog box, enter the IP addresses of the DNS resolver servers you want to add. It's important to ensure the accuracy of the IP addresses, as incorrect entries can lead to DNS resolution issues. You can add multiple DNS resolvers by separating their IP addresses with commas or semicolons, depending on the configuration requirements of your BDDS appliance. This redundancy ensures uninterrupted DNS resolution even if one resolver becomes unavailable.
4. Click :guilabel:`Save` when you are done.

Configuring NTP on BDDS Appliances
----------------------------------
Use the Network Time Protocol (NTP) service to maintain precise time synchronization across your network infrastructure. Accurate timekeeping ensures proper coordination of network events, security protocols, and compliance with reporting requirements.

**To configure NTP**:

1. Locate the specific BDDS appliance for which you wish to configure NTP. 
2. On the :guilabel:`Action` menu, select :guilabel:`NTP configuration`. You can also access this option on the Row menu :guilabel:`...`. 
3. Select the :guilabel:`Enable NTP service` checkbox to activate the NTP service on your BDDS appliance.
4. In the text box, enter the hostname or IP address of the NTP server from which you want to synchronize your BDDS appliance's clock. 

   .. Tip::
      Consider using multiple NTP servers for redundancy and increased reliability, ensuring continued time synchronization even if one server becomes inaccessible. 

5. Click :guilabel:`Save` when you are done.

Downloading Support Information for BDDS Appliances
----------------------------------------------------
To help in troubleshooting, you may be asked to download support information for your BDDS appliance. This support information file holds crucial details about your appliance setup, aiding our support team in diagnosing and resolving any issues you may encounter.
[What do we need to add here? What must the user consider/take notice of? (format for data rakes and same file names)]

**To download support information**:

1. Locate the specific BDDS appliance you are troubleshooting. 
2. On the :guilabel:`Action` menu, select :guilabel:`Get support info`. You can also access this option on the Row menu :guilabel:`...`. 
3. Click :guilabel:`Download`.
4. Once the download is complete, forward the downloaded file to support@bluecatnetwoks.com.

.. Note::
   The support information file is packaged as a .tgz archive and contains various text files. If you wish to view the contents of the support information file, you can use any tool capable of extracting data from .tgz archives to access and review the enclosed text files.

Configuring SNMP Monitoring on BDDS Appliances
-----------------------------------------------
You can use Simple Network Management Protocol (SNMP) monitoring to gather comprehensive information about the BDDS appliance and set up SNMP traps to receive notifications when specific events occur on the appliance.

Micetro supports SNMP versions v2c and v3. Version v2c is a Community-Based SNMP, which means that it relies on a community string (similar to a password) for authentication, making it relatively simple to set up.  Version v3, on the other hand, is a User-Based SNMP and provides enhanced security and authentication mechanisms. It introduces the concept of SNMP users and offers features like user authentication and data encryption.

**To configure SNMP Monitoring on BDDS appliances**:

1. Locate the specific BDDS appliance for which you want to configure SNMP monitoring.
2. On the :guilabel:`Action` menu, select :guilabel:`SNMP configuration`. You can also access this option on the Row menu :guilabel:`...`. 
3. The SNMP configuration dialog box opens with several options:

   .. image:: ../../images/appliances-snmp-10.6.png
      :width: 50%

   * **Name**: You can enter the name that will be reported through SNMP. By default, this is set as Bluecat.
   * **Location**: Enter a description of the system's physical location. By default, this is set as Toronto.
   * **Contact**: Enter the email address of the contact person responsible for the system. By default, this is set as the email address for BlueCat's support.
   * **Description**: Enter a brief description of the system.
   * **Enable SNMP v2c**: Select this option to enable the SNMP v2c protocol. 
    * **Community**: Enter the community string, which serves as a password for the SNMP v2c protocol.
   * **Enable SNMP v3**: Select this option to enable the SNMP v3 protocol.
    * **Username**: Enter the SNMP username for the SNMP user.
    * **Authentication**: Select either **MD5** or **SHA** authentication and enter the user password for the SNMP user. If you select **None**, the SNMP service doesn't require user authentication and doesn't encrypt the data it returns.
    * **Encryption**: Select either **DES** or **AES 128** encryption types, and provide the password used to encrypt the trap data. If you select **None**, the SNNMP service doesn't encrypt the data it returns.

4. Click :guilabel:`Save` to save your settings and close the dialog box.

Shutting Down or Restarting BDDS Appliances
--------------------------------------------
You can shut down or restart the BDDS appliances.

.. warning::
   If you shut down the appliance, it will be turned off and you will need physical access to the appliance to turn it on again.

**To shut down or restart appliances**:

1. Select the appliance you want to restart or shut down.
2. On the :guilabel:`Action` menu, select :guilabel:`Shut down appliance` or :guilabel:`Restart appliance` and click :guilabel:`Yes` in the confirmation dialog box. The appliance shuts down or restarts, depending on your selection.

**See also**:

.. toctree::
  :maxdepth: 1

updates
webapp_server_management
appliance_management
 