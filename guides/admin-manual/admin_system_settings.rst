.. meta::
   :description: Micetro´+s system Settings to configure sign-ons, enabling AD sites and subnets integration, determining IP addresses in use and other advanced settings.   
   :keywords: DNS, DHCP, Micetro's system settings

.. _admin-system-settings:

System Settings
================================================
Administrators can apply system-wide settings in System Settings.

**To access the System Settings:**

#. Select **Admin** on the top navigation bar.
#. Click **Configuration** on the menu bar at the top of the admin workspace.
#. Select **System settings** in the left pane.

   .. image:: ../../images/admin-system-settings.png
     :width: 75%
     :align: center

The System Settings include the following categories:

  * :ref:`admin-general`

  * :ref:`admin-logging`

  * :ref:`admin-error-checking`

  * :ref:`admin-dns`

  * :ref:`admin-ipam`

  * :ref:`admin-monitoring`

  * :ref:`admin-advanced`

  * :ref:`admin-management-console`

.. _admin-generale:

General
-------

Here you can configure the following:

  * Save Comments for Micetro 

  * Settings for Active Directory (AD) Sites and Subnets integration 

  * Rules to determine when an IP address is considered as being in use 

Enable AD sites and subnets integration
  When selected, all AD sites and their corresponding subnets will be displayed in Micetro, and you can add and remove subnets from sites and move subnets between different sites as needed. AD sites and subnets will be listed on the **AD Sites** menu in the IPAM workspace.
  
  If you want to synchronize the  Location  and  Description  fields of the subnets in Active Directory with custom properties in Micetro, choose the desired custom properties to synchronize against. When synchronization is active, any changes made to the fields in Active Directory will automatically update the corresponding fields in Micetro, and vice versa. See :ref:`active-directory`.

Enforce AD site inheritance
  When site inheritance is enforced, child subnets must reside in the same site as the parent subnet. If site inheritance is not enforced, child subnets can be placed in different sites than the parent subnet. See :ref:`active-directory`.

Determine Address in use
  Control how IP addresses are identified as being in use. To specify which rules should be applied to IP addresses, select the appropriate checkboxes.


.. _admin-logging:

Logging
-------

The Logging settings allow you to specify when log messages should be deleted and whether lease history for DHCP servers should be collected.

Purge log message after ____  days
  Enter the number of days the logs should be kept before they are deleted.

Log extra information when address collection is triggered
  When selected, information about the start and duration of the address collection is written in the Micetro log file.

Lease History
  Here you can select to start collecting lease history for DHCP servers. By viewing the DHCP lease history, you can quickly identify any potential issues or conflicts.
  
  You can specify the number of days to keep the history before it is deleted, and if you want to save the history to a comma separated text file before it is deleted, select the **Flush lease history to file befor purging**, and then enter a name for the file.

    
.. _admin-error-checking:

Error Checking
--------------

In this section you can specify how the system reports certain errors related to DHCP and DNS. You can also enable or disable DHCP scope monitoring.

Ignore missing reverse zones
  An error message displays when Micetro is unable to update a reverse record for a changed address record. It is possible to suppress this error message if no reverse zone exists for the given address record by selecting the Ignore missing reverse zones checkbox.

Warn when creating A/AAAA records with name that already exists.
  When enabled, a warning message displays if a user creates an address (A or AAAA) record using the name of an existing record of the same type.

Inconsistencies in DHCP lease names and DNS names.
  When enabled, an icon displays for each DHCP lease for which the DNS name does not match the lease name. The user can click on the icon and display a dialog box showing details about the error and (if applicable) how to fix it.

Address pool collisions.
  When enabled, an icon displays in split scope entries if the address pool in the scope collides with the address pool of another split scope instance. The user can click on the icon and display a dialog box showing details about the error and (if applicable) how to fix it.

Inconsistencies between reservation names in split scopes.
  When enabled, an icon displays in split scope entries if a reservation name in a split scope differs from the reservation name in another split scope instance. The user can click on the icon and display a dialog box showing details about the error and (if applicable) how to fix it.

Inconsistencies between reservation descriptions in split scopes.
  When enabled, an icon displays in split scope entries if a reservation description in a split scope differs from the reservation description in another split scope instance. The user can click on the icon and display a dialog box showing details about the error and (if applicable) how to fix it.

