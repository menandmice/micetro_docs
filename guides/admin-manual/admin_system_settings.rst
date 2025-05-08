.. meta::
   :description: Micetro's system settings to configure sign-ons, enabling AD sites and subnets integration, determining IP addresses in use, and other advanced settings.   
   :keywords: DNS, DHCP, Micetro's system settings

.. _admin-system-settings:

System Settings
===============

**To access the System Settings**:

#. On the **Admin** page, select the :guilabel:`Configuration` tab.
#. Browse the categories under :guilabel:`System Settings` in the filtering sidebar to find what you're looking for.

   .. image:: ../../images/admin-system-settings-11.png
      :width: 80%

The System Settings include the following categories:

  * :ref:`admin-general`

  * :ref:`admin-authentication`

  * :ref:`admin-logging`

  * :ref:`admin-error-checking`

  * :ref:`admin-dns`

  * :ref:`admin-ipam`

  * :ref:`admin-monitoring`

  * :ref:`admin-advanced`
  

.. _admin-general:

General
-------
Use the **General** settings to specify the following:

  * Save Comments for Micetro.

  * Settings for AD Sites and Subnets integration.

  * Rules to determine when an IP address is considered as being in use.

Save Comments
^^^^^^^^^^^^^^
By default, users can save changes in the system without writing a comment. Here, you have the option to set the comment requirements for Micetro tasks, including options to turn off, make optional, or require the **Save Comment** dialog box.

   * When **off** is selected, the **Save Comment** dialog box will not appear when users save changes. 
   * If you choose to make comments **optional**, users can choose whether or not to include a comment when saving changes.
   * If you choose to make comments **required**, users must include a comment whenever they save changes.

AD Sites and Subnets
^^^^^^^^^^^^^^^^^^^^^^
Enable AD sites and subnets integration
  When selected, all Active Directory (AD) sites and their corresponding subnets will be displayed in Micetro, and you can add and remove subnets from sites and move subnets between different sites as needed. AD sites and subnets will be listed on the **AD Sites** menu on the **IPAM** page.
  
  If you want to synchronize the Location and Description fields of the subnets in AD with custom properties in Micetro, choose the desired custom properties to synchronize with. When synchronization is active, any changes made to the fields in AD will automatically update the corresponding fields in Micetro and vice versa. See :ref:`active-directory`.

Enforce AD site inheritance
  Select this checkbox if you want to enforce site inheritance in AD. When site inheritance is enforced, child subnets must reside in the same site as the parent subnet. If site inheritance is not enforced, child subnets can be placed in different sites than the parent subnet. See :ref:`active-directory`.

Determine Address Usage
^^^^^^^^^^^^^^^^^^^^^^^
Control how IP addresses are identified as being in use. By default, these settings are all selected. To specify which rules should be applied to IP addresses and get a more granular picture of where the usage is occurring, select/clear the appropriate checkboxes.

.. _admin-authentication:

Authentication
--------------
Configure authentication methods, including single sign-on, LDAP integration, and external login providers. 

When **single sign-on** is activated, users do not have to authenticate when logging in to Micetro. For more information about Single sign-on, see :ref:`webapp-external-auth`.

Local Authentication
^^^^^^^^^^^^^^^^^^^^
Set a minimum password length for all users in Micetro. The default length is 12 characters.

External Authentication
^^^^^^^^^^^^^^^^^^^^^^^
Allow users to log into Micetro using credentials from Okta or Azure AD. The :guilabel:`Configure` button opens a form where you can enter the necessary information needed for Okta or Azure AD authentication. 

Decide how login options appear on the Micetro login page.

Validate signature of external authentication script before running
  This feature only takes effect when single sign-on is enabled. It ensures the security of the authentication process by confirming the authenticity of external authentication scripts before executing them.

.. _admin-logging:

Logging
-------
The Logging settings allow you to specify when log messages should be deleted and whether a lease history for DHCP servers should be collected.

Micetro Log
^^^^^^^^^^^^
Logging level for Micetro Central (1-7)
   Determines the level of detail to log when logging the output of Micetro Central to a file.

Log file for Micetro Central
   Specifies the path and name of the log file to use when you want to log the output of Micetro Central to a file.

