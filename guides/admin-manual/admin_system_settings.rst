.. meta::
   :description: Micetro´s system settings to configure sign-ons, enabling AD sites and subnets integration, determining IP addresses in use and other advanced settings.   
   :keywords: DNS, DHCP, Micetro´s system settings

.. _admin-system-settings:

System Settings
===============

To access the System Settings:

#. On the **Admin** page, select :guilabel:`Configuration` in the upper-left corner.
#. Browse the categories under :guilabel:`System settings` in the filtering sidebar to find what you're looking for.

   .. image:: ../../images/admin-system-settings.png


The System Settings include the following categories:

  * :ref:`admin-general`

  * :ref:`admin-logging`

  * :ref:`admin-error-checking`

  * :ref:`admin-dns`

  * :ref:`admin-ipam`

  * :ref:`admin-monitoring`

  * :ref:`admin-advanced`
  

.. _admin-general:

General
-------

Through this function, you can specify the following:

  * Authentication methods
  
  * Save Comments for Micetro 

  * Settings for AD Sites and Subnets integration

  * Rules to determine when an IP address is considered as being in use

Authentication
^^^^^^^^^^^^^^^
Configure authentication methods, including single sign-on, LDAP integration, and external login providers. 

When **single sign-on** is activated, users do not have to authenticate when logging in through the Management Console or the Command Line Interface. For more information about Single sign-on, see :ref:`external-auth`.

Save comments
^^^^^^^^^^^^^^^
By default, users can save changes in the system without writing a comment. Here you have the option to set the comment requirements for Micetro tasks, including options to turn off the save comment dialog box, make it optional, or require it. 

   * If you choose to make comments **required**, users will need to include a comment whenever they save changes. 
   * If you choose to make comments **optional**, users can choose whether or not to include a comment when saving changes.
   * When **off** is selected, the save comment dialog box will not appear when users save changes. 

AD sites and subnets
^^^^^^^^^^^^^^^^^^^^^^
Enable AD sites and subnets integration
  When selected, all AD sites and their corresponding subnets will be displayed in Micetro, and you can add and remove subnets from sites and move subnets between different sites as needed. AD sites and subnets will be listed on the **AD Sites** menu on the IPAM page.
  
  If you want to synchronize the  Location  and  Description  fields of the subnets in Active Directory with custom properties in Micetro, choose the desired custom properties to synchronize against. When synchronization is active, any changes made to the fields in Active Directory will automatically update the corresponding fields in Micetro, and vice versa. See :ref:`active-directory`.

   Enforce AD site inheritance.
     Select this checkbox if you want to enforce site inheritance in AD. When site inheritance is enforced, child subnets must reside in the same site as the parent subnet. If site inheritance is not enforced, child subnets can be placed in different sites than the parent subnet. See :ref:`active-directory`.

Determine address usage
^^^^^^^^^^^^^^^^^^^^^^^
Control how IP addresses are identified as being in use. By default, these settings are all selected. To specify which rules should be applied to IP addresses and get a more granular picture of where the usage is coming from, select/clear the appropriate checkboxes.


.. _admin-logging:

Logging
-------
The Logging settings allow you to specify when log messages should be deleted and whether lease history for DHCP servers should be collected.