When all selections/entries are made, click :guilabel:`OK`.

.. _admin-dns:

DNS
---

Here you can specify various DNS related settings. 

Delegation records
  When selected, Micetro will automatically create delegation records (NS records) in the corresponding parent zones whenever subzones are created. This ensures that the delegation chain between parent and subzones is maintained correctly.

Adjust Zone Transfer
  Allow Micetro to automatically adjust zone transfer settings on Microsoft DNS servers to enable management of dynamic and Active Directory integrated zones.

DNSSEC
  Include derived DNSSEC records when viewing DNSSEC signed zones in Micetro. Note that this will significantly increase the size of the Micetro database and may affect overall system performance.


.. _admin-ipam:

IPAM
----

This section allows you to specify various IPAM related settings:

  * How the system should handle new subranges if the parent range is in a folder.

  * How the system should behave when naming conflicts between existing IP Address ranges and DHCP scopes occur.
  
  * How the system should behave if DHCP scopes are removed outside Micetro.
  
  * Whether the system should allow reservations inside address pools on ISC DHCP servers.


Subranges
  Select the desired options to determine what happens when a user creates a subrange of a range in a folder.
  
Name conflicts between ranges and scopes
  Specify what happens if the name of an MS DHCP scope does not match the name of an existing IP Address range.
  
  When **Apply same rule for scope description as for scope name above** is selected, the system will use the same rules to update scope description as it does for updating scope names.

DHCP Scope Deletion
  If a scope is removed directly from a DHCP server (instead of using Micetro), you can select whether to convert it to an IP Address range or remove it completely.

Allow reservations inside pools on ISC DHCP servers
  When selected, the system allows users to create reservations inside pools on ISC DHCP servers. When a reservation is created inside a pool, the pool is split to make space for the reservation.

  .. warning::
    If a reservation that has been created inside a pool is deleted, the address is not made a part of the pool again.

Show DHCP data in subranges of scopes
  When selected, the system will display contents of subranges of scopes in the same view that is used for scopes and users with the required privileges will be able to work with reservations in these subranges. If the checkbox is not selected, contents of subranges of scopes will be displayed in the regular range view.

Allow allocation of IP Addresses from IP Address Containers
  When selected, the system will allow allocation of IP Addresses that reside in IP Address Containers. For more information on IP Address Containers,  refer to  IPAM Settings.

Enable Cloud integration
  Check this checkbox to enable the Cloud integration feature. When Cloud integration is active you can add OpenStack clouds to Micetro. You can manage cloud networks and and you can add and remove subnets from cloud networks and move subnets to cloud networks. Cloud integration has been enabled, a :guilabel:`Cloud` object displays in the object list on the left hand side of the Manager window and a new column, *Cloud Network* displays in the range list in the Manager window.


.. _admin-monitoring:

Monitoring
----------

Here you can specify various monitoring related settings.

Ping before automatic assignment
  When selected, when an IP Address is being auto-assigned, the system checks as to whether the IP Address is responding to a ping request before it is allocated to a new host. If the IP Address responds to the ping request, it is not used for auto-assignment.

Automatic assignment ping timeout _____ ms
  Specifies how long the system should wait (in milliseconds) for a response to the ping request. If a response is not received within the specified time, the system considers this to be a non-responding IP Address.

