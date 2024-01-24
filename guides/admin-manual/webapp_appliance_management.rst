.. meta::
   :description: Managing Appliances in the Micetreo Web Application
   :keywords: Men&Mice appliances, DNS management, DNS/DHCP appliance, DNS caching appliance, Men&Mice, BDDS appliances

.. _webapp-appliance-management:

Integrating and Managing Appliances
===================================
Micetro seamlessly integrates with compatible DNS/DHCP appliances, available in both hardware and virtual machine configuration. By integrating Micetro with appliances, you gain the power to effectively manage services, optimize deployment processes, and oversee day-to-day server operations, all through the intuitive Micetro user interface.

Once you have configured your appliance and added it to your :ref:`webapp-server-management`, you can interact with the services just as you would with other DNS and DHCP services within Micetro.

Appliances are accessed and managed in :guilabel:`Service Management` on the :guilabel:`Admin` page. 

.. image:: ../../images/appliances-10.6.png
   :width: 80%

Adding a New Appliance to Micetro
---------------------------------
To add an appliance to Micetro, you need to have the Administrator role.

**To add an appliance**:

1. Go to the :guilabel:`Service Management` tab on the :guilabel:`Admin` page, and select :guilabel:`Add Service`. The Add Service wizard opens.

   .. image:: ../../images/add-servive-dialog.png
      :width: 65%

2. Select :guilabel:`Appliance`. 
3. Provide the host name for the appliance, which will also be used for the DNS and DHCP services hosted on the appliance.
4. Optionally, enter the IP address of the appliance. The appliance name will still be used when displaying appliance information.
5. Enable or disable appliance services. By default, **DNS** and **DHCP** services are activated.  If you require remote remote access to your appliance for specific purposes, you can enable the **SSH** (Secure Shell) client.
6. Select :guilabel:`Add`. The appliance is added to the **Appliances** section, and its associated services are listed under **DNS Services** and **DHCP Services**.

Editing Appliance Name
-----------------------
You can change the name or IP address used to connect to your appliance. This is useful if you need to refer to the appliance by another name or if you are connecting to the appliance by an IP address and the IP address has changed. 

**To change the appliance name**:

1. Go to the :guilabel:`Service Management` tab on the :guilabel:`Admin` page. 
2. In the filtering sidebar, select :guilabel:`Appliances`, then select the specific appliance you wish to edit.
3. Select :guilabel:`Edit appliance` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.
4. Modify the appliance's name, an/or IP address (optional).

   .. Note::
       Changing the name or IP address here only affects how you connect to the appliance. It does not alter the actual IP address of the appliance itself.

5. Select :guilabel:`Save` when you are done.

Setting Appliance Services
--------------------------
You can enable or disable various appliance services to configure your appliance. 

**To enable/disable appliance services**:

1. Locate the specific appliance for which you want to set services.
2. Select :guilabel:`Set appliance services` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.
3. Enable or disable the desired services:

   * **DNS**: Enable this service to allow your appliance to participate in domain name resolution on the network.
   * **DHCP**: Enable this service if you want your appliance to manage dynamic IP address allocation on the network.
   * **SSH (Secure Shell)**: The SSH service is not enable by default. You can enable it when secure remote access is needed, such as for troubleshooting purposes.
   * **Firewall**: The firewall is a crucial security measure that protects your appliance against potential attacks. It is strongly recommended to keep the firewall enabled at all times to safeguard your server from threats. Disabling the firewall is NOT recommended. Disabling the firewall temporarily should only be done in situations where you have a deep understanding of the potential risks and have specific security measures in place to compensate for the loss of protection. Even in such cases, minimize the duration of firewall disablement and re-enable it as soon as possible.
4. Select :guilabel:`Save` when you are done.

Configuring DNS Resolvers 
-------------------------
To ensure optimal performance of your appliance, you can add the IP addresses of DNS resolver servers. This step helps your appliance efficiently resolve domain names and provide accurate network services.

**To set DNS resolvers**:

1. Locate the specific appliance for which you want to configure DNS resolvers. Ensure you select the correct appliance to avoid any disruptions in network services.
2. Select :guilabel:`Configure DNS resolvers` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.
3. In the Configure DNS resolvers dialog box, enter the IP addresses of the DNS resolver servers you want to set. It's important to ensure the accuracy of the IP addresses, as incorrect entries can lead to DNS resolution issues. You can set multiple DNS resolvers by listing their IP addresses on separate lines. This redundancy ensures uninterrupted DNS resolution even if one resolver becomes unavailable.
4. Select :guilabel:`Save` when you are done.

Configuring NTP on Appliances
------------------------------
Use the Network Time Protocol (NTP) service to maintain precise time synchronization across your network infrastructure. Accurate timekeeping ensures proper coordination of network events, security protocols, and compliance with reporting requirements.

**To configure NTP**:

1. Locate the specific appliance for which you wish to configure NTP. 
2. Select :guilabel:`Configure NTP` on either the :guilabel:`Action` or the Row :guilabel:`...` menu. 
3. Select the :guilabel:`Enable NTP service` checkbox to activate the NTP service on your appliance.
4. In the text box, enter the hostnames or IP addresses of the NTP servers from which you want to synchronize your appliance's clock. 

   .. Tip::
      Consider using multiple NTP servers for redundancy and increased reliability, ensuring continued time synchronization even if one server becomes inaccessible. 

5. Select :guilabel:`Save` when you are done.

Configuring SNMP Monitoring 
----------------------------
You can use Simple Network Management Protocol (SNMP) monitoring to gather comprehensive information about the appliance. SNMP is enabled by default on appliances, allowing you to access monitoring information without any additional configuration.

Micetro supports SNMP versions v2c and v3. Version v2c is a Community-Based SNMP, which means that it relies on a community string (similar to a password) for authentication, making it relatively simple to set up. Version v3, on the other hand, is a User-Based SNMP and provides enhanced security and authentication mechanisms. It introduces the concept of SNMP users and offers features like user authentication and data encryption.

**To configure SNMP Monitoring on appliances**:

1. Locate the specific appliance for which you want to configure SNMP monitoring.
2. Select :guilabel:`Configure SNMP` on either the :guilabel:`Action` or the Row :guilabel:`...` menu. 
3. The Configure SNMP dialog box opens with several options:

   .. image:: ../../images/appliances-snmp-10.6.png
      :width: 60%

   * **Name**: You can enter the name that will be reported through SNMP. By default, this is set as Bluecat.
   * **Location**: Enter a description of the system's physical location. By default, this is set as Toronto.
   * **Contact**: Enter the email address of the contact person responsible for the system. By default, this is set as the email address for BlueCat's support.
   * **Description**: Enter a brief description of the system.
   * **Enable SNMP v2c**: Select this option to enable the SNMP v2c protocol. 
    * **Community**: Enter the community string, which serves as a password for the SNMP v2c protocol.
   * **Enable SNMP v3**: Select this option to enable the SNMP v3 protocol.
    * **Username**: Enter the SNMP username for the SNMP user.
    * **Authentication**: Select either **MD5** or **SHA** authentication and enter the user password for the SNMP user. If you select **None**, the SNMP service doesn't require user authentication and doesn't encrypt the data it returns.
    * **Encryption**: Select either **DES** or **AES 128** encryption types, and provide the password used to encrypt the data. If you select **None**, the SNNMP service doesn't encrypt the data it returns.

4. Select :guilabel:`Save` to save your settings and close the dialog box.

Configuring Remote Logging Servers (Syslog)
-------------------------------------------
You can define multiple remote logging servers on your appliance to meet diverse logging needs. Centralizing syslog management across a network offers a multitude of advantages. This approach involves storing logs in a central location, providing IT professionals with streamlined troubleshooting processes, enhanced security monitoring capabilities, and simplified compliance and auditing procedures. By consolidating logs, resource optimization is achieved, particularly beneficial for devices with limited storage capacity. Additionally, centralized syslog management facilitates proactive alerting and notification systems, allowing administrators to address potential issues before they escalate. Configuring a remote logging server involves specifying several key properties, allowing you to customize server addresses, communication ports, protocols, log levels, service types, timestamp formats, and more.