Micetro log
^^^^^^^^^^^^
Purge log message after (# of days)
  Enter the number of days the logs should be kept before they are deleted.

Log extra information when address collection is triggered.
  When selected, information about the start and duration of the address collection is written in the Micetro log file.

Lease history
^^^^^^^^^^^^^^
Here you can select to start collecting lease history for DHCP servers. By viewing the DHCP lease history, you can quickly identify any potential issues or conflicts.
  
You can specify the number of days to keep the history before it is deleted, and if you want to save the history to a comma separated text file before it is deleted, select the **Flush lease history to file before purging**, and then enter a name for the file.

.. _admin-error-checking:

Error checking
--------------

In this section you can specify how the system reports certain errors related to DNS.

Ignore missing reverse zones.
  An error message displays when Micetro is unable to update a reverse record for a changed address record. It is possible to suppress this error message if no reverse zone exists for the given address record by selecting the Ignore missing reverse zones checkbox.


.. _admin-dns:

DNS
---

Use the *DNS settings* to specify various DNS related settings. 

Delegation records
^^^^^^^^^^^^^^^^^^^
When activated, Micetro will automatically create delegation records (NS records) in the corresponding parent zones whenever subzones are created. This ensures that the delegation chain between parent and subzones is maintained correctly.

Adjust zone transfer
^^^^^^^^^^^^^^^^^^^^
Allow Micetro to automatically adjust zone transfer settings on Microsoft DNS servers to enable management of dynamic and Active Directory integrated zones.

DNSSEC
^^^^^^
Include derived DNSSEC records when viewing DNSSEC signed zones in Micetro. Note that this will significantly increase the size of the Micetro database and may affect overall system performance.

.. _admin-ipam:

IPAM
----

Specify various IPAM related settings:

  * How the system should handle new subranges if the parent range is in a folder.

  * How the system should behave if DHCP scopes are removed outside Micetro.

  * How the system should behave when naming conflicts between existing IP Address ranges and DHCP scopes occur.

  * Whether the system should allow reservations inside address pools on ISC DHCP servers.


Subranges
   The selection made here determines what happens when a user creates a subrange of a range in a folder.

Name conflicts between ranges and scopes
  Specify what happens if the name of an MS DHCP scope does not match the name of an existing IP address range.

Apply same rule for scope description as for scope name above.
  When selected, the system will use the same rules to update scope description as it does for updating scope names.

Allow reservations inside pools on ISC DHCP servers.
  When selected, the system allows users to create reservations inside pools on ISC DHCP servers. When a reservation is created inside a pool, the pool is split to make space for the reservation.

  .. warning::
    If a reservation that has been created inside a pool is deleted, the address is not made a part of the pool again.

Allow allocation of IP addresses from IP Address Containers
  When selected, the system will allow allocation of IP addresses that reside in IP address Containers. For more information on IP address Containers,  refer to  :ref:`ipam-containers`.

Disable scanning of VRF information
   By default, the system does not scan for VRF information. If you clear the checkbox, the system will begin scanning for VRF information. If an overlap is found between different VRFs, the system will log the issue. 
   
Always show discovery info
   Determines whether the columns related to host discovery should always be displayed when viewing contents of subnets or scopes.


.. _admin-monitoring:

Monitoring
----------

Use the *Monitoring settings* dialog box to specify various monitoring related settings.

Subnet monitoring
^^^^^^^^^^^^^^^^^
Enable subnet monitoring
  When enabled, the system monitors the free addresses in DHCP address pools and subnets and performs an action if the number of free addresses goes below a user-definable threshold. For further configuration, see :ref:`admin-subnet-monitoring-events`.

  .. note::
    The global subnet monitoring setting can be overridden for individual subnets by changing the setting explicitly for the subnet. Refer to  IP Address Management—Subnet Monitoring and Utilization History  for information on how to change monitoring settings for individual subnets.

   
  When subnet monitoring is enabled, a new column, Monitoring, displays when viewing the subnet list. To quickly see all subnets that are monitored, you can use the Quick Filter and filter by this column by entering "Monitor: Yes" in the Quick Filter search field.

  .. note::
    Only DHCP scopes that are enabled are monitored. Disabled scopes are ignored.

  When subnet monitoring is enabled, you must specify the mail server and the sender e-mail address to use if you want the subnet monitor to send an e-mail. Place the appropriate information in the SMTP Server and Mail from fields.

Enable sending SNMP traps.
  When enabled, the system will send SNMP traps when certain events occur:

    * When the number of free IP Addresses in monitored subnets goes below a user-definable threshold.

    * When a log event of type Error or Notice occurs. Refer to :ref:`admin-logging` for more information on log events.

  When enabling sending of SNMP traps, you must provide additional information:

   * Manager name
      Enter the host name of the computer that should receive the SNMP traps.

   * Manager port
      Enter the port number the Manager uses for the SNMP traps.

   * Community
      Enter the community string (password) to use for the SNMP traps.

Service monitoring
^^^^^^^^^^^^^^^^^^^
When selected, the monitoring tool monitors the DNS and DHCP services on their respective servers. Decide on an appropriate interval for monitoring.

  When this feature is enabled, some additional information must be provided:

.. _admin-advanced:

Advanced
--------
Here you can configure advanced system settings, such as specifying a log file for Micetro Central and SSL Certificate policy. 

.. csv-table::
  :header: "Setting", "Description"
  :widths: 25, 75
 
  "Path to an SSL Root certificate", "Specifies the path to an SSL Root certificate is such a certificate is being used for the Cloud Integration feature."
  "SSL Certificate policy",	"Specifies the SSL Certificate policy to use for the Cloud Integration feature."
  "Default TTL of SOA record in new zones", "Specifies the default TTL value (in seconds) to use for the SOA record of new zones."
  "Default TTL SOA field in new zones (MS)", "Specifies the default value (in seconds) to use for the TTL field in the SOA record of new zones. Only applicable for zones on Microsoft DNS servers."
  "Default hostmaster SOA field in new zones", "Specifies the default value to use for the Hostmaster field in the SOA record of new zones."
  "Default refresh SOA field in new zones",	"Specifies the default value (in seconds) to use for the Refresh field in the SOA record of new zones."
  "Default retry SOA field in new zones", "Specifies the default value (in seconds) to use for the Retry field in the SOA record of new zones."
  "Default expiry SOA field in new zones", "Specifies the default value (in seconds) to use for the Expiry field in the SOA record of new zones."
  "Default negative caching SOA field in new zones (BIND)", "Specifies the default value (in seconds) to use for the Negative Caching field in the SOA record of new zones. Only applicable for zones on BIND DNS servers."
  "Web proxy to use", "Specifies a proxy server to be used for outgoing connections for checking for updates and additionally for AWS cloud services."
  "Web proxy port (defaults to port 80)", "Specifies the port of the proxy server to be used for outgoing connections for checking for updates and additionally for AWS cloud services."
  "Username for web proxy authentication", "The username is used to authenticate a user agent with a proxy server."
  "Password for web proxy authentication", "The password for web proxy authentication."
  "Use web proxy settings when connecting to AWS", "If selected, the proxy settings configured will be used for connections to AWS."
  "Directory for scripts that can be run from the SOAP interface", "Specifies the directory that contains scripts that may be run from the SOAP interface."
  "Log performance of SOAP queries", "Determines whether execution time of SOAP queries should be logged. Mainly used for diagnostic purposes."
  "Time in minutes between write-outs of SOAP performance log",	"If logging of SOAP query performance is enabled, this setting specifies how frequently the log should be written to disk."
  "Automatically adjust local zone transfer settings for BIND", "By default, Micetro automatically adjusts zone transfer settings for secondary zones. Clear the checkbox if this is not a desired behavior for your environement."
  "Automatically create reverse (PTR) records", "When selected, Micetro automatically creates reverse (PTR) records. PTR records are used for reverse DNS lookups, which are used to resolve an IP address to a domain name."
  "Perform backup of MS and ISC DHCP servers", "Determines whether to perform a backup of Microsoft (MS) and Internet Systems Consortioum (ISC) Dynamic Host Configuration Protocol (DHCP) servers."
  "Disable all health checks", "If selected, all health checks will be disabled."
  "Disable collection of statistical information", "Select to stop the collection of statistical information."
  "Use AWS CloudTrail events to optimize DNS synchronization", "Determines whether AWS CloudTrail events should be used to optimize DNS synchronization."
  "IP ranges/scopes inherit access by default", "When you create a new IP range or scope, it will ineherit all access bits form its parent by default. If you want to change this behavior, clear this checkbox."
  "Enable collection of IP information from routers",	"Determines whether the system can collect IP information from the ARP cache of routers. If selected, the system can collect this information."
  "Timeout in seconds for named-checkconf", "Specifies the timeout value in seconds for named-checkonf files."
  "Synchronize DNSSEC signed zones immediately after editing", "Determines whether DNSSEC signed zones should be synchronized immediately after they are changed. If selected, the zones are synchronized immediately. [2]_"
  "Use case sensitive comparison when updating custom properties from scripts", "Specifies whether to take case sensitivity into account when comparing custom properties from scripts."
  "Web app landing page", "By default, the Micetro frontpage is the landing page for the system. Clicking the Micetro logo will take you to the landing page."
  "Web app server host", "Used to specify which host the web application is running on in order for auto update to work for the web application. Default is localhost (same server as Men&Mice Central)"
  

.. [1] Enabling this feature can affect performance of the system, especially when working with large DNSSEC zones.

.. [2] Enabling this feature can affect the performance of the system.

