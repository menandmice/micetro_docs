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

.. _admin-general:

General
-------

Here you can configure the following:

  * Save Comments for Micetro 

  * Settings for Active Directory (AD) Sites and Subnets integration 

  * Rules to determine when an IP address is considered as being in use 

Single sign-on
^^^^^^^^^^^^^^^
When activated, users do not have to authenticate when logging in through the Management Console or the Command Line Interface. For more information about Single sign-on, see :ref:`external_auth/#multi-factor-authentication`

AD sites and subnets
^^^^^^^^^^^^^^^^^^^^^^
Enable AD sites and subnets integration
  When selected, all AD sites and their corresponding subnets will be displayed in Micetro, and you can add and remove subnets from sites and move subnets between different sites as needed. AD sites and subnets will be listed on the **AD Sites** menu in the IPAM workspace.
  
  If you want to synchronize the  Location  and  Description  fields of the subnets in Active Directory with custom properties in Micetro, choose the desired custom properties to synchronize against. When synchronization is active, any changes made to the fields in Active Directory will automatically update the corresponding fields in Micetro, and vice versa. See :ref:`active-directory`.

Enforce AD site inheritance
  When site inheritance is enforced, child subnets must reside in the same site as the parent subnet. If site inheritance is not enforced, child subnets can be placed in different sites than the parent subnet. See :ref:`active-directory`.

Determine Address usage
^^^^^^^^^^^^^^^^^^^^^^^
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
^^^^^^^^^^^^^^
  Here you can select to start collecting lease history for DHCP servers. By viewing the DHCP lease history, you can quickly identify any potential issues or conflicts.
  
  You can specify the number of days to keep the history before it is deleted, and if you want to save the history to a comma separated text file before it is deleted, select the **Flush lease history to file befor purging**, and then enter a name for the file.

    
.. _admin-error-checking:

Error Checking
--------------

In this section you can specify how the system reports certain errors related to DHCP and DNS. You can also enable or disable DHCP scope monitoring.

DNS errors
^^^^^^^^^^
Stop A/AAAA records from being created if the name already exists
  When selected, the creation of A and AAAA redords will be prevented, if a record with the same name already exists in the DNS zone.

Ignore missing reverse zones
  An error message displays when Micetro is unable to update a reverse record for a changed address record. It is possible to suppress this error message if no reverse zone exists for the given address record by selecting the Ignore missing reverse zones checkbox.


.. _admin-dns:

DNS
---

Here you can specify various DNS related settings. 

Delegation records
^^^^^^^^^^^^^^^^^^^
  When activated, Micetro will automatically create delegation records (NS records) in the corresponding parent zones whenever subzones are created. This ensures that the delegation chain between parent and subzones is maintained correctly.

Adjust Zone Transfer
^^^^^^^^^^^^^^^^^^^^
  Allow Micetro to automatically adjust zone transfer settings on Microsoft DNS servers to enable management of dynamic and Active Directory integrated zones.

DNSSEC
^^^^^^
  Include derived DNSSEC records when viewing DNSSEC signed zones in Micetro. Note that this will significantly increase the size of the Micetro database and may affect overall system performance.


.. _admin-ipam:

IPAM
----

This section allows you to specify various IPAM related settings:

  * How the system should handle new subranges if the parent range is in a folder.

  * How the system should behave when naming conflicts between existing IP address ranges and DHCP scopes occur.
  
  * How the system should behave if DHCP scopes are removed outside Micetro.
  
  * Whether the system should allow reservations inside address pools on ISC DHCP servers.


Subranges
  Select the desired options to determine what happens when a user creates a subrange of a range in a folder.
  
Name conflicts between ranges and scopes
  Specify what happens if the name of an MS DHCP scope does not match the name of an existing IP address range.
  
  When **Apply same rule for scope description as for scope name above** is selected, the system will use the same rules to update scope description as it does for updating scope names.

DHCP Scope Deletion
  If a scope is removed directly from a DHCP server (instead of using Micetro), you can select whether to convert it to an IP address range or remove it completely.