Enable subnet monitoring
  When enabled, the system monitors the free addresses in DHCP address pools and subnets, and performs an action if the number of free addresses goes below a user-definable threshold. When subnet monitoring has been enabled, it is possible to configure the global settings for this feature by clicking the Details button.

  .. note::
    The global subnet monitoring setting can be overridden for individual subnets by changing the setting explicitly for the subnet. Refer to  IP Address Management—Subnet Monitoring and Utilization History  for information on how to change monitoring settings for individual subnets.

  To change the subnet monitoring settings, do the following:

    1. Click the Defaults... button. The Subnet Monitoring dialog box displays.

    .. image:: ../../images/admin-subnet-monitoring.png
      :width: 40%
      :align: center

    Enabled.
      When checked, all subnets are monitored by default. If you only want to monitor a subset of the subnets in the system, leave this checkbox unchecked and enable monitoring for the individual subnets instead by selecting the subnet and then selecting Set Subnet Monitoring from the Range menu.

    Script to invoke.
      Enter the path of the script to run when the number of free addresses goes below the set threshold. Refer to External Scripts for information on the script interface and the format for calling the script.

    Dynamic Threshold.
      Enter the threshold for the free addresses in a DHCP scope address pool.

      .. note::
        For split scopes and scopes in a superscope (on MS DHCP servers) and address pools using the shared-network feature on ISC DHCP servers, the total number of free addresses in all of the scope instances is used when calculating the number of free addresses.

    Static Threshold.
      Enter the threshold for the free addresses in a subnet.

    Only perform action once (until fixed).
      When checked, the action is performed only once when the number of free addresses goes below the threshold.

    Perform action when fixed.
      When checked, the action is performed when the number of free addresses is no longer below the threshold.

  When subnet monitoring is enabled, a new column, Monitoring, displays when viewing the subnet list. To quickly see all subnets that are monitored, you can use the Quick Filter and filter by this column by entering "Monitor: Yes" in the Quick Filter search field.

  .. note::
    Only DHCP scopes that are enabled are monitored. Disabled scopes are ignored.

  When subnet monitoring is enabled, you must specify the mail server and the sender e-mail address to use if you want the subnet monitor to send an e-mail. Place the appropriate information in the SMTP Server and Mail from fields.

Enable sending SNMP traps
  When enabled, the system will send SNMP traps when certain events occur:

    * When the number of free IP Addresses in monitored subnets goes below a user-definable threshold.

    * When a log event of type Error or Notice occurs. Refer to :ref:`admin-logging` for more information on log events.

  When enabling sending of SNMP traps, you must provide additional information:

    Manager name
      Enter the host name of the computer that should receive the SNMP traps.

    Manager port
      Enter the port number the Manager uses for the SNMP traps.

    Community
      Enter the community string (password) to use for the SNMP traps.

Enable collection of IP information from routers.
  When enabled, the system will query hosts that have been specified as routers for IP information. This feature is used along with the host discovery Ping feature to find active IP Addresses on the network. Refer to IP Address Management—Host Discovery for more information on how to specify hosts as routers.

  When this feature is enabled, some additional information must be provided:

    SNMP query interval.
      Determines how frequently the routers are queried for IP information.

    Router SNMP community.
      Enter the SNMP community string (password) to use when querying the routers for IP information.

.. _admin-advanced:

Advanced
--------



.. _admin-management-console:

Management Console
------------------

Inconsistencies in DHCP lease names and DNS names
   When enabled, an icon displays for each DHCP lease for which the DNS name does not match the lease name. The user can click on the icon and display a dialog box showing details about the error and (if applicable) how to fix it. 
   
Address pool collisions
   When enabled, an icon displays in split scope entries if the address pool in the scope collides with the address pool of another split scope instance. The user can click on the icon and display a dialog box showing details about the error and (if applicable) how to fix it. 
   
Inconsistencies between reservation names in split scopes
   When enabled, an icon displays in split scope entries if a reservation name in a split scope differs from the reservation name in another split scope instance. The user can click on the icon and display a dialog box showing details about the error and (if applicable) how to fix it. 
   
Inconsistencies between reservation descriptions in split scopes
   When enabled, an icon displays in split scope entries if a reservation description in a split scope differs from the reservation description in another split scope instance. The user can click on the icon and display a dialog box showing details about the error and (if applicable) how to fix it
   
   If a reservation that has been created inside a pool is deleted, the address is not made a part of the pool again. 
   
Show DHCP data in subranges of scopes
   When selected, the system will display contents of subranges of scopes in the same view that is used for scopes and users with the required privileges will be able to work with reservations in these subranges. If the checkbox is not selected, contents of subranges of scopes will be displayed in the regular range view.
   
Ping before automatic assignment
   When selected, when an IP Address is being auto assigned, the system checks as to whether the IP Address is responding to a ping request before it is allocated to a new host. If the IP Address responds to the ping request, it is not used for auto-assignment. 
   
Automatic assignment ping timeout _____ ms
   Specifies how long the system should wait (in milliseconds) for a response to the ping request. If a response is not received within the specified time, the system considers this to be a non-responding IP Address. 
