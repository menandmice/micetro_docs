.. meta::
   :description: Advanced system settings in Micetro by Men&Mice
   :keywords: advanced configuration, Micetro, system settings 

.. _console-advanced-settings:

Advanced System Settings
************************
.. note::  
   The :guilabel:`Advanced System Settings` are only available for the built-in "administrator" user.

To access the System Settings:

1. On the **Admin** page, select :guilabel:`Configuration` in the upper-left corner. 
2. Select :guilabel:`Advanced` under :guilabel:`System Settings` in the filtering sidebar.

The following table shows a description of the currently available settings.

.. csv-table::
  :header: "System Setting", "Description"
  :widths: 25, 75

  "**SSL**", 
  "SSL Certificate policy", "Determines the SSL Certificate policy applied to the Cloud Integration feature and update checks."
  "Path to SSL Certificate Authority file or directory", "Specifies the path to the SSL Root certificate used by the SSL Certificate policy."
  "**SOA record defaults in new zones**", 
  "TTL of SOA record", "Specifies the default TTL (Time to Live) value to use for the SOA record of new zones."
  "Hostmaster", "Specifies the default value to use for the Hostmaster field in the SOA record of new zones."
  "Refresch",	"Specifies the default value to use for the Refresh field in the SOA record of new zones."
  "Retry", "Specifies the default value to use for the Retry field in the SOA record of new zones."
  "Expire", "Specifies the default value to use for the Expiry field in the SOA record of new zones."
  "Negative caching (BIND)", "Specifies the default value to use for the Negative Caching field in the SOA record of new zones. Only applicable for zones on BIND DNS servers."
  "Minimum TTL (MS)", "Specifies the default TTL (Time to Live) value to use for the TTL field in the SOA record of new zones. Only applicable for zones on Microsoft DNS servers."
  "**Web proxy**" 
  "Web proxy to use", "Specifies a proxy server to be used for outgoing connections for checking for updates and additionally for AWS cloud services."
  "Web proxy port (defaults to port 80)", "Specifies the port of the proxy server to be used for outgoing connections for checking for updates and additionally for AWS cloud services."
  "Password for web proxy authentication", "Specifies a cleartext password for proxy sign in."    
  "Use web proxy settings when connecting to AWS", "If selected, the proxy settings configured will be used for connections to AWS."
  "", 
  "Directory for scripts that can be run from the API", "Specifies the directory that contains scripts that may be run from the API."
  "Log performance of API calls", "Determines whether execution time of API calls should be logged. Mainly used for diagnostic purposes."
  "Time in minutes between write-outs of API call performance log", "If logging of API query performance is enabled, this setting specifies how frequently the log should be written to disk."
  "Automatically adjust local zone transfer settings for BIND", "When enabled, BIND can automatically optimize the settings related to local (within your network) zone transfers."
  "Automatically create reverse (PTR) records", "When selected, Micetro automatically creates reverse (PTR) records. PTR records are used for reverse DNS lookups, which are used to resolve an IP address to a domain name."
  "Perform backup of MS and ISC DHCP servers", "Determines whether to perform a backup of Microsoft (MS) and Internet Systems Consortioum (ISC) Dynamic Host Configuration Protocol (DHCP) servers."
  "Default TTL to use for DNS records created in zones for all xDNS profiles", "Specifies the default TTL (Time to Live) value to use for DNS records created in zones for all xDNS profiles."
  "Disable all health checks", "If selected, all health checks will be disabled."
  "Disable collection of statistical information", "Select to stop the collection of statistical information."
  "Use Azure activity log to optimize DNS synchronization", "When enabled, the Azure activity log is monitored for events related to DNS changes, and those changes are synchronized with the DNS server in real-time."
  "Use AWS CloudTrail events to optimize DNS synchronization", "Determines whether AWS CloudTrail events should be used to optimize DNS synchronization."
  "IP ranges/scopes inherit access by default", "When you create a new IP range or scope, it will ineherit all access bits form its parent by default. If you want to change this behavior, clear this checkbox."
  "Maximum number of blocks that can be temporarily claimed", "Limits the number of blocks that can be temporarily reserved or allocated for use by a specific user."
  "Enable collection of IP information from routers",	"Determines whether the system can collect IP information from the ARP cache of routers. If selected, the system can collect this information."
  "Timeout in seconds for named-checkconf", "Specifies the timeout value in seconds for named-checkonf files."
  "Synchronize DNSSEC signed zones immediately after editing", "Determines whether DNSSEC signed zones should be synchronized immediately after they are changed. If selected, the zones are synchronized immediately. [1]_"
  "Use case sensitive comparison when updating custom properties from scripts", "Specifies whether to take case sensitivity into account when comparing custom properties from scripts."
  "Include A/AAAA records when checking for *Edit apex records* access", "Determines whether A and AAAA records are considered when verifying access to edit apex (root) records."
  "Web app landing page", "By default, the Micetro frontpage is the landing page for the system. Clicking the Micetro logo will take you to the landing page."
  "Web app server host", "Used to specify which host the web application is running on in order for auto update to work for the web application. Default is localhost (same server as Men&Mice Central)"
 
 
.. [1] Enabling this feature can affect the performance of the system.