**To configure Syslog**:

1. Locate the specific appliance for which you want to configure Syslog.
2. Select :guilabel:`Configure Syslog` on either the :guilabel:`Action` or the Row :guilabel:`...` menu. 
3. In the Configure Syslog dialog box, select :guilabel:`Add Server` to add a new logging server. Alternatively, modify the configuration of an existing server by selecting it and then :guilabel:`Edit` on the Row :guilabel:`...` menu. 

   .. image:: ../../images/appliance-edit-syslog.png
      :width: 65%

   * **Server Address**: Assign an IP address to each remote logging server. 
   * **Port Number**: Specify the communication port. 
   * **Protocol**: Select the transport protocol that aligns with the requirements (TCP or UDP). 
   * **Log Level**: Select the desired log level.
   * **Service Types**: Define service types to filter by. 
   * **With ISO Timestamp**: Decide whether to use the ISO format for timestamps, with customization available for each remote server and locally on the appliance itself. 
   * **RFC-5424**: Choose between using RFC-5424 (Syslog protocol) or defaulting to RFC-3164 (BDS syslog protocol) if not explicitly selected. 

**To remove a remote syslog server**:

1. In the Configure Syslog dialog box, select the server you wish to remove.
2. On the Row :guilabel:`...` menu, select :guilabel:`Remove`.

Configuring Network Settings
----------------------------
Using the network settings, you can enable or disable IPv6 and change the IP address, network mask, and routing information for the appliance. You can also enable and configure the secondary network interface (eth1) on the appliance.

Enabling/Disabling the Secondary Network Interface (eth1)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The appliance has two network interfaces. The primary network interface (eth0) is enabled by default.

**To enable or disable the secondary network interface (eth1)**:

1. Locate the specific appliance for which you want to configure network settings.
2. Select :guilabel:`Network settings` on either the :guilabel:`Action` or the Row :guilabel:`...` menu. 
3. Check the :guilabel:`Enabled` checkbox to enable the eth1 interface. To disable the interface, uncheck the checkbox.

   .. image:: ../../images/admin-appliance-secondary-network-interface.png
     :width: 70%
     :align: center

4. Click :guilabel:`Save` to save your settings.

Enabling/disabling IPv6 addresses on the primary/secondary network interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

IPv6 can be enabled on either or both of the network interfaces on the Men&Mice Appliance.

To enable or disable IPv6 on the Men&Mice Appliance do the following:

1. Select the :guilabel:`Network` tab in the *Appliance Properties* dialog box.

2. Click the :guilabel:`Configure` button in the *Interface* section for the interface you want to configure. The *interface configuration* dialog box displays.

3. Click the :guilabel:`IPv6` tab in the *interface configuration* dialog box.

..

4. Check the :guilabel:`IPv6 Enabled` checkbox to enable IPv6 on the selected interface. To disable IPv6 on the interface interface, uncheck the checkbox.

5. Click :guilabel:`Save` to save your settings.

When IPv6 is enabled, the Link-local address and any dynamically assigned addresses for the interface are displayed in the dialog box.

Configuring IPv4 addresses on the primary/secondary network interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each interface on the Men&Mice Appliance can have one or more IPv4 addresses assigned to it.

To configure IPv4 addresses on the Appliance, do the following:

1. Select the :guilabel:`Network` tab in the *Appliance Properties* dialog box.

2. Click the :guilabel:`Configure` button in the *Interface* section for the interface you want to configure. The *interface configuration* dialog box is displayed with the *IPv4* tab selected.

.. image:: ../../images/admin-appliance-ipv4.png
  :width: 50%
  :align: center

3. In the **IPv4 Address** field enter the IPv4 IP address for the Men&Mice Appliance. NOTE: The main IPv4 address on the primary network interface (eth0) is used by Micetro to communicate with the Appliance. If you change the main IPv4 address of the primary network interface, you will lose the connection to the Appliance once the changes are saved, and you must update the connection information for the Appliance. Refer to :ref:`edit-appliance-name` for details on how to change the connection information.