Allow reservations inside pools on ISC DHCP servers
  When selected, the system allows users to create reservations inside pools on ISC DHCP servers. When a reservation is created inside a pool, the pool is split to make space for the reservation.

  .. warning::
    If a reservation that has been created inside a pool is deleted, the address is not made a part of the pool again.


Allow allocation of IP addresses from IP address Containers
  When selected, the system will allow allocation of IP addresses that reside in IP address Containers. For more information on IP address Containers,  refer to  IPAM Settings.

Enable Cloud integration
  Check this checkbox to enable the Cloud integration feature. When Cloud integration is active you can add OpenStack clouds to Micetro. You can manage cloud networks and and you can add and remove subnets from cloud networks and move subnets to cloud networks. Cloud integration has been enabled, a :guilabel:`Cloud` object displays in the object list on the left hand side of the Manager window and a new column, *Cloud Network* displays in the range list in the Manager window.


.. _admin-monitoring:

Monitoring
----------

Here you can specify various monitoring related settings.

Subnet monitoring
^^^^^^^^^^^^^^^^^
Enable subnet monitoring
  When enabled, the system monitors the free addresses in DHCP address pools and subnets and performs an action if the number of free addresses goes below a user-definable threshold. For further configuration, see the ``Subnet Monitoring section in Event Hooks``

If you want the subnet monitor to send an email, you must specify the mail server and the sender email address to use. Enter the appropriate information in **SMTP Server** and **Mail from**. 

SNMP traps
^^^^^^^^^^^^^^^^^
Enable sending SNMP traps
  When activated, the system will send SNMP traps when the following events occur:

    * the number of free IP addresses in monitored subnets goes below a user-definable threshold.

    * a log event of type Error or Notice occurs. For more information on log events, see :ref:`admin-logging`.

  When enabling sending of SNMP traps, you must provide additional information:

    Manager name
      Enter the host name of the computer that should receive the SNMP traps.

    Manager port
      Enter the port number the Manager uses for the SNMP traps.

    Community
      Enter the community string (password) to use for the SNMP traps.


.. _admin-advanced:

Advanced
--------
Here you can configure advanced system settings, such as specifying a log file for Micetro Central and SSL Certificate policy. For more information about advanced system settings, see the Men&Mice `Knowledge Base <https://kb.menandmice.com/display/MM/Knowledge+base>`_.


.. _admin-management-console:

Management Console
------------------
These settings are only for users of the Management Console.


DHCP errors
^^^^^^^^^^^^^^^^^^^
Inconsistencies in DHCP lease names and DNS names
   When activated, an icon will appear next to each DHCP lease that has a DNS name that doesn't match the name of the lease. The user can click on the icon to view more information about the error, including steps to fix the issue (if applicable). 
   
Address pool collisions
   When activated, an icon will appear next to split scope entries if the address pool in the scope collides with the address pool of another split scope instance. The user can click on the icon to view more information about the error, including steps to fix the issue (if applicable). 
   
Inconsistencies between reservation names in split scopes
   When activated, an icon will appear next to split scope entries if a reservation name in a split scope differs from the reservation name in another split scope instance. The user can click on the icon to view more information about the error, including steps to fix the issue (if applicable). 
   
Inconsistencies between reservation descriptions in split scopes
   When activated, an icon will appear next to scope entries if a reservation description in a split scope differs from the reservation description in another split scope instance. The user can click on the icon to view more information about the error, including steps to fix the issue (if applicable).
   
   If a reservation that has been created inside a pool is deleted, the address is not made a part of the pool again. 
   
Show DHCP data in subranges of scopes
   When selected, the system will display contents of subranges of scopes in the same view that is used for scopes and users with the required privileges will be able to work with reservations in these subranges. If the checkbox is not selected, contents of subranges of scopes will be displayed in the regular range view.
   
Automatic assignment in zone window
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Ping before automatic assignment
   When selected, the system will check if the IP address is responsive to a pin request before it is allocated to a new host through auto-assignment. If the IP address responds to the ping request, it won't be used for auto-assignment. 
   
Automatic assignment ping timeout _____ ms
   Specifies how long the system should wait (in milliseconds) for a response to the ping request. If a response is not received within the specified time, the system considers this to be a non-responding IP address. 
