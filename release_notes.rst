.. meta::
   :description: Release notes for Micetro 11.x versions
   :keywords: Micetro, release notes, releases, update notes

.. _release-notes:

Release Notes
=============

.. note::
  Major releases are supported for 2 years.


Jump to: :ref:`10.5.0-release`, :ref:`10.5.1-release`,  :ref:`10.5.2-release`, :ref:`10.5.3-release`, :ref:`10.5.4-release`, :ref:`10.5.5-release`, :ref:`10.5.6-release`, :ref:`10.5.7-release`, :ref:`10.5.8-release`, :ref:`11.0.0-release`, :ref:`11.0.1-release`, :ref:`11.0.2-release`, :ref:`11.0.3-release`, :ref:`11.0.4-release`, :ref:`11.1.0-release`

.. _11.1.0-release:

11.1.0
------
September 30, 2024

New Features
^^^^^^^^^^^^

* **Cisco Meraki**: Micetro now supports orchestration of DHCP on Cisco Meraki devices, see more information `here <https://docs.menandmice.com/guides/user-manual/cisco_meraki.html>`_
* **Kea shared networks**: Micetro now supports management of shared networks on ISC Kea
* **ISC DHCP shared networks**: Shared networks on ISC DHCP can now be managed via Micetro in the Web Application
* **Microsoft Superscopes**: Superscopes can now be managed via Micetro in the Web Application
* **Devices and interfaces**: Rudamentary asset management is now possible in the Web Application via Devices and Interfaces
* **Universal Character Sets**: Micetro is now fully UTF-8 capable for data entry, which means that any character can be used within the Micetro solution, where appropriate 
.. note::
   For deployments with a dedicated database backend, i.e. Microsoft SQL Server and PostgreSQL, the correct collation needs to be chosen to ensure correct behaviour with non-ASCII characters

Improvements
^^^^^^^^^^^^

