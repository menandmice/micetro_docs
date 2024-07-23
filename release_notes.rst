.. meta::
   :description: Release notes for Micetro by Men&Mice 10.5.x versions
   :keywords: Micetro, release notes, releases, update notes

.. _release-notes:

Release Notes
=============

.. note::
  Major releases are only supported for 2 years.


Jump to: :ref:`10.0.8-release`, :ref:`10.1-release`, :ref:`10.1.1-release`, :ref:`10.1.2-release`, :ref:`10.1.4-release`, :ref:`10.1.6-release`, :ref:`10.1.7-release`, :ref:`10.2-release`, :ref:`10.2.1-release`, :ref:`10.2.2-release`, :ref:`10.2.3-release`, :ref:`10.2.4-release`, :ref:`10.2.5-release`, :ref:`10.2.7-release`, :ref:`10.2.8-release`, :ref:`10.2.9-release`, :ref:`10.3-release`, :ref:`10.3.1-release`, :ref:`10.3.2-release`, :ref:`10.3.3-release`, :ref:`10.3.4-release`, :ref:`10.3.5-release`, :ref:`10.3.6-release`, :ref:`10.3.8-release`, :ref:`10.3.9-release`, :ref:`10.3.10-release`, :ref:`10.3.11-release`, :ref:`10.5-release`, :ref:`10.5.1-release`,  :ref:`10.5.2-release`, :ref:`10.5.3-release`, :ref:`10.5.4-release`, :ref:`10.5.5-release`, :ref:`10.5.6-release`, :ref:`10.5.7-release`, :ref:`10.5.8-release`, :ref:`10.5.9-release`

.. _10.5.9-release:

10.5.9
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

   * CVE-2023-4408: Parsing large DNS messages may cause excessive CPU load
   * CVE-2023-5517: Querying RFC 1918 reverse zones may cause an assertion failure when "nxdomain-redirect" is enabled
   * CVE-2023-5679: Enabling both DNS64 and serve-stale may cause an assertion failure during recursive resolution
   * CVE-2023-6516: Specific recursive query patterns may lead to an out-of-memory condition
   * CVE-2023-50387: KeyTrap: Extreme CPU consumption in DNSSEC validator
   * CVE-2023-50868: High CPU consumption in DNSSEC validator

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

* Fixed a bug where Micetro would not functioning as expected when managing BIND servers with Catalog zones.

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

* The ISC configuration file can now be mofified through the Web Application.

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

* We now exclude interfaces configuration from replication between ISC Kea peers.

* Fixed a bug that previously prevented updating AuthServe Options Templates in certain situations.

* Resolved an issue where the order of columns on the Service Management page was not being saved.

* Deleting an Authserve zone that no longer exists will no longer return an error.

* Fixed an issue that occurred when sending an empty HTTP body with utf-8 specified as content-type.

* Fixed multiple time zone related issues in the Web Application.

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

.. _10.5-release:

10.5
------
April 18, 2023

New Features
^^^^^^^^^^^^
* **Micetro Update Management**: Micetro can now be updated to a more recent version directly in the Web Application. In a new and intuitive interface administrators will be notified when new product updates are available. There they can easily review the updates, view the current status of all Micetro components, retry failed updates, and troubleshoot any update.

* **Service Management**: Server Management has been renamed to Service Management and significant improvements have been made to enhance user experience. In addition, we've streamlined the process of adding DNS, DHCP, and IPAM services with a single button that allows you to easily filter by provider or service name.

* **Akamai AuthServe Integration**: Support for Akamai's AuthServe DNS server has been added. Options Templates and the following record types are supported for the server: HTTPS, SVCB, CDS, CDNSKEY, and CSYNC.

* **Support for Kea Client Classes**: We have added support for Client Classifications on Kea DHCP servers (both v4 and v6).

* **Global Object History**: In the Web Application you can now view global object history in one place, which was previously limitied to specific objects only. We have also made some minor improvements to the data available. This helps you to quickly and easily trace system activities in the event of an incident or problem. Additionally, all users can view their own object change history.

* **Event Hooks**: Scheduled Scripts are now called Scheduled Events, while External Scripts has been renamed to Change Events. You can manage these events, along with Subnet Monitoring Events on the Admin page of the Web Application.

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

* xDNS profile grid has been updated to look more like other grids in the system. xDNS Profiles can now be opened by double clicking the relevant row.

* ISC-built packages of BIND are now supported by the Micetro installer.

* We have added a new API command for retrieving multiple free IP addresses located inside a given IP range.

* Various UI/UX and accessibility improvements.