Purge log message after (# of days)
  Enter the number of days the logs should be kept before they are deleted.

Log extra information when address collection is triggered
  When selected, information about the start and duration of the address collection is written in the Micetro log file.

Lease History
^^^^^^^^^^^^^^
Here, you can select to start collecting lease history for DHCP servers. By viewing the DHCP lease history, you can quickly identify any potential issues or conflicts.
  
You can specify the number of days to keep the history before it is deleted and, if you want to save the history to a comma-separated text file before it is deleted, enter a name for the file in the **Flush lease history to file before purging** text box.

.. _admin-error-checking:

Error Checking
--------------
In this section you can specify how the system reports certain errors related to DNS.

Stop A/AAAA records from being created if the name already exists
  This setting prevents the creation of A/AAAA records when a name already exists in the system. This can be useful for avoiding conflicts or overwriting existing records in the DNS configuration.

Ignore missing reverse zones.
  An error message displays when Micetro is unable to update a reverse record for a changed address record. It is possible to suppress this error message if no reverse zone exists for the given address record by selecting this checkbox.

.. _admin-dns:

DNS
---
Use the following settings to specify various DNS-related settings: 

Delegation Records
^^^^^^^^^^^^^^^^^^^
When activated, Micetro will automatically create delegation records (NS records) in the corresponding parent zones whenever subzones are created. This ensures that the delegation chain between parent and subzone is correctly maintained.

Adjust Zone Transfer
^^^^^^^^^^^^^^^^^^^^
Allow Micetro to automatically adjust zone transfer settings on Microsoft DNS servers to enable management of dynamic and Active Directory integrated zones. Enabling this setting also allows secondary zones to be opened from within Micetro.

DNSSEC
^^^^^^
Include derived DNSSEC records when viewing DNSSEC-signed zones in Micetro. Note that this will significantly increase the size of the Micetro database and may affect overall system performance.


.. _admin-ipam:

IPAM
----

Specify various IPAM-related settings, including:

  * How the system should handle new subranges if the parent range is in a folder.

  * How the system should behave when naming conflicts between existing IP address ranges and DHCP scopes occur.
    
  * How the system should behave if DHCP scopes are removed outside Micetro.

  * Whether the system should allow reservations inside address pools on ISC DHCP servers.

Subranges
   The selection made here determines what happens when a user creates a subrange of a range in a folder.

Name conflicts between ranges and scopes
  Specify what happens if the name of an MS DHCP scope does not match the name of an existing IP address range.

Apply same rule for scope description as for scope name above
  When selected, the system will use the same rules to update scope description as it does for updating scope names.

When a DHCP scope is deleted outside Micetro
  Select whether a scope deleted outside Micetro is converted to an IP address range or also deleted from Micetro.

Allow reservations inside pools on ISC DHCP servers
  When selected, the system allows users to create reservations inside pools on ISC DHCP servers. When a reservation is created inside a pool, the pool is split to make space for the reservation.

  .. warning::
    If a reservation created inside a pool is deleted, the address is not made a part of the pool again.

Allow allocation of IP addresses from IP Address Containers
  When selected, the system will allow allocation of IP addresses that reside in IP Address Containers. For more information on IP Address Containers,  refer to  :ref:`ipam-create-network`.

Disable scanning of VRF information
   By default, the system does not scan for VRF information. If you clear the checkbox, the system will begin scanning for VRF information. If an overlap is found between different VRFs, the system will log the issue. 
   
Always show discovery info
   Determines whether the columns related to host discovery should always be displayed when viewing contents of subnets or scopes.


.. _admin-monitoring:

Monitoring
----------
Specify various monitoring-related settings, including the following:

Subnet Monitoring
^^^^^^^^^^^^^^^^^
Enable subnet monitoring
  When enabled, the system monitors the IPv4 free addresses in DHCP address pools and subnets and performs an action if the number of free addresses goes below a user-definable threshold. However, IPv6 addresses are excluded from subnet monitoring. For further configuration, see :ref:`admin-subnet-monitoring-events`.

  .. note::
    The global subnet monitoring setting can be overridden for individual subnets by changing the setting explicitly for the subnet. Refer to :ref:`ipam-subnet-monitoring` for information on how to change monitoring settings for individual subnets.
   
When subnet monitoring is enabled, a new **Monitoring** column is displayed when viewing the subnet list. To quickly see all subnets that are monitored, you can use the :guilabel:`Quick filter` and filter by this column by entering "Monitor: Yes" in the :guilabel:`Quick Filter` search field.

  .. note::
    Only enabled DHCP scopes are monitored. Disabled scopes are ignored.

When subnet monitoring is enabled, you must specify the mail server and the sender email address to use if you want the subnet monitor to send an email. Enter the appropriate information in the **SMTP server** and **Mail from** fields. Select :guilabel:`Set Default Monitor` to make this the default monitor.

Enable sending SNMP traps
  When enabled, the system will send SNMP traps when certain events occur, including:

    * When the number of free IP addresses in monitored subnets drops below a user-definable threshold.

    * When a log event of type *Error* or *Notice* occurs. Refer to :ref:`admin-logging` for more information on log events.

  When enabling sending of SNMP traps, you must provide the following information:

   * Manager name
      Enter the hostname of the computer that should receive the SNMP traps.

   * Manager port
      Enter the port number the Manager uses for the SNMP traps.

   * Community
      Enter the community string (password) to use for the SNMP traps.

Service Monitoring
^^^^^^^^^^^^^^^^^^^
When selected, the monitoring tool monitors the DNS and DHCP services on their respective servers. Enter an appropriate interval (in minutes) for monitoring.


.. _admin-advanced:

Advanced
--------
Here you can configure advanced system settings, such as specifying a SSL Certificate policy. 

.. csv-table::
  :header: "Setting", "Description"
  :widths: 25, 75
 
  "**SSL**", 
  "SSL Certificate policy", "Determines the SSL Certificate policy applied to the Cloud Integration feature and update checks."
  "Path to SSL Certificate Authority file or directory", "Specifies the path to the SSL Root certificate used by the SSL Certificate policy."
  "**SOA record defaults in new zones**", 
  "TTL of SOA record", "Specifies the default TTL (Time to Live) value to use for the SOA record of new zones."
  "Hostmaster", "Specifies the default value to use for the Hostmaster field in the SOA record of new zones."
  "Refresh",	"Specifies the default value to use for the Refresh field in the SOA record of new zones."
  "Retry", "Specifies the default value to use for the Retry field in the SOA record of new zones."
  "Expire", "Specifies the default value to use for the Expiry field in the SOA record of new zones."
  "Negative caching (BIND)", "Specifies the default value to use for the Negative Caching field in the SOA record of new zones. Only applicable for zones on BIND DNS servers."
  "Minimum TTL (MS)", "Specifies the default TTL (Time to Live) value to use for the TTL field in the SOA record of new zones. Only applicable for zones on Microsoft DNS servers."
  "**Web proxy**" 
  "Web proxy to use", "Specifies a proxy server to be used for outgoing connections for checking for updates and additionally for AWS cloud services."
  "Web proxy port (defaults to port 80)", "Specifies the port of the proxy server to be used for outgoing connections for checking for updates and additionally for AWS cloud services."
  "Username for web proxy authentication", "Specifies a username for proxy sign-in"
  "Password for web proxy authentication", "Specifies a cleartext password for proxy sign-in."    
  "Use web proxy settings when connecting to AWS", "If selected, the configured proxy settings will be used for connections to AWS."
  "**Cisco Meraki**"
  "Network client synchronization interval in seconds", "Specifies the amount of time, in seconds, between fetches of all Meraki clients."
  "Configuration synchronization interval in seconds", "Specifies the amount of time, in seconds, between fetches of all non-client-related information, e.g., networks, subnets, etc."
  "Throttling max wait time in seconds", "Specifies the maximum wait time, in seconds, after a ``429 Too many requests`` response. Default behavior follows the maximum value suggested in the Meraki API response."
  "API server error default wait time in seconds", "Specifies the wait time, in seconds, after receiving ``5xx`` error responses."
  "**Miscellaneous**"
  "Folder for scripts that can be run from the API", "Specifies the directory that contains scripts that may be run from the API."
  "Log performance of API calls", "Determines whether execution time of API calls should be logged. Mainly used for diagnostic purposes."
  "Time in minutes between write-outs of API call performance log", "If logging of API query performance is enabled, this setting specifies how frequently the log should be written to disk."
  "Automatically adjust local zone transfer settings for BIND", "When enabled, BIND can automatically optimize the settings related to local (within your network) zone transfers."
  "Automatically create reverse (PTR) records", "When selected, Micetro automatically creates reverse (PTR) records. PTR records are used for reverse DNS lookups, which are used to resolve an IP address to a domain name."
  "Perform backup of MS and ISC DHCP servers", "Determines whether to perform a backup of Microsoft (MS) and Internet Systems Consortioum (ISC) Dynamic Host Configuration Protocol (DHCP) servers."
  "Default TTL to use for DNS records created in zones for all xDNS profiles", "Specifies the default TTL (Time to Live) value to use for DNS records created in zones for all xDNS profiles."
  "Disable all health checks", "Select to disable all health checks."
  "Disable collection of statistical information", "Select to stop the collection of statistical information."
  "Use Azure activity log to optimize DNS synchronization", "When enabled, the Azure activity log is monitored for events related to DNS changes, and those changes are synchronized with the DNS server in real-time."
  "Use AWS CloudTrail events to optimize DNS synchronization", "Determines whether AWS CloudTrail events should be used to optimize DNS synchronization."
  "IP ranges/scopes inherit access by default", "When you create a new IP range or scope, it will inherit all access bits form its parent by default. If you want to change this behavior, clear this checkbox."
  "Maximum number of blocks that can be temporarily claimed", "Limits the number of blocks that can be temporarily reserved or allocated for use by a specific user."
  "Enable collection of IP information from routers",	"Determines whether the system can collect IP information from the ARP cache of routers. If selected, the system can collect this information."
  "Timeout in seconds for named-checkconf", "Specifies the timeout value, in seconds, for named-checkonf files."
  "Synchronize DNSSEC signed zones immediately after editing", "Determines whether DNSSEC signed zones should be synchronized immediately after they are changed. If selected, the zones are synchronized immediately. [1]_"
  "Use case sensitive comparison when updating custom properties from scripts", "Specifies whether to take case sensitivity into account when comparing custom properties from scripts."
  "Include A/AAAA records when checking for *Edit apex records* access", "Determines whether A and AAAA records are considered when verifying access to edit apex (root) records."
  "Web app landing page", "By default, the Micetro frontpage is the landing page for the system. Clicking the Micetro logo will take you to the landing page."
  "Web app server host", "Used to specify which host the web application is running on in order for auto update to work for the web application. Default is localhost (same server as Micetro Central)."
  "Require User Administrator access to be able to list users, groups and roles", "Select to require a user to have User Administrator access in order to retrieve information about users, groups, and roles in Micetro."
  

.. [1] Enabling this feature can affect the performance of the system.