4. In the **Subnet Mask** field, enter the subnet mask to use.

5. In the **Default Route** field, enter the default IPv4 route.

6. If you want to add more IPv4 IP addresses for the Men&Mice Appliance, click the :guilabel:`Add` button next to the IPv4 Aliases list and enter the relevant IP address information.

To edit or delete additional IPv4 addresses, use the :guilabel:`Edit` and :guilabel:`Delete` buttons next to the IPv4 Aliases list.

Configuring IPv6 addresses on the primary/secondary network interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each interface on the Men&Mice Appliance can have one or more addresses assigned to it.

To configure IPv6 addresses on the Appliance, do the following:

1. Select the :guilabel:`Network` tab in the *Appliance Properties* dialog box.

2. Click the :guilabel:`Configure` button in the *Interface* section for the interface you want to configure. The *interface configuration* dialog box is displayed with the *IPv4* tab selected.

3. Click the :guilabel:`IPv6` tab in the *interface configuration* dialog box

.. image:: ../../images/admin-appliance-configure-ipv6.png
  :width: 50%
  :align: center

4. Select the :guilabel:`IPv6 Enabled` checkbox to enable IPv6

5. Click the :guilabel:`Add` button to add a new IPv6 address.

.. image:: ../../images/admin-appliance-add-ipv6.png
  :width: 50%
  :align: center

6. Enter the **IPv6 address** and the **Prefix length**.

7. Click :guilabel:`OK` to add the IPv6 address.

To edit or delete IPv6 addresses, use the :guilabel:`Edit` and :guilabel:`Delete` buttons next to the IPv4 Addresses list.

Configuring the Network Mode on the primary/secondary network interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It is possible to change the network speed and duplex mode for the network interfaces on the Men&Mice Appliance.

To change the Network Mode on the Men&Mice Appliance do the following:

1. Select the :guilabel:`Network` tab in the *Appliance Properties* dialog box.

2. Click the :guilabel:`Configure` button in the *Interface* section for the interface you want to configure. The *interface configuration* dialog box displays.

3. Click the :guilabel:`Hardware` tab in the *interface configuration* dialog box. The MAC address of the interface is shown and a drop-down box with the available network modes displays.

.. image:: ../../images/admin-appliance-network-mode.png
  :width: 50%
  :align: center

Configuring IPv4 routing information
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To configure IPv4 routing on the Appliance, do the following:

1. Select the :guilabel:`Network` tab in the *Appliance Properties* dialog box.

2. Click the :guilabel:`Configure` button in the *Routing* section. The *routing configuration* dialog box is displayed with the *IPv4* tab selected.

.. image:: ../../images/admin-appliance-ipv4-routing.png
  :width: 50%
  :align: center

3. Enter the **default route** to use for IPv4.

4. If needed, click the :guilabel:`Add` button to add a new IPv4 route.

.. image:: ../../images/admin-appliance-add-ipv4-route.png
  :width: 50%
  :align: center

5. Enter the **destination**, **prefix**, and **gateway**.

6. Click :guilabel:`OK` to add the route.

To edit or delete routes, use the :guilabel:`Edit` and :guilabel:`Delete` buttons next to the IPv4 Routes list.

Configuring IPv6 routing information
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To configure IPv6 routing on the Appliance, do the following:

1. Select the :guilabel:`Network` tab in the *Appliance Properties* dialog box.

2. Click the :guilabel:`Configure` button in the *Routing* section. The *routing configuration* dialog box is displayed with the *IPv4* tab selected.

3. Click the :guilabel:`IPv6` tab in the *routing configuration* dialog box.

.. image:: ../../images/admin-appliance-ipv6-routing.png
  :width: 50%
  :align: center

4. Enter the **default route** to use for IPv6 and choose the interface for the route. You can choose the enabled interfaces or Auto.

5. If needed, click the :guilabel:`Add` button to add a new IPv6 route.

.. THIS DOESN'T SEEM LIKE THE RIGHT SCREENSHOT 🧐

