.. meta::
   :description: Configuring SNMP monitoring on appliances in Micetro
   :keywords: appliances, DNS/DHCP appliance, MDDS appliances, SNMP, monitoring

.. _snmp-monitoring-appliances:

Configuring SNMP Monitoring
===========================
You can use Simple Network Management Protocol (SNMP) monitoring to gather comprehensive information about an appliance. SNMP is enabled on appliances by default, allowing you to access monitoring information without any additional configuration.

Micetro supports SNMP versions v2c and v3. 

* **Version v2c** is a community-based SNMP, meaning that it relies on a community string (similar to a password) for authentication, making it relatively simple to set up.
* **Version v3** is a user-based SNMP and provides enhanced security and authentication mechanisms. It introduces the concept of SNMP users and offers features like user authentication and data encryption.

**To configure SNMP monitoring on appliances**:

1. In the data grid, locate the specific appliance for which you want to configure SNMP monitoring.
2. Select :guilabel:`Configure SNMP` on either the :guilabel:`Action` or the Row :guilabel:`...` menu. 
3. The Configure SNMP dialog box opens with several options:

   .. image:: ../../images/appliances-snmp-10.6.png
      :width: 75%

   * **Name**: Enter the name that will be reported through SNMP. By default, this is set as "BlueCat".
   * **Location**: Enter a description of the system's physical location. By default, this is set as "Toronto".
   * **Contact**: Enter the email address of the contact person responsible for the system. By default, this is set as the email address for BlueCat Support.
   * **Description**: Enter a brief description of the system.
   * **Enable SNMP v2c**: Select this option to enable the SNMP v2c protocol. 
        * **Community**: Enter the community string, which serves as a password for the SNMP v2c protocol.
   * **Enable SNMP v3**: Select this option to enable the SNMP v3 protocol.
        * **Username**: Enter the SNMP username for the SNMP user.
        * **Authentication**: Select either **MD5** or **SHA** authentication and enter the user password for the SNMP user. If you select **None**, the SNMP service doesn't require user authentication and doesn't encrypt the data it returns.
        * **Encryption**: Select either **DES** or **AES 128** encryption types and enter the password used to encrypt the data. If you select **None**, the SNMP service doesn't encrypt the data it returns.

4. Select :guilabel:`Save` to save your settings.
