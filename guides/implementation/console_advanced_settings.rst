.. _console-advanced-settings:

Advanced System Settings
************************

Starting with version 6.3.2, the Men&Mice Suite allows users to configure Advanced System Settings from within the Management Console.

To access the Advanced System Settings dialog box, open System Settings and click the Advanced button in the General tab.
Please note that the Advanced System Settings are only available for the build-in user "administrator".

Below, you will find a description of the currently available settings.

.. csv-table::
  :header: "System setting name", "Description"
  :widths: 25, 75

  "Require DNS Admin rights for DNS Analysis", "Determines whether users should need DNS Administration rights to use the DNS Analysis function. If checked, the DNS Analysis button is hidden if the logged-in user does not have DNS Administration rights."
  "Directory for scripts that can be run from the SOAP interface",	"Specifies the directory that contains scripts that may be run from the SOAP interface."
  "Log performance of SOAP queries",	"Determines whether execution time of SOAP queries should be logged. Mainly used for diagnostic purposes."
  "Time in minutes between write-outs of SOAP performance log",	"If logging of SOAP query performance is enabled, this setting specifies how frequently the log should be written to disk."
  "Default negative caching SOA field in new zones (BIND)", "Specifies the default value (in seconds) to use for the Negative Caching field in the SOA record of new zones. Only applicable for zones on BIND DNS servers."
  "Default expiry SOA field in new zones",	"Specifies the default value (in seconds) to use for the Expiry field in the SOA record of new zones."
  "Default hostmaster SOA field in new zones",	"Specifies the default value to use for the Hostmaster field in the SOA record of new zones."
  "Default TTL SOA field in new zones (MS)", "Specifies the default value (in seconds) to use for the TTL field in the SOA record of new zones. Only applicable for zones on Microsoft DNS servers."
  "Default refresh SOA field in new zones",	"Specifies the default value (in seconds) to use for the Refresh field in the SOA record of new zones."
  "Default retry SOA field in new zones,	"Specifies the default value (in seconds) to use for the Retry field in the SOA record of new zones."
  "Default TTL of SOA record in new zones,	"Specifies the default TTL value (in seconds) to use for the SOA record of new zones."
  "Path to an SSL Root certificate",	"Specifies the path to an SSL Root certificate is such a certificate is being used for the Cloud Integration feature."
  "SSL Certificate policy",	"Specifies the SSL Certificate policy to use for the Cloud Integration feature."
  "Allow Migrate Scope to create two enabled scopes",	"Determines whether the Migrate Scope Wizard can create two enabled scopes."
  "Always show discovery info",	"Determines whether the columns related to host discovery should always be displayed when viewing contents of subnets or scopes."
  "Log file for Men&Mice Central",	"Specifies the path and name of the log file to use when you want to log the output of Men&Mice Central to a file."
  "Logging level for Men&Mice Central (1-7)", "Determines the level of detail to log when logging the output of Men&Mice Central to a file."
  "Check for underscores in host names",	"Determines whether to check if hosts contain underscores in their names. If checked, it is not possible to create hosts with underscores in their names."
  "Include derived data from DNSSEC zones",	"Determines whether derived data (automatically generated DNSSEC resource records) from DNSSEC zones should be included when opening DNSSEC signed zones. If checked, the derived data will be included when opening the zones. [1]_"
  "Enable collection of IP information from routers",	"Determines whether the system can collect IP information from the ARP cache of routers. If selected, the system can collect this information."
  "Synchronize DNSSEC signed zones immediately after editing",	"Determines whether DNSSEC signed zones should be synchronized immediately after they are changed. If selected, the zones are synchronized immediately. [2]_"
  "Show DNSSEC Key-Tags (Key-IDs) for DNSSEC zones", "Determines whether DNSSEC Key-Tags should be displayed in the zone list. If selected, the DNSSEC Key-Tags are displayed."
  "Disable all health checks", "If checked, all health checks will be disabled."
  "Web app server host",	"Used to specify which host the web application is running on in order for auto update to work for the web application. Default is localhost (same server as Men&Mice Central)"
  "Web proxy to use", "Specifies a proxy server to be used for outgoing connections for checking for updates and additionally for AWS cloud services."
  "Web proxy port (defaults to port 80)", "Specifies the port of the proxy server to be used for outgoing connections for checking for updates and additionally for AWS cloud services."
  "Use web proxy settings when connecting to AWS", "If checked, the proxy settings configured will be used for connections to AWS."

.. [1] Enabling this feature can affect performance of the system, especially when working with large DNSSEC zones.

.. [2] Enabling this feature can affect the performance of the system.