.. image:: ../../images/admin-appliance-add-ipv6-route.png
  :width: 50%
  :align: center

6. Enter the **destination**, **prefix** and **gateway** and choose the **interface** for the route. Click :guilabel:`OK` to add the route.

To edit or delete routes, use the :guilabel:`Edit` and :guilabel:`Delete` buttons next to the *IPv6 Routes* list.
Moving Appliances to a Different Address Space
-----------------------------------------------
DNS servers, DHCP servers, IP Address ranges, and individual IP Address entries can be moved between address spaces. When an object is moved between address spaces, all properties for the object are retained, including its access settings and change history. You must have the relevant administrator privileges to move objects to a different address space.

Downloading Support Information for Appliances
-----------------------------------------------
To help in troubleshooting, you may be asked to download support information for your appliance. This support information file holds crucial details about your appliance setup, aiding our support team in diagnosing and resolving any issues you may encounter.

**To download support information**:

1. Locate the specific appliance you are troubleshooting. 
2. Select :guilabel:`Get support info` on either the :guilabel:`Action` or the Row :guilabel:`...` menu. 
3. Select :guilabel:`Download`.
4. Once the download is complete, forward the downloaded file to support@bluecatnetworks.com.

.. Note::
   The support information file is packaged as a .tgz archive and contains various text files. If you wish to view the contents of the support information file, you can use any tool capable of extracting data from .tgz archives to access and review the enclosed text files.

Shutting Down or Restarting Appliances
---------------------------------------
You can shut down or restart the appliances.

.. note::
   For appliances equipped with an Integrated Dell Remote Access Controller (iDRAC), the iDRAC continues running when the appliance is shut down. This means that it can be accessed via the local network to power on the appliance without requiring physical access.
   If you shut down an appliance that is not equipped with iDRAC, it will be turned off and you will need physical access to the appliance to turn it on again.
   Consult the specifications for your appliance for more information on its remote access capabilities.

**To shut down or restart appliances**:

1. Select the appliance you want to restart or shut down.
2. On the :guilabel:`Action` menu, select :guilabel:`Shut down appliance` or :guilabel:`Restart appliance` and select :guilabel:`Yes` in the confirmation dialog box. The appliance shuts down or restarts, depending on your selection.

Removing Appliances
-------------------
This command is only available for the Administrator role.

.. Warning::
   When you remove an appliance from Micetro, the DNS and DHCP services hosted on the appliance are removed from Micetro as well.

**To remove an appliance from Micetro**:

1. Select the appliance(s) you want to remove. To select multiple appliances, hold down the **Ctrl** key while making your selection.
2. On the :guilabel:`Action` menu, select :guilabel:`Remove appliance`. Select :guilabel:`Yes` to confirm.

Viewing Appliance History
---------------------------
The :guilabel:`View history` option on the :guilabel:`Action` or the Row menu :guilabel:`...` opens the History window that shows a log of all changes that have been made to the appliance, including the date and time of the change, the name of the user who made it, the actions performed, and any comments entered by the user when saving changes to objects. For more information about how to view change history, see :ref:`view-change-history`.

Backup and Restore
------------------
Micetro automatically takes a backup of your appliance's configuration every 15 minutes, capturing any changes made since the last backup. Additionally, a full backup is taken once every 24 hours, and all the incremental backups are managed and cleaned up for you.

When an appliance experiences a crash and becomes unusable, you can use these backups to set up a new appliance as a replacement, while maintaining the same IP address. 

Micetro automatically detects the new server as uninitialized. To begin using the new server, you need to initialize it. uninitialized

**To initialize a server**:

1. Locate the uninitialized server.
2. Select :guilabel:`Initialize appliance` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.

   .. image:: ../../images/appliance-backup-restore-11.png
      :width: 65%

   * **Use data from Micetro**: This option allows you to initialize the server using the data saved in Micetro.
   * **Use data from the new appliance**: Use this option if you want to initialize the server with the data from the new appliance itself.

|
**See also**:

* :ref:`updates`

* :ref:`webapp-server-management`

* :ref:`appliance-management`

* :ref:`caching-appliance`
