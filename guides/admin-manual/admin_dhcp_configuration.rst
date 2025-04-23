.. meta::
   :description: Editing the configuration of services on DHCP servers in Micetro
   :keywords: DHCP, DHCP servers, DHCP configuration

.. _admin-dhcp-config:

Editing DHCP Service Configuration
==================================
When necessary, you can edit the configuration of a DHCP service in Micetro. Configurations differ based on which type of DHCP service you select. For example, you can configure ISC DHCP servers to dynamically update zones on Micetro appliances. Refer to the following tabs for type-specific instructions:


.. tabs::

    .. tab:: Cisco IOS

        1. In the data grid, locate the Cisco IOS DHCP service whose configuration you want to edit.

        2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Edit configuration`.

        3. In the **Edit Configuration** dialog, edit the configuration as needed.

        4. Select :guilabel:`Save`.

    .. tab:: ISC 
    
        1. In the data grid, locate the ISC DHCP service whose configuration you want to edit.

        2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Edit configuration`.

        3. In the **Edit Configuration** dialog, edit the configuration as needed:

           .. image:: ../../images/dhcp-isc-config-11.png
            :width: 80%
        
         * **Authoritative**: Determines whether the server has the authority to validate DHCP requests from clients.
         * **DDNS Domain Name**: Specifies the DNS domain name used to store the A record for DHCP clients.
         * **DDNS Update Style**: Determines the method the DHCP server uses to perform DNS updates. Options include:
            * **None**: No dynamic DNS updates are performed.
            * **Interim**: Recommended method for dynamic DNS updates.
         * **DDNS Updates**: Enables or disables DNS updates. This setting is only effective if DNS updates are globally enabled with the DDNS Update Style setting.
         * **DDNS TTL**: Sets the Time-to-Live (TTL) value for DNS updates, in seconds.
         * **Default Lease Time**: Specifies the default lease duration for DHCP leases, in seconds.
         * **Log Facility**: Select the syslog facility for logging DHCP server messages. Not all facilities may be available on all systems.
         * **Max/Min Lease Times**: Sets the maximum and minimum lease durations for DHCP leases, in seconds.
         * **Get Lease Hostnames**: Specifies whether the DHCP server should perfrom a reverse DNS lookup for each address assigned to a client and send the result to the client as the hostname option.
         * **One Lease per Client**: Controls whether existing leases held by a client should be released when requesting a new lease.
         * **Ping Check**: Specifies whether the DHCP server should send an ICMP echo message to probe an IP address before offering it to a DHCP client.
         * **Ping Timeout**: Specifies how many seconds the DHCP should wait for an ICMP echo response when Ping Check is active.
         * **Filename**: Specifies the name of the initial boot file used by a client.
         * **Server Name**: Specifies the name of the server from which the client should load its boot file.
         * **Next Server**: Specifies the host address of the server from which the initial boot file (specified by Filename) is to be loaded.
        
        4. (Optional) To configure the ISC DHCP server to update zones on Micetro appliances or BIND servers with dynamic updates, select the :guilabel:`Raw Configuration` tab.

            1. In the raw configuration editor, enter the following statements:

               .. code-block::

                key update-key
                {
                  algorithm hmac-sha512;
                  secret "5B1...";
                }

                zone micetro.com 
                {
                  primary 1.2.3.4;
                  key update-key;
                }

            **Make sure that**:

                * The key is not surrounded by double quotation marks.
                * Each line contains only one declaration.
            
            .. note::
                It's crucial to maintain the format of the zone and key statements as documented. Failure to adhere to this format may lead to issues with dynamic updates.
        
        5. Select :guilabel:`Save`.

    .. tab:: ISC Kea

        1. In the data grid, locate the MS DHCP service whose configuration you want to edit.

        2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Edit configuration`.

        3. In the **Edit Configuration** dialog, select either the :guilabel:`Properties for V4` or :guilabel:`Properties for V6` tab, depending on whether you want to edit the configuration of DHCPv4 or DHCPv6, and edit the configuration as needed:

           .. image:: ../../images/kea-dhcp-config.png
            :width: 80%
        
         * **Server tag**: An arbitrary string used to associate configuration elements with specific Kea server instances in a configuration database, allowing for shared or unique configurations among multiple servers.
         * **Default/Maximum/Minimum valid lifetime**: Specifies the time after which a lease will expire if not renewed.
         * **Renew timer**: Specifies the time when a client will begin a renewal procedure.
         * **Rebind timer**: Specifies the time when a client will begin a rebind procedure.
         * **Next server**: Specifies the server address to use when clients want to obtain configuration from a TFTP server.
         * **Echo client ID**: Specifies whether the server should send back client-id options when responding to clients.
         * **Match client ID**: Specifies whether the server should ignore the client identifier during lease lookups and allocations for a particular subnet.
         * **Decline probation period**: Specifies a probation time that will be set on addresses that are in use by some unknown entity.
         * **Control Socket Name**: The path to the UNIX socket. Cannot be empty.

        4. (Optional) For more specialized configurations, you can define additional properties on the :guilabel:`Raw Configuration`, where you can edit configuration files directly on the server for both DHCPv4 and DHCPv6.

           .. caution::
            Use caution when editing configuration files, as there is minimal error handling.
        
        5. Select :guilabel:`Save`.

    .. tab:: Microsoft

        1. In the data grid, locate the MS DHCP service whose configuration you want to edit.

        2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Edit configuration`.

        3. In the **Edit Configuration** dialog, edit the configuration as needed:

           .. image:: ../../images/windows-dhcp-configuration.png
            :width: 60%
   
         * **Conflict detection attempts**: Specifies the number of conflict detection attempts you want the DHCP server to make before it leases an address to a client.
         * **Audit log file path**: Specifies the location of the DHCP server audit log files.
         * **Database path**: Specifies the location of the DHCP server database.
         * **Backup path**: Specifies the location for the database backup.

        4. Select :guilabel:`Save`