* A link to the REST API documentation has been added to the welcome page of Micetro
* Accessibility in the Web UI improved for lowest screen resolution by making dialogs take the whole screen when opened
* Action buttons names changed: Failover Management -> Manage Failover and Access -> Manage Access
* Added checks to the API to ensure that the TXT record is valid (i.e. it doesn't contain new lines), if they are not valid then an exception is thrown
* Added flag --skip-arrange to the installer for the agents. Since 11.0 the DNS agent for BIND does not need to arrange the configuration files. By using this flag when installing the original configuration files will not be changed
* Added support for Bearer session token authorization in the API, and changed the REST API documentation to default to that instead of Basic Auth. Added micetro/sessions HTTP POST endpoint in REST API to create a session token for this purpose
* "Delete range" command is now hidden for the root ranges, as it is impossible to delete them
* Double-clicking a DNS Service in the Web UI now takes the user to its zone. Also, double-clicking a DHCP Service now takes the user to its scopes
* Field name in filters are now matched to columns even if it was only a partial match.
* "Find next free address" feature now works in large subnets (including IPv6)
* "Find random free address" now only pings the selected address
* Hardened validation of DNS records. It is no longer possible to add records or zones with hyphens at the start or end of a label
* Improved handling for throttling and API availability for Akamai
* It is now possible to insert dynamic DNS zones on Microsoft DNS
* Micetro log files are now also purged according to system setting
* Micetro no longer writes header warning users not to edit config files as it can not pick up changes in those files
* Primary and secondary pools in Kea Load Balance setup is now handled correctly. Alias HA client classes HA_server1 (for primary server) and HA_server2 (for secondary server) are being created, so that any pool receiving client class HA_server1 is a primary pool and HA_server2 is a secondary pool
* Removed the option to choose a module you don't have a license for as the landing page
* REST API documentation is now linked on the welcome/dashboard page in the Web UI
* Separate ports can now be defined for ISC DHCP Failover relationships
* The inspector in the Web UI has now been made collapsible like the sidebar
* UI for zone options consistent across server types. Added support for more Windows zone options
* When updating Micetro a automatic backup is taken of the embedded database
.. note::
   For deployments with a dedicated database backend, i.e. Microsoft SQL Server or PostgreSQL, database backups must be taken manually

Bug Fixes
^^^^^^^^^

* AD synchronization recognizes external updates without requiring a restart of Central
* DHCP scopes are now deleted when the underlying network is being deleted
* Fixed a problem with SetZoneOptions which was not updated in memory and returned incorrect information until after next synchronization
* Fixed issue where adding a DNS server and attempting to add a zone on the server in the same session would sometimes fail
* Fixed issue where users would not be able to login after update of Micetro if there had been an empty xml file in the updates folder
* Fixed regression of auto-update of server controllers that would sometimes temporarily be reported as out-of-date after being updated
* Folders are now converted with a range when it is converted into a scope
* Information about file paths have been removed from error messages for security reasons
* MDDS appliances added to the non-default address space are now automatically updated
* Micetro can now fetch more than 1000 zones from Azure
* Multiple accessibility improvements have been done e.g. auto-closing sidebars when a certain zoom level has been reached
* Options from Action menu in the Web UI to be are now selectable
* Parsing of simple dnssec-policy statements in zones are now behing handled correctly
* Port numbers for ISC DHCP Failover can now be defined for the whole range of port numbers
* Session tokens have been removed from URL's due to security reasons
* Solved multiple issues related to handling of MARS on database connections in Microsoft SQL Server
* Users are not prompted with an invalid session error anymore when the landing page is set to DNS

Deprecation Announcements
^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::
  When a feature is deprecated that means this will be the last version where a feature is officially supported. A feature might continue to work in future versions as long as the code is present within Micetro but there are no guarantees for that as the code is not officially maintained.

* CentOS is no longer supported by Micetro as this operating system was deprecated by Red Hat on 30 June 2024, see more information `here <https://www.redhat.com/en/topics/linux/centos-linux-eol>`_.
* RHEL 6 support has now been deprecated in Micetro because it was out of maintenance support by Red Hat on 30 November 2020 according to the `Red Hat Enterprise Linux support lifecycle page <https://access.redhat.com/support/policy/updates/errata/>`_. The same applies to RHEL 7 which was out of maintenance support on 30 June 2024.
* Suse Enterprise Linux 11 has been deprecated in Micetro as this operating system is not supported by the vendor as of 31st of March 2019, see more information `here <https://www.suse.com/lifecycle>`_.
* Unbound support has been deprecated. This support was added originally because Unbound was used in the Men & Mice caching appliances but those were deprecated as part of introducing MDDS support in version 11.0 (which does not use Unbound) so it is not necessary to support Unbound anymore in Micetro.
* Support for Kea version 2.2 as a service that Micetro can overlay is deprecated due to reaching end-of-life status and no longer being supported by ISC. See the roadmap for ISC Kea `here <https://kb.isc.org/docs/aa-00896>`_.
* Support for Microsoft SQL Server 2014 is deprecated as this databases reached end of support on July 9, 2024. For more information on Microsoft SQL Server roadmap, see `here <https://learn.microsoft.com/en-us/lifecycle/products>`_.

Breaking changes
^^^^^^^^^^^^^^^^^^^^^^^^^

* By default, it's no longer possible to login to other Central servers than the default Central server through the Web Interface or the API. When Web Interface and Central are on the same server, the server field is no longer shown when logging in.
* Default character encoding on API requests has now been changed to UTF-8 from Latin1 if no charset is defined in the `Content-Type` HTTP header 

.. _11.0.4-release:

11.0.4
------
September 16, 2024

Bug Fixes
^^^^^^^^^
* Resolved a problem that prevented users from logging into the Micetro Web Interface following an upgrade to a new license key version when the default home page was configured to the DNS or IPAM view.
* Fixed an issue where the DNS server list (DHCP option 6 on MS DHCP) in the Micetro Web Interface was previously sorting by IP address instead of the user-defined order. The order of DNS servers in DHCP option 6 is now preserved in the Web Interface.
* Resolved an issue where field validation failed during DHCP scope conversion:
* Fixed an issue where unintended user input in the filter field caused Central to stop.
* Resolved a problem where a field name in filters would be matched to a column even if it was only a partial match.
* Fixed a regression that allowed users to modify the names and descriptions of built-in groups.
* Fixed the import of TXT records that contain semicolons.
* The ``AddDHCPReservation`` function no longer supports referencing reservations by name for Kea.
* Change requests can now reference reservations by address, in addition to name. For ISC reservations with multiple addresses, the system will now verify if any of the addresses match.

.. _11.0.3-release:

11.0.3
------
July 23, 2024

Improvements
^^^^^^^^^^^^
* BIND has been upgraded to v9.16.50 (along with patches from ISC) on the Micetro appliances to address the following security vulnerabilities:
   * CVE-2024-0760: A flood of DNS messages over TCP may make the server unstable 
   * CVE-2024-1737: BIND’s database will be slow if a very large number of RRs exist at the same name
   * CVE-2024-1975: SIG(0) can be used to exhaust CPU resources
   * CVE-2024-4076: Assertion failure when serving both stale cache data and authoritative zone content

Please note that when updating the Micetro appliances it is necessary to restart them for the change to take full effect, this usually takes about 20-30 seconds.

MDDS appliances have also been updated to include a BIND version that contains those security fixes, this will result in a restart of the BIND service which will only take few seconds

.. _11.0.2-release:

11.0.2
------
July 8, 2024

Improvements
^^^^^^^^^^^^
* Improved concurrency safety with GetNextFreeAddress when used with the temporaryClaimTime parameter.

Bug Fixes
^^^^^^^^^
* Fixed a problem where a minor version of MDDS was not detected correctly.
* Improved concurrency safety with GetNextFreeAddress when used in conjunction with the temporaryClaimTime parameter.
* Fixed a problem with the calculation of the usage and the display of the leases in the scopes on certain MS DHCP servers.
* Fixed an issue where Swagger documentation did not allow selecting an HTTPS connection for REST calls. The default server in Open API no longer includes a protocol, ensuring that REST documentation works seamlessly for both HTTP and HTTPS connections.
* Fixed an issue where DHCP Synchronization would fail because the DHCP scope change listener could not be found. The reliability of DHCP synchronization for Microsoft DHCP servers has been enhanced.
* Fixed an issue where downloading updates through a proxy failed unless the CONNECT verb was allowed for regular HTTP traffic. We’ve also enabled checking for and downloading updates via HTTPS when a web proxy server is configured.

.. _11.0.1-release:

11.0.1
------
May 15, 2024

Bug Fixes
^^^^^^^^^
* Fixed an issue with Azure setups containing more than 1000 zones. Previously, Micetro would fail reading in zones from Azure if the number of zones exceeded 1000.
* Fixed an issue where explicit session removals could lead to a potential out-of-memory condition in the web service.
* Fixed an issue where rolling back changes when adding zones to xDNS failed, resulting in the deletion of the zones.
* Fixed an issue where adding a DNS server and simultaneously attempting to add a zone within the same session led to intermittent failures.
* Fixed an issue in ISC failover where the split between failover peers would change when adding a scope from the secondary server to a failover relationship.
* Fixed a bug that affected the interpretation of Azure DNS records containing hostname data, leading to inaccuracies in record processing.

.. _11.0.0-release:

11.0.0
------
March 14, 2024

New Features
^^^^^^^^^^^^

* **MDDS Support**: Micetro now supports MDDS appliances from BlueCat. This feature is intended for customers seeking to seamlessly incorporate MDDS appliances into their existing network infrastructure and manage them within Micetro alongside their other DNS/DHCP servers. With this enhancement, users can manage various functionalities on MDDS appliances within Micetro, including:

   * BIND options that allow viewing and editing DNS options on BIND for both DNS servers and zones.
   * Dynamic DNS updates.
   * Network interfaces.
   * Network services such as DNS, DHCP, NTP, resolv.conf, and SNMP.
   * Syslog redirection offering the flexibility to define multiple remote logging servers, meeting a variety of logging needs.
   * MDDS appliance updates from within Micetro.
* **ISC DHCP Failover**: Micetro now enables the management of ISC DHCP server-to-server failover relationships.
* **Kea 2.4 Integration**: Micetro now supports the management of Kea 2.4 DHCP servers.
* **Kea Failover Management**: Users can now manage Kea DHCP server-to-server failover relationships within Micetro.
* **Kea Premium Hooks**: Micetro can now use Kea premium hooks to increase performance when working with Kea.
* **Enhanced Micetro Log**: Micetro logs can now be viewed from :menuselection:`Admin --> Logging --> Micetro Logs`. The logging output is improved with better structure and colorization, greatly improving usability for not only customers, but also Micetro developers and support teams.
* **Undo Functionality**: Users can now undo certain events while viewing event change history, effectively reverting the change. These events are:

   * Creation, deletion, or modification of DNS records.
   * Edits to custom properties.

Improvements
^^^^^^^^^^^^
* **High Availability (HA) Support for mmWS**: Session handling has been moved from mmWS to the Central server. This allows customers to configure multiple mmWS instances for redundancy, region, or load balancing purposes.
* **External and Multifactor Authentication**: Setting up external authentication has been streamlined with the integration of Python scripts for LDAP and external authentication directly into the installation and upgrading process. Users can now easily configure integration with Okta and Microsoft Entra ID (formerly Azure AD) by navigating to :menuselection:`Admin --> Configuration --> Authentication`. Additionally, a built-in test feature allows users to test if that configuration is correct. 
* **New Remote for BIND**: Users can now manage Response Policy Zones (RPZ) and dynamic zones.
* **Enhanced License Key Handling**: Handling of license keys has been changed to include subscription keys and allow for longer expiration times.

Bug Fixes
^^^^^^^^^
* Fixed an issue where existing records disappeared and reappeared again. Now all existing records are shown correctly when changing the state of DNS zone from static to dynamic. 
* Excessive timeouts when trying to establish initial connections to agents have been significantly reduced.
* Sensitive SNMP information is no longer logged in the object history.
* Object history entries are now created for the NS record within DNS zones.
* Fixed an issue where users were unable to edit the TTL (Time To Live) for Akamai Edge record sets in the Web Interface.
* Server grids in the web UI are now reloaded after synchronization.
* Switching address spaces now reloads the Service Management view.

Deprecation Announcements
^^^^^^^^^^^^^^^^^^^^^^^^^

* We've launched the new Micetro DNS/DHCP server (MDDS) appliance, marking a transition from the old Men&Mice virtual appliance platform. If you're using the Men&Mice virtual appliance and considering an upgrade to Micetro 11.0, please reach out to our support team at support@bluecatnetworks.com for assistance with migrating smoothly to the new platform. It's important to note that all customers will need to transition to the new appliance platform eventually, so we highly recommend making this change in the upgrade to version 11.0.
* OpenStack support is deprecated as the versions currently supported in Micetro have reached end-of-life status.
* Dyn support is deprecated as it is no longer supported by Oracle, with the target retirement date being May 31, 2023. For more information, see `here <https://www.oracle.com/corporate/acquisitions/dyn/technologies/enterprise-customer-faq.html>`_.
----

* Support for BIND versions 9.16 and earlier is deprecated, as these versions have been declared as end-of-life by ISC in Q1 2024. The same applies to the subscriber edition.
* Support for ISC DHCP versions 4.4.0 and earlier is deprecated. However, versions 4.4.1 and later will continue to be supported by Micetro, despite ISC dropping support for ISC DHCP as a whole in December 2022. This is because ISC DHCP is still widely used by Micetro customers and will likely continue to be so for some time.
* Support for Kea version 2.0 as a service that Micetro can overlay is deprecated due to reaching end-of-life status and no longer being supported by ISC. See the roadmap for ISC Kea `here <https://kb.isc.org/docs/aa-00896>`_. It should be noted that support for older versions of Kea is deprecated as well.
----

* Support for Windows Server 2012 and 2012 R2 is deprecated because Microsoft announced end of support on October 10, 2023. This applies both to hosting the Micetro solution itself and as a DNS/DHCP server that Micetro can overlay.
* Support for Microsoft SQL Server 2012 and older versions is deprecated as these databases reached end of support on July 12, 2022. For more information on Microsoft SQL Server roadmap, see `here <https://learn.microsoft.com/en-us/lifecycle/products>`_.
* Support for Ubuntu 14.04 LTS is deprecated as this version reached end of support in Q1 2024 according to the `Ubuntu release cycle <https://ubuntu.com/about/release-cycle>`_.
* PostgreSQL 11 is also deprecated as this database was out of support November 9 2023. For more information on the PostgreSQL roadmap see `here <https://www.postgresql.org/support/versioning/>`_
* Python 3.7 has been deprecated in Micetro due to its end of life in June 2023, according to the `python release cycle <https://devguide.python.org/versions/>`_. All Python scripts, including those used in scheduled scripts or MFA (multifactor authentication), will need to be updated accordingly.

.. _10.5.8-release:

10.5.8
------
June 20, 2024

Improvements
^^^^^^^^^^^^
* Improved functionality to automatically detect if an AWS account in a multi-account setup has been granted DNS access in Micetro.

Bug Fixes
^^^^^^^^^
* Fixed an issue where rolling back changes when adding zones to xDNS failed, resulting in the deletion of the zones.

.. _10.5.7-release:

10.5.7
------
February 13, 2024

Improvements
^^^^^^^^^^^^
* BIND has been upgraded to v9.16.47 on the Micetro appliance to address the following security vulnerabilities:

   * CVE-2023-4408: Parsing large DNS messages may cause excessive CPU load.
   * CVE-2023-5517: Querying RFC 1918 reverse zones may cause an assertion failure when "nxdomain-redirect" is enabled.
   * CVE-2023-5679: Enabling both DNS64 and serve-stale may cause an assertion failure during recursive resolution.
   * CVE-2023-6516: Specific recursive query patterns may lead to an out-of-memory condition.
   * CVE-2023-50387: KeyTrap: Extreme CPU consumption in DNSSEC validator.
   * CVE-2023-50868: High CPU consumption in DNSSEC validator.

.. _10.5.6-release:

10.5.6
------
January 31, 2024

Bug Fixes
^^^^^^^^^
* Resolved an issue where the creation and deletion of A records were wrongly logged twice in event history.

* Fixed an issue that led to the web service crashing when filter parameters were sent without the required filter keyword.

* Resolved an issue in ISC DHCP failover scopes, where leases marked as "released" were not correctly recognized as free.

* Fixed an issue where the system encountered difficulty in locating the ``PythonExecutablePath`` when it contained spaces.

* Fixed an issue where users who selected IPAM as their default landing page would sometimes receive an invalid session error upon logging in.

.. _10.5.5-release:

10.5.5
------
December 5, 2023

Known Issues
^^^^^^^^^^^^
*Issue: Micetro Unable to Locate Python Executable with Spaces in Path*

Micetro experiences difficulty locating the Python executable when the ``PythonExecutablePath`` preference points to a path that contains spaces, impacting external and LDAP authentication configurations.

**Workarounds**:

* Add the Python path to the ``PATH`` environment variable in Windows.

-OR-

* Encase the ``PythonExecutablePath`` preference value with quotation marks on either side. Example: ``<PythonExecutablePath value="&quot;C:\Path with spaces\python.exe&quot;"/>``

Improvements
^^^^^^^^^^^^
* **Enhanced Session ID Algorithm**: We’ve updated the algorithm for generating session IDs. It now uses non-deterministic random values that are automatically seeded from the underlying OS, improving security and unpredictability. This improvement addresses the security vulnerability outlined in CVE-2023-4080.

* **Script Name Fields**: The script name fields (:menuselection:`Admin --> Configuration --> Event Hooks`) now only accept script names and validate the existence of the script in a folder named "scripts" under Central's data folder. Default paths are "C:\\ProgramData\\Men and Mice\\Central\\scripts" on Windows and /var/mmsuite/mmcentral/scripts on Linux. This improvement addresses the security vulnerability outlined in CVE-2023-4079.

  While existing values for script names will continue to function, updating the value requires moving referenced scripts to the scripts folder before they can be selected in the UI.

  The system setting "Folder for scripts to be run from the API" (RunCommandsFromDirectory) has been deprecated. The current value remains functional but cannot be modified, only cleared. The default value is the scripts folder mentioned above. Scripts invoked through the RunCommand API should also be moved to the scripts folder.

  The 'parameters' argument to the RunCommand API has been deprecated.

  While these changes are not breaking, administrators are advised to take necessary actions, as all script invocations are expected to be limited to the scripts folder in a future major release.

Bug Fixes
^^^^^^^^^
* Resolved an issue where SNMP profiles were not displayed in the table when the number of profiles exceeded a specific threshold.

* Fixed an issue where records in recently promoted AuthServe zones could not be edited.

* Addressed an error where the importing of host records for IP addresses would fail.	

* Resolved slowness issues when deleting a zone with a few records from AuthServe. Improved performance when deleting a zone on a Central with a PostgreSQL database.

* Various bug fixes and improvements.	

.. _10.5.4-release:

10.5.4
------
September 20, 2023

Improvements
^^^^^^^^^^^^
* BIND has been upgraded to v9.16.44 on the Micetro appliance.

.. _10.5.3-release:

10.5.3
------
September 11, 2023

New Features
^^^^^^^^^^^^
* **Default TTL Configuration**: Introducing a new system setting that allows users to customize the default Time To Live (TTL) for records created within zones belonging to xDNS profiles. that are in xDNS profiles.	This feature provides enhanced flexibility in managing your DNS records.

Improvements
^^^^^^^^^^^^
* Enhanced Central's handling of HTTPS certificates by now supporting multiple Certificate Authority (CA) files. Additionally, you can no longer select the Strict policy without specifying a CA file or directory, reinforcing security practices.

* NS records are now generated correctly when creating AuthServe zones with secondaries, provided that Initial Records are not specified during zone creation. This enhancement streamlines the process of setting up secondary zones.

Bug Fixes
^^^^^^^^^
* Fixed an issue that previously prevented users from editing SNMP v2 profiles through the Management Console.

* Fixed a bug where Micetro error messages were not displaying correctly in Windows Event Viewer.

* Fixed a bug that resulted in an error when duplicating a range with certain custom properties.

* Resolved a bug that previously hindered the creation of newly converted DHCP scopes on all relevant DHCP servers. 

* Addressed an issue in the Management Console where DHCP scopes on Kea could unintentionally be disabled.

* Resolved an issue where the association between DNS records and IP addresses was not being cleaned up correctly upon zone deletion.

* Fixed a bug where Micetro would not function as expected when managing BIND servers with Catalog zones.

* Fixed a bug that previously prevented the successful creation of a DHCP scope on all relevant DHCP servers when converting a range. 

.. _10.5.2-release:

10.5.2
------
July 11, 2023

New Features
^^^^^^^^^^^^
* **Duplicate Network**: This feature allows you to easily duplicate networks along with their subranges, DHCP scopes and configurations under a new network address. Please note that this feature is  currently not supported for Cisco scopes, Cloud networks, and ranges in a non-CIDR format.

Improvements
^^^^^^^^^^^^

* SNMP profiles now support more modern algorithms for authentication and encryption.

* The **Create DNS record** task now automatically defaults to creating PTR records in reverse zones. Record types that are not applicable to reverse DNS are hidden from the list of available record types.

* Users are now able to use passwords with a length between 4 and 100 characters.

* Users can no longer accidentally convert AuthServe primary zones to secondaries when configuring an option template that has a list of primary servers defined.

* Administrators can now specify default TTL values in system settings using BIND shorthand notation

* The ISC configuration file can now be modified through the Web Application.

* When creating ISC Failover scopes, the scope and pool are now created on both servers.

* The **Manage scope instances** task now only allows adding a scope instance to an ISC Failover scope if both servers have the failover peer specified on the scope/pool.

* A new system setting has been added to control whether A/AAAA records at the zone apex are considered apex records for **Edit apex records** access checks on DNS zones.

* The Generic DNS Controller can now be managed through the Web Application.

* We now log a warning only once when the Central host machine does not support certain secure crypto protocols while connecting to AWS Cloud Services.

* The Redundancy tab in the Create zone wizard is now visible by default.

* Users can now define the valid lifetime for Kea DHCPv4 Scopes.

* Users can now edit Kea DHCP Scope Relay IP Addresses directly through Micetro.

* Servers on which users do not have zone creation access are no longer displayed in the Zone Creation Wizard.

* Access for Replicate failover now requires DHCP admin access.


Bug Fixes
^^^^^^^^^
* Micetro messages are now logged to files instead of the database to address a performance issue caused by an excessive accumulation of messages. Please note that during the upgrade, all messages in the database will be deleted.

* Broken documentation link to Failover management has been fixed.

* Broken documentation link to AD Sites and Subnets was fixed.

* Fixed a bug that prevented users with read-only access to Active Directory from creating IP ranges.

* Resolved an issue related to configuring a fixed Central server in the web service configuration.

* Fixed an issue where DHCP option values in non-standard user class were not automatically replicated to the partner server in MS DHCP failover relationships.

* When attempting to create a zone with an unknown zone type, a more descriptive error message is now returned.

* We now exclude interface configuration from replication between ISC Kea peers.

* Fixed a bug that previously prevented updating AuthServe Options Templates in certain situations.

* Resolved an issue where the order of columns on the Service Management page was not being saved.

* Deleting an Authserve zone that no longer exists will no longer return an error.

* Fixed an issue that occurred when sending an empty HTTP body with utf-8 specified as content type.

* Fixed multiple time zone-related issues in the Web Application.

* Fixed an issue where adding a zone to a new folder wasn't possible

* An issue was fixed where connections to MSSQL databases were not cached on Central running on Linux.
 
* An issue was fixed where the Micetro Central service installer would not remove all temporary files during installation.

* Various accessibility fixes have been implemented in the system settings.

* Links to actions that are only applicable to primary zones have been updated accordingly.


.. _10.5.1-release:

10.5.1
------
June 28, 2023

Improvements
^^^^^^^^^^^^
* Fixed BIND v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2023-2828, CVE-2023-2829, CVE-2023-2911.

.. _10.5.0-release:

10.5.0
------
April 18, 2023

New Features
^^^^^^^^^^^^
* **Micetro Update Management**: Micetro can now be updated to a more recent version directly in the Web Application. In a new and intuitive interface administrators will be notified when new product updates are available. There they can easily review the updates, view the current status of all Micetro components, retry failed updates, and troubleshoot any update.

* **Service Management**: Server Management has been renamed to Service Management and significant improvements have been made to enhance user experience. In addition, we've streamlined the process of adding DNS, DHCP, and IPAM services with a single button that allows you to easily filter by provider or service name.

* **Akamai AuthServe Integration**: Support for Akamai's AuthServe DNS server has been added. Options Templates and the following record types are supported for the server: HTTPS, SVCB, CDS, CDNSKEY, and CSYNC.

* **Support for Kea Client Classes**: We have added support for Client Classifications on Kea DHCP servers (both v4 and v6).

* **Global Object History**: In the Web Application you can now view global object history in one place, which was previously limited to specific objects only. We have also made some minor improvements to the data available. This helps you to quickly and easily trace system activities in the event of an incident or problem. Additionally, all users can view their own object change history.

* **Event Hooks**: Scheduled Scripts are now called Scheduled Events, while External Scripts have been renamed to Change Events. You can manage these events, along with Subnet Monitoring Events on the Admin page of the Web Application.

* **System Settings**: Administrators can now manage the System Settings for Micetro in the Web Application.

* **Move Objects Between Address Spaces**: In the Web Application, servers and ranges can now be moved between address spaces in Micetro.

* **DHCP Management**: We have added the following DHCP management features to the Web Application:

   * Microsoft DHCP server-to-server failover relationships management.

   * Definition of custom DHCP IPv4 and IPv6 options for individual Microsoft, Kea, and ISC services.
   
   * Management of DHCP server properties.

* **Zone Creation Workflow**: We have introduced a new intuitive wizard for creating zones. Among other improvements, custom properties can be added to all zone types and zones can be added to folders during the creation process.

* **Primary and Secondary Zones**: Master/Slave terminology has been replaced with Primary/Secondary in the Web Application.

Improvements
^^^^^^^^^^^^
* The old web interface is no longer packaged with Micetro.

* OS version display for different DNS and DHCP providers is now more consistent.

* The logging functionality was upgraded to exclude sensitive information when modifying AD Forests, Users, and Cloud Services.

* Better handling of Microsoft DHCP JET Database errors when working with reservations on failover scopes.

* Ordering of grid columns in the IPAM view has been improved so that Discovery properties, when set to be shown, are displayed after custom properties.

* BIND 9.18 is now supported by Micetro.

* Micetro is verified to run on Red Hat Enterprise Linux 9.

* The DHCP remote now supports HTTPS connections to the ISC Kea Control Agent.

  .. note::
      This feature was added in Kea 2.0. We officially support version 1.8.
  
* DHCPv6 Scopes are now displayed in the Management Console.

* Type is now required when importing reservations to a Microsoft DHCP scope.

* Discovery schedule can be configured for multiple ranges at a time.

* When allocating subranges, users can select between 16 options instead of 8 in the Web Application.

* The build date of the Web Application can now be seen when hovering over the version number on the login page.

* xDNS profile grid has been updated to look more like other grids in the system. xDNS Profiles can now be opened by double-clicking the relevant row.

* ISC-built packages of BIND are now supported by the Micetro installer.

* We have added a new API command for retrieving multiple free IP addresses located inside a given IP range.

* Various UI/UX and accessibility improvements.

Bug Fixes
^^^^^^^^^

* Performance has been improved when opening scopes on Kea.

* Fixed an issue where it was not possible to add change requests for ranges with an invalid set of custom properties.

* Fixed a bug where license keys with expiry dates were reported as inactive.

* Fixed an issue where promoting a zone would use data from a different primary zone with the same name.

* An issue was fixed where access was not retained when a zone was migrated.

* An issue with setting custom properties with the AddDNSRecords API command was fixed.

* Fixed an issue where submit buttons for change requests in Workflow would render off-screen on certain screen resolutions.

* An issue was fixed where it was not possible to add an IPv6 address of a primary server to a secondary zone.

* An issue was fixed where scope name was not updated to reflect the name of the network.

* An issue was fixed where it was possible to get information about a network through an error message, even though the user does not have access to the network.