Bug Fixes
^^^^^^^^^

* Performance has been improved when opening scopes on Kea.

* Fixed an issue where it was not possible to add change requests for ranges with invalid set of custom properties.

* Fixed a bug where license keys with expiry date were reported as inactive.

* Fixed an issue where promoting a zone would use data from a different primary zone with the same name.

* An issue was fixed where access was not retained when a zone was migrated.

* An issue with setting custom properties with the AddDNSRecords API command was fixed.

* Fixed an issue where submit buttons for change requests in Workflow would render off screen on certain screen resolutions.

* An issue was fixed where it was not possible to add an IPv6 address of a primary server to a secondary zone.

* An issue was fixed where scope name was not updated to reflect the name of the network.

* An issue was fixed where it was possible to get information about a network through an error message, even though the user does not have access to the network.

.. _10.3.11-release:

10.3.11
------
February 13, 2024

Improvements
^^^^^^^^^^^^
* BIND has been upgraded to v9.16.47 on the Micetro appliance to address the following security vulnerabilities:

   * CVE-2023-4408: Parsing large DNS messages may cause excessive CPU load
   * CVE-2023-5517: Querying RFC 1918 reverse zones may cause an assertion failure when "nxdomain-redirect" is enabled
   * CVE-2023-5679: Enabling both DNS64 and serve-stale may cause an assertion failure during recursive resolution
   * CVE-2023-6516: Specific recursive query patterns may lead to an out-of-memory condition
   * CVE-2023-50387: KeyTrap: Extreme CPU consumption in DNSSEC validator
   * CVE-2023-50868: High CPU consumption in DNSSEC validator

.. _10.3.10-release:

10.3.10
-------
December 5, 2023

Improvements
^^^^^^^^^^^^

* **Enhanced Session ID Algorithm**: We’ve updated the algorithm for generating session IDs. It now uses non-deterministic random values that are automatically seeded from the underlying OS, improving security and unpredictability. This improvement addresses the security vulnerability outlined in CVE-2023-4080.

Bug Fixes
^^^^^^^^^

* Resolved an issue where SNMP profiles were not displayed in the table when the number of profiles exceeded a specific threshold.

* Resolved a bug where Micetro erroneously synchronized interface configurations to the partner DHCPv6 server. The fix ensures that interface configurations are now excluded from replication between ISC Kea peers.

* **Accessibility Improvements**: Several accessibility improvements have been made to the user interface to ensure a more inclusive and user-friendly experience.

* DNS synchronization for NS1 cloud service was fixed after the provider stopped modifying the zone serial number after updates.

* Various bug fixes and improvements.

.. _10.3.9-release:

10.3.9
------
September 20, 2023

Improvements
^^^^^^^^^^^^

* BIND has been upgraded to v9.16.44 on the Micetro appliance.

Bug Fixes
^^^^^^^^^

* Fixed an issue where AWS debug log messages were excessively logged to the Micetro log.

.. _10.3.8-release:

10.3.8
------
June 28, 2023

Improvements
^^^^^^^^^^^^

* Fixed BIND v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2023-2828, CVE-2023-2829, CVE-2023-2911.

.. _10.3.6-release:

10.3.6
------
January 16, 2023

Improvements
^^^^^^^^^^^^
* Improved Azure VPC/subnet synchronization to sync changes to VPC/subnet address space into Micetro

* Accessibility improvements in the UI

* Various UX improvements

Bug Fixes
^^^^^^^^^

* Disabling scopes on KEA is no longer possible and has been disabled in the UI

* Fixed issue where it was not possible to add change requests for ranges with invalid set of custom properties

* Fixed a bug where CNAME and TXT records would sometimes be removed when they shouldn't while clearing IP addresses.

.. _10.3.5-release:

10.3.5
------
October 14, 2022

Improvements
^^^^^^^^^^^^

* DHCPv6 scopes are now displayed in the Management Console (Thick Client)

Bug Fixes
^^^^^^^^^

* Fixed an issue where removing IP addresses would sometimes result in database errors

* Fixed an issue with the Search and Update functionality for IP addresses in the Management Console which sometimes caused database errors

* Removed /64 limitation from the Allocate Subrange wizard. Users can now allocate IPv6 ranges all the way down to /128.

* Various minor improvements and bug fixes

.. _10.3.4-release:

10.3.4
------
September 21, 2022

Improvements
^^^^^^^^^^^^

* Fixed BIND v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2022-2795, CVE-2022-2881, CVE-2022-2906, CVE-2022-3080, CVE-2022-38177 and CVE-2022-38178

