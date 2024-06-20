.. meta::
   :description: Release notes for Micetro 11.0.x versions
   :keywords: Micetro, release notes, releases, update notes

.. _release-notes:

Release Notes
=============

.. note::
  Major releases are only supported for 2 years.


Jump to: :ref:`10.3-release`, :ref:`10.3.1-release`, :ref:`10.3.2-release`, :ref:`10.3.3-release`, :ref:`10.3.4-release`, :ref:`10.3.5-release`, :ref:`10.3.6-release`, :ref:`10.3.8-release`, :ref:`10.3.9-release`, :ref:`10.3.10-release`, :ref:`10.3.11-release`, :ref:`10.3.12-release`, :ref:`10.5.0-release`, :ref:`10.5.1-release`,  :ref:`10.5.2-release`, :ref:`10.5.3-release`, :ref:`10.5.4-release`, :ref:`10.5.5-release`, :ref:`10.5.6-release`, :ref:`10.5.7-release`, :ref:`10.5.8-release`, :ref:`11.0.0-release`, :ref:`11.0.1-release`

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

* xDNS profile grid has been updated to look more like other grids in the system. xDNS Profiles can now be opened by double clicking the relevant row.

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

.. _10.3.12-release:

10.3.12
-------
May 17, 2024

Bug Fixes
^^^^^^^^^^
* Fixed issues with ``GetNextFreeAddress`` to improve concurrency safety when used with the ``temporaryClaimTime`` parameter.
* Fixed reliability issues in the synchronization process of Microsoft DHCP Servers.

.. _10.3.11-release:

10.3.11
-------
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