.. _10.3.3-release:

10.3.3
------

August 30, 2022

Improvements and Bug Fixes
^^^^^^^^^^^^^^^^^^^^^^^^^^

* Kea DHCP Multi-threading is now supported by Micetro when in High Availability

* Fixed an issue where a user with access to edit IP address properties was unable to Claim IPs

* Improved handling of errors during authentication when further user interaction is required to fulfill additional claims from Azure AD

* Fixed errors related to IIS configuration corrupting location headers

.. Note::
   The Ansible plug-in for Micetro has been updated and is being maintained here in Galaxy (https://galaxy.ansible.com/ansilabnl/micetro) and in Github        (https://github.com/ansilabnl/micetro)

.. _10.3.2-release:

10.3.2
------

August 18, 2022

Improvements and Bug Fixes
^^^^^^^^^^^^^^^^^^^^^^^^^^

* Improved logging for external authentication

* Improved security of external authentication requests (PKCE and nonce)

* Limited the default requested permission to only current user for authentication with Azure AD

* Improved performance when adding DNS records

* Updated xDNS profile grid to look more like other grids in the system

* Improve UX of create network wizard when no existing folders

* A bug was fixed where importing DHCP reservation on Kea gave an error

* Fixed an issue where some auto suggestion fields would auto select the first suggestion

* Fixed issue where an xDNS zone would not be visible in the Management Console if another zone with the same name in a different view was also added to xDNS

* Fixed a problem with BIND possibly getting stuck when doing a logrotate if the appliance was configured to send the system log messages to a remote server

* Fixed an issue where a view with the name "default" would not behave correctly in the UI

* Fixed an issue where submit buttons for change requests in Workflow would render off screen on certain screen resolutions

* Fixed issue where editing properties of an externally authenticated user would prevent him from logging in

* Fixed an issue where some users were unable to switch between Address Spaces

* Fixed issue where navigating web UI with the keyboard would sometimes clear unrelated fields

* Fixed UI glitch where name of xDNS profile for a zone would sometimes not show up in the sidebar

* Fixed an issue where the Inspector no longer showed complete list of master/slave servers in sidebar for cloud zones

* A bug was fixed where the values were not showing up correctly for the filtering criteria when editing access reports

.. _10.3.1-release:

10.3.1
------

July 13, 2022

Improvements and Bug Fixes
^^^^^^^^^^^^^^^^^^^^^^^^^^

* An issue was fixed where the schedule date for a scheduled change request wasn't being saved

* Fixed an issue where the quickfilter showed the value [object Object] when searching for a partial string of the word "object"

* An issue with running the DNS Server Agent (Controller) installer for Bind in chroot on some Linux distributions was fixed

* Improved dropdown menus so they may be viewed in smaller window size

* Improved handling of MS DHCP JET Database errors when working with reservations on failover scopes

* Micetro now uses the correct region endpoints when communicating with AWS in setups where the AWS region provider chain is returning the non default region

* Fixed a performance regression when listing and filtering Networks in the Web application

* Fixed a performance regression when viewing object history in large Micetro databases

* Fixed a bug where a white screen error appeared if an IP address was selected on a disabled server

* AD sites can now be sorted alphabetically in the AD sites grid

* Logging was improved and now excludes sensitive information when editing AD Forests, Users and Cloud Services

* Fixed issue where the "Reveal" action had sometimes to be executed twice to select a revealed IP address

* Various improvements and bug fixes

.. _10.3-release:

10.3
----

June 14, 2022

New Features
^^^^^^^^^^^^
* Multi-factor Authentication: MFA has been added to Micetro. Supported platforms are Okta and AzureAD.

* Multi-vendor DNS Redundancy: xDNS has been improved and simplified with the introduction of xDNS profiles. Profiles group together two or more DNS services which are designated to share the authority of a list of zones. Changes within Micetro are replicated automatically to all services in the profile.

.. note::
   xDNS functionality has been removed from the Management Console (thick client). xDNS functionality is now only available in the web UI. The API functionality has       changed as well. Please check your API calls before upgrading to ensure consistent functionality.

* Custom Properties Select List Enhancement: Manage cascading list options with ease. Configure options for a hierarchy of lists, with a single colon separated raw text list, or navigate and manage the options in a tree view editor.

* KEA DHCPv6 Support: Micetro support added for managing Kea DHCPv6 servers

.. note::
   "KEA DHCPv4" has now been changed to "Kea" in the Micetro server enumeration types, and this will need to be changed in all calls to the API
  

* DHCP administrators can view the lease history for an IPv4 address in the web UI.

Improvements
^^^^^^^^^^^^
* IPv6 addresses are now written using shorthand notation from the API

* Improved the error message when DNS/DHCP server controllers are outdated and incompatible with Micetro Central

* BIND has been upgraded to v9.16 on the Micetro appliance

* Role management: Groups are now listed in a single column to prevent problems with displaying very long group names

* UI/UX improvements - Better keyboard event handling

* Micetro now detects, and reports, if Microsoft Server 2022 is the installed operating system

* Access Management: When managing access for multiple networks user can inherit parent access

* Range was renamed to Network in texts where it applied to both ranges and scopes to avoid confusion

* Filter now recognizes potential IPv6 and colon separated Mac Addresses

* Built-in groups are read-only, when managing users in Micetro users cannot be added or removed from built-in groups

* Better visual indication that a High-availability state switch has started and completed

* All Micetro references to "Fast DNS" have been changed to "Edge DNS"

* Managing BIND 9.16 is now supported in Micetro

* Lists of objects do not show a folder indicator when all items in the list are in the same folder

* Admin user can change custom property type when editing custom properties (except for Yes/No properties)

* When installing Linux Bind Controller it is now possible to specify location of named-checkconf

* Improve access to documentation from product empty states

* Access Management enhancement: Users with manage access permissions can view and manage access for multiple objects at the same time

* Added command to reconcile All DHCP scopes on a DHCP server in web UI

* Service options no longer get stale in add zones/scopes forms

* Held IP addresses can be released and claimed

* General UI enhancements

Bug Fixes
^^^^^^^^^
* DHCPv4 client identifiers are no longer forced to MAC on Kea services

* Using ISC reservations no longer cause the API command SetIPAMRecord to fail

* Fixed a bug involving the $GENERATE directive in BIND configs

* Fixed a problem when not able to bulk import DNS data when there are required custom fields on record level

* Resolved a problem when RPZ zone records can't be edited in Web UI

* Adding a DHCP reservation via the REST API now automatically updates both failover scopes

* Improving multi-selection behavior in the web UI

* Changes made to primary servers will now persist as expected

* Improved handling of down Kea servers in the web UI

* Fixed a bug when no initial records shown in grid for new zones on cloud providers

* Error messages no longer appear when leases are removed from split scope

* Fixed a bug involving address pool creation on ISC DHCP servers with no prior pools

* Column width changes are now persistent

* Fixed a bug where under certain conditions Micetro would not communicate correctly to the active Kea server in a HA setup

* Syntax is no longer changed in TTLs of records when using Workflow

* Special characters are now handled in filters

* The authority section of the Inspector is now updated when zones are migrated

* An issue was fixed where the DHCP remote was unable to read reservations with a missing MAC address

* An issue with rearranging columns in the web application was fixed

* Fixed a problem when editing DHCP reservations on a split scope.

* Record custom properties modified with change requests are now properly logged into audit history

* The related DNS data section of the Inspector is now updated when addresses are cleared

* Setting DHCP boot-file-name option is now supported on Kea

* An issue when editing large Kea files was fixed

* Web UI no longer shows error in service configration tab when system does not have an active IPAM license

* SOA records containing number fields/time unit fields with spaces may now be modified

* Users no longer need to refresh page to use a new address space

* New API commands added to create and get reservations from ranges

* Discovery Schedule and Subnet Monitoring settings are now displayed when viewing Scopes/Ranges

* Users may now click Save when converting a lease to a DHCP reservation without editing the Create DHCP Reservation dialog box

* Fixed a bug where in certain conditions Micetro would not communicate correctly with the active Kea server in HA setup

* DHCP agents are now able to read reservations with missing MAC addresses

* An issue with rearranging columns in the web UI was fixed

* Setting DHCP boot-file-name option is now supported on Kea

* An issue with editing large Kea configuration files was fixed.

* New API commands to create and get reservations from ranges

* Various improvements and fixes

.. _10.2.9-release:

10.2.9
------
December 5, 2023

Improvements
^^^^^^^^^^^^

* **Enhanced Session ID Algorithm**: We’ve updated the algorithm for generating session IDs. It now uses non-deterministic random values that are automatically seeded from the underlying OS, improving security and unpredictability. This improvement addresses the security vulnerability outlined in CVE-2023-4080.

Bug Fixes
^^^^^^^^^

* **Accessibility Improvements**: Several accessibility improvements have been made to the user interface to ensure a more inclusive and user-friendly experience.

* Various bug fixes and improvements.

.. _10.2.8-release:

10.2.8
------
September 20, 2023

Improvements
^^^^^^^^^^^^

* BIND has been upgraded to v9.16.44 on the Micetro appliance.

Bug Fixes
^^^^^^^^^

* Various accessibility improvements were made to the Web Application.

.. _10.2.7-release:

10.2.7
------
June 28, 2023

Improvements
^^^^^^^^^^^^

* Fixed BIND v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2023-2828, CVE-2023-2829, CVE-2023-2911.

.. _10.2.5-release:

10.2.5
------
*November 29, 2022*

Bug Fixes
^^^^^^^^^

* Fixed a bug where CNAME and TXT records would sometimes be removed when they shouldn't while clearing IP addresses.

* Fixed an issue where some auto suggestion fields would auto select the first suggestion.	

* Fixed a bug where the quickfilter showed the value [object Object] when searching for a partial string of the word "object"

* Fixed a problem with BIND possibly getting stuck when doing a logrotate if the appliance was configured to send the system log messages to a remote server.

* Accessibility improvements in the UI


.. _10.2.4-release:

10.2.4
------

Improvements
^^^^^^^^^^^^
* Fixed BIND v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2022-2795, CVE-2022-2881, CVE-2022-2906, CVE-2022-3080, CVE-2022-38177 and CVE-2022-38178

.. _10.2.3-release:

10.2.3
------

*July 5, 2022*

Improvements
^^^^^^^^^^^^

* Micetro now detects, and reports, if Microsoft Server 2022 is the installed operating system.

.. Note::
  Microsoft Server 2022 is now supported in versions 10.2.3 and up

Bug Fixes
^^^^^^^^^

* Fixed a bug where all DHCPv4 client identifiers were forced to MAC on Kea

* Fixed a bug regarding the $GENERATE directive in BIND configs

* Fixed a performance regression when viewing object history in large Micetro databases

* Fixed disappearing values in scope options while hostnames are being resolved

* Logging was improved to not include sensitive information when editing AD Forests, Users, and Cloud Services

* New API commands to create and get reservations from ranges.

* Various accessibility improvements were made to the Web Application

.. _10.2.2-release:

10.2.2
------

*March 16, 2022.*

Bug Fixes
^^^^^^^^^
Fixed BIND v9.11 and v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2021-25220 and CVE-2022-0396 from ISC

.. _10.2.1-release:

10.2.1
------

*March 8, 2022.*

New Feature
^^^^^^^^^^^
* Users with manage access permissions can view and manage access for multiple objects at the same time.

Improvements
^^^^^^^^^^^^
* User can select to inherit parent access when managing access for multiple networks

* Failed login attempts are now throttled to prevent brute force attacks

* Admin users can now change custom property types when editing custom properties (except for Yes/No properties)

Bug Fixes
^^^^^^^^^
* Cisco DHCP remote reservation issues fixed when MAC addresses are missing

* Users are able to more easily reorder property columns in the grid of the Web UI

* Editing reservations for split scopes now appropriately modifies the reservation for all servers

* Deleting reservations for split scopes now appropriately deletes reservations for all servers

* Custom properties modified with change requests from DNS Workflow are now properly logged in audit history

* Requiring definition of custom properties which are children of optional properties is no longer possible

* Setting DHCP boot-file-name option is now supported on Kea

* An issue with editing large Kea configuration files is now fixed

* Fixed a problem where users were unable to bulk import DNS data when there are required custom fields on DNS record level

* Resolved a problem where RPZ zone records can't be edited in the web UI

* Web UI no longer shows error in server page when system does not have an active IPAM license

* An issue was fixed where an incorrect error message was displayed when login failed 

* Multiple minor improvements and fixes to enhance user experience


.. _10.2-release:

10.2
----

*February 3, 2022.*

New Features
^^^^^^^^^^^^

* DHCPv6 Management: Enjoy the same level of management and visibility for dynamically allocated IPv6 addresses as you have with IPv4 and DHCP in your Windows environments. Toggle DHCPv6 management on or off by server or enable it on multiple servers at once. 

* Custom Property Management: Custom Properties can now be managed through the Micetro web interface. Create searchable fields to track information about your DNS zones, DNS records, DHCP scopes, networks, IP ranges and other objects in Micetro. There are two Default Custom Properties built in to the Range object type that come with Micetro which are Title and Description.

* HA Management: Administrators can now manage High Availability for Micetro Central by adding servers, defining priority, and executing failovers via the Web UI. 

* Reconcile DHCP Scopes: Manage DHCP scope reconciliation for Microsoft DHCP server from the Micetro Web UI to ensure consistency between the DHCP database and DHCP registry.

Updates
^^^^^^^

* Microsoft has deprecated support for Windows Server 2008 R2 and therefore Micetro will no longer support this Operating System

* Microsoft has deprecated support for SQL Server 2008 R2 and therefore it will no longer be supported by Micetro

* Micetro will no longer support the 32-bit Linux Operating Systems

Improvements
^^^^^^^^^^^^
* Users are now able to create DHCP split scopes in the Web UI for both DHCPv4 and DHCPv6

* When hovering over the folder icon next to a network or DNS zone, the tooltip now shows the full folder path when an object is in a subfolder

* NAPTR records are now supported in AWS Route53

* Colons are now supported when entering hex values in the UI. For example “f1:04:0a:03:e0:0a” is now accepted as an appropriate entry for a field which requires hex.

* Admins may now manually specify a BIND user or BIND group when deploying Micetro to work with BIND

* Folders are now sorted alphabetically in the left sidebar

* The email support address shown under licensing support and error messages is now consistently the same address

* When deleting a folder the folder name is now shown in the popup message confirming deletion

* Improved the order of permissions to be consistent among multiple dialog boxes

* When performing an action on multiple objects, task names are now displayed in plural form

* Read-only Active Directory sites are not shown any longer in the dropdown for setting AD Sites for DHCP scopes or IP ranges

* When there are no DHCP or DNS servers present, the information shown reflects the empty state with helpful information

* For a zone or network that is contained within a folder, users can now click on the folder icon next to that object to view a list of all other objects contained within that folder. Hovering over that folder icon still shows the name of the folder.

* When editing DHCP options to enter a subnet mask value, the IP insight information is no longer displayed as it is when entering IP address information

* Users are no longer given the option to manage read-only forests under AD Sites

* Users with correct permissions may now perform a bulk action of unblocking multiple roles at the same time.

* When running reports users may now specify which DNS servers to include in the filter so as to avoid duplicate information within the report from redundant or testing servers for example.

* By default, when there are no additional address spaces to the default address space, permissions will automatically be assigned to the default address space. When there are additional address spaces, then permissions will need to be managed specifically for each address space.

* When editing a user under the Admin>>Configuration tab the user name will now be displayed in the dialog box.

* Users may be authenticated with read-only domain controllers by setting the ReadOnlyDC preference value.

* Reserved and Leased IP address states are now filterable/sortable in the IPAM grid for a network

* The API call GetAvailableAddressBlocks will now claim subnets for a short amount of time so they can’t be used by others

Bug Fixes
^^^^^^^^^

* Editing a record in an AD integrated zone will no longer create duplicate records by leaving the old record in the zone

* DHCP Option 43 is now stored as Hex value instead of ASCII making it possible to configure option 43 for ISC DHCP users.

* If the BGPD service is enabled on DDI appliances it will now start automatically after a restart of the appliance

* Increased the size of the externalID column in the mm_users db table to fix an issue where users with longer usernames couldn’t login

* In the “Delete Zone” dialog box, when master zones are selected, other unrelated zones are no longer selected as well.

* Double clicking on the meatballs menu of a row in the IPAM or DNS grid only opens menu options instead of following the behavior of double clicking on the row itself to open the properties

* Hovering over an action button in the inspector on the right side of the Web UI no longer displays two tooltips.

* Improved error message is now shown when a user tries to rename an SNMP profile with a name that already exists.

* Labels in the Change Request dialog box under Workflow have been enlarged with legible text

* It’s now possible to create multi-string TXT records

* Filtering scopes by server no longer shows scopes from unrelated servers

* Next button will now appear so users may move forward when editing reports to adjust the utilization percentage in the Reports Wizard 

* The admin page in the Web UI is no longer visible to those without privileges

* Improved indicator display of subranges inside range folders

* Improved error message shown when a user tried to rename an SNMP profile with a name that already exists

* When using a REST call to add a DHCP reservation the reservation will now be added to the active and failover scope in the case that failover has been configured

* Long DHCP reservation names no longer cause errors when sending requests to the servers

* Renaming Azure accounts without re-entering the client secret management account credentials is now allowed

* Multiple minor improvements and fixes to enhance user experience

.. _10.1.7-release:

10.1.7
------
September 20, 2023

Improvements
^^^^^^^^^^^^

* BIND has been upgraded to v9.16.44 on the Micetro appliance

.. _10.1.6-release:

10.1.6
------
June 28, 2023

Improvements
^^^^^^^^^^^^

* Fixed BIND v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2023-2828, CVE-2023-2829, CVE-2023-2911.

.. _10.1.4-release:

10.1.4
-------

Improvements
^^^^^^^^^^^^
* Fixed BIND v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2022-2795, CVE-2022-2881, CVE-2022-2906, CVE-2022-3080, CVE-2022-38177 and CVE-2022-38178

.. _10.1.2-release:

10.1.2
------

*December 15, 2021.*

Improvements
^^^^^^^^^^^^
* Messages when no folders are present under DNS or IPAM are now more human readable and informational.

* Links within the Micetro Management Console and Web UI now direct readers to updated documentation.

* Consistent format shown for read-only Active Directory Sites in all dropdown menus.

* Error message that appears when trying to change an SNMP profile name to an existing name has been improved to be more informational.

Bug fixes
^^^^^^^^^
* There’s no longer a syntax error that pops up when modifying text records that contain data fields over 255 characters.

* Admins will be able to add AD groups in the Web UI when AD Sites and Services feature has been disabled.

* Selecting A or PTR records no longer intermittently causes unnecessary data fetching from server.

* “PTR Status” column will now always show correct status for IP addresses.

* NAPTR records are now correctly formatted before being sent to AWS Route 53.

* Filtering scopes by server no longer shows scopes on unrelated servers with similar names. Your bulk clean-up operations are safe again!

* Accurate informational error message pops up when trying to create a folder that already exists.

* Fixed alignment issue under Access column when creating/editing permissions list for new Roles.

* Correct SNMP profiles will appear when switching between Micetro Central platforms without having to refresh.

* Find Next Free Address command in the web UI glitched at times but is now guaranteed to work correctly.

* Expand/contract function when viewing nested CIDR boundaries, or “Tree View,” under the IPAM tab will work as expected.

* Text for task in Groups under Access Control has been changed from “Remove User” to “Remove Group.” 

* Create Network Wizard is now more intelligent when checking whether a range can be created.

* Fixed rendering issue in filtering sidebar where two items might appear to be selected at the same time.

* Column alignment in Import DNS Records” list has been corrected.

* TXT records that include quotation marks can now be created on Akamai and Dyn DNS.

* Fixed minor issues when adding, removing, and editing Active Directory Forests.

* Extra comma(s) in the IN operator in the API no longer returns “No Results.”

* Multiple minor improvements and fixes to make user experience better.

* Improved string validation in a number of API commands.


.. _10.1.1-release:

10.1.1
------

*October 27th, 2021.*

* Fixed BIND vulnerability `CVE-2021-25219 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-25219>`_ on the Men&Mice Virtual Appliances. See :ref:`security-announcements` for details.

* Fixed an issue with upgrading to Micetro 10.1 with a Microsoft SQL 2008R2 or earlier database.

.. _10.1-release:

10.1
----

*October 19th, 2021*

.. important::
   Version 9.2 will no longer receive bug fixes and feature updates. Please update your Micetro to at least version 9.3.

Known issues
^^^^^^^^^^^^

  .. important::
    There is a known issue when updating to Micetro 10.1 using **Microsoft SQL Server 2008R2 (or earlier)**. The database upgrade process contains the string CONCAT command that was implemented in SQL Server 2012.
    Until we've published the fix for this issue, use the following workaround:

    1. In the SQL Server Management Studio run the following on the database (default: ``mmsuite``):

       .. code-block::

            ALTER TABLE mmCentral.mm_preferences ALTER COLUMN [value] VARCHAR(MAX);
            insert into mmCentral.mm_preferences SELECT ('_mm_shared_config_'+LOWER("key")),value from mmCentral.mm_configuration where identityid=4294967295;
            DELETE FROM mmCentral.mm_configuration WHERE identityid = 4294967295;
            insert into mmCentral.mm_databaseupgrades values (17383);

    2. Restart Central.

    We'll publish a maintenance release containing the fix for this issue soon.

New features
^^^^^^^^^^^^

* New Access Control management: access controls in Micetro have been redesigned from the ground-up, and provide a fully role-based, flexible management. Existing configurations will be converted into the new model while preserving backward compatibility. Read :ref:`access-control` and :ref:`access-control-example` for details.

* Folder management is now available in the Web Application. Users can organize DNS and IPAM objects using traditional folders and customizable smart folders (saved filters) to quicken their workflows. "Smart people use folders. Even smarter people use smart folders."

* AD Sites and Subnets management has been streamlined and integrated into the IPAM context of the Web Application.

Improvements
^^^^^^^^^^^^

* DNS administrators can manage preferred servers for DNS zones in the Web Application.

* SNMP profile management is available in the Web Application.

* A new slide-in help is available for many functions, offering further details on functionality and syntax for their respective operations. Not a water slide in a theme park, but it is still weirdly satisfying.

* Micetro components will no longer display errors if they're reporting different minor versions. We're all one family here.

* Users can import DHCP reservations to Micetro using the Web Application, including bulk import. Get yer CSV goodness on!

* Lease names are searchable in the Quick Command. So you can have a better leash on them. (We'll see ourselves out.)

* Custom links can be added to the Micetro login screen.

* Improved subnet management, including splitting and merging subnets. Alchemy, almost; although no turning iron into gold with Micetro. Yet.

Bug fixes
^^^^^^^^^

* Wildcard policies on AWS will display a descriptive error message (as they're not currently supported in Micetro).

* Users can use relative time (i.e. >=-7d) in the Reporting module. Because time is relative, and E equals m times c squared. Except in quantum, but let's not sweat the small stuff.

* BIND installer will no longer get stuck during installation. Sticks and stones may break our bones, but stuck things are just weird.

* DNS and IPAM data is properly updated when changing address spaces. Multiverse mixup, we've had words with the Sorcerer Supreme.

* Using the Quick Filter properly highlights the query in the name column. As this is how it's supposed to work, this fix is a highlight to share.

* Using the 'View scopes' action on a DHCP server will properly show the scopes on the DHCP server. Because it. Has. One. Job.

* Creating a scope on a Cisco DHCP server no longer fails randomly.

* No longer possible for the logged-in user to remove themselves. Word came down that it created a bunch of variants that bottlenecked the TVA, and who needs that?

* Updating refresh times on SOA records will no longer fail with a cryptic error.

* Tooltips no longer appear erroneously on top of the screen after closing their window. They understand now that they have to respect the boundaries of others, just like all polite UI elements do.

* Editing a DHCP pool will no longer result in a locked up dialog window due to illegal from/to address input.

* Converting a network to a DHCP scope will no longer have a missing field. It's returned safe and sound, we can take it off the milk cartons finally.

* Using the 'View history' action will no longer return an error message when a filter is applied.

* The 'Reserve' button will no longer disappear from the Action menu. This type of hide-and-seek is not appropriate in the workplace.

* Streamlined the Men&Mice Central binary to reduce size. Took a lot of pilates, but now it's in much better shape.

* The 'Import records' task is no longer available in Quick Command. We don't know why it was there in the first place. It's not like we put it there. <whistles innocently>

* Login no longer fails if no DNS license key is activated. Some like IPAM with no pulp, and we don't judge.

* Users can use the 'subType' field as a query parameters within data from cloud providers. Suber!

* Adding a cloud provider to Micetro properly runs synchronization for DNS data.

* Men&Mice Web Services will no longer report unhandled exceptions on a Windows Server. While Micetro is exceptional, we're plenty able to handle it.

* The 'Edit reservation' button once again works as expected. Good button, have a cookie.

* Resizing the Inspector panel will no longer cause sections to lock up. No DataTables left behind.

* You can use 'Add to favorites' on IPAM objects as well. We don't like to play favorites, so we're giving favorites to all.

* Removing a cloud account will properly remove all related data from Micetro. Having your ex's stuff around is never a good idea.

* Men&Mice Central will no longer run out of memory when scanning a large number of SNMP profiles. To paraphrase Lady Liberty: give Micetro your huddled SNMP masses yearning to breathe free.

* Pool indicators are refreshed when editing exclusions for a scope.

* Deleting TXT records containing & in the data field no longer fails in AWS. & all rejoiced & the world was at peace again.

* Using the Quick Filter for Networks will no longer cause loading skeletons to appear.

* Exceeding the retry limit in Azure will properly throw an exception.

* Fixed an issue where DNS administrators would not have access to a DNS record's history. Obviously they should. And now they do.

* The 'Edit configuration' task is no longer enabled for unreachable servers.

* The 'Add DNS Zone' task from Quick Command properly fills out the name for the zone. Otherwise it's not magic, now is it?

* Clicking 'Save' on dialogs with no changes made closes the dialog. Clicking save on dialogs that have been modified validates the input. Save the cheerleader, save the world.

Other
^^^^^

* Various performance improvements and UX tweaks. Micetro does things faster and nicer.

.. _10.0.8-release:

10.0.8
------

Improvements
^^^^^^^^^^^^
* Fixed BIND v9.16 vulnerabilities on the Micetro appliance addressed in CVE-2022-2795, CVE-2022-2881, CVE-2022-2906, CVE-2022-3080, CVE-2022-38177 and CVE-2022-38178
