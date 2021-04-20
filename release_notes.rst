.. _release-notes:

Release notes
=============

.. note::
  All upcoming major releases are supported for 2 years.

Jump to: :ref:`9.3.0-release`, :ref:`9.3.1-release`, :ref:`9.3.2-release`, :ref:`9.3.3-release`, :ref:`9.3.4-release`, :ref:`9.3.5-release`, :ref:`9.3.6-release`, :ref:`9.3.7-release`, :ref:`9.3.8-release`, :ref:`9.3.9-release`, :ref:`9.3.10-release`

.. _9.3.10-release:

9.3.10
------

*April 13th, 2021*

* An issue was fixed where editing master servers for a forward zone through the web application did not behave as expected

* An issue was fixed where the initial Azure DNS synchronization erroneously removed all zones and added them again

* An issue was fixed where a GET  REST API command on DNSZone with a set DNSRecords filter could crash Men&Mice Central.

* An issue was fixed where adding a TXT record to AWS and the record data contains an "&" it would erroneously be converted into "&amp;"

* An issue was fixed where VPCs were not being discovered because of an authorization issue

* An issue was fixed where to clear an IP address would require the access bit "Use IP addresses in DNS"

* An issue was fixed where TXT records that exceeded 255 characters in length were not handled correctly on NS1

* An issue was fixed where CAA records with additional double quotes were not handled correctly on NSONE

* An issue was fixed where it was not possible to create a new subnet in the web application when using the Edge web browser

* An issue was fixed where trying to create a new network in the web application would result in an endless loop at comment field when user does not have access

* An issue was fixed in the web application where the Lease MAC addresses were not formatted properly

.. _9.3.9-release:

9.3.9
-----

*January 6th, 2021*

This is a maintenance release containing various fixes and improvements.

Bug fixes
^^^^^^^^^

* An issue was fixed in the Web application installer where it failed if Apache had never been run before on the server

* An issue was fixed in the web application where it was not possible to add A records to AD integrated zones

* An issue was fixed where ping discovery only updated IP addresses in the default address space

* An issue was fixed where the CAA record flag "0" would be ignored

* An issue was fixed in the Web application reports where a True/False value would be misinterpreted.

* An issue was fixed where DHCP failover relationships would not be handled properly if the DHCP server has an anycast IP address

* An issue was fixed where Men&Mice Central would not properly handle a misconfigured Python installation.

* An issue was fixed where changing between address spaces could fail

Improvements
^^^^^^^^^^^^

* An option was added to allow Men&Mice Central to use Python 2.7 instead of Python 3

* An improvement was made on how routers and switches are uniquely identified in the system

* An improvement was made on managing DHCP scopes in failover

* An improvement was made on the webservice component performance

New Features
^^^^^^^^^^^^

It is now possible to manage services in the Azure Government cloud

.. _9.3.8-release:

9.3.8
-----

*October 12th, 2020*

This is a maintenance release containing various fixes and improvements.

Bug fixes
^^^^^^^^^

* An issue was fixed where adding of DNS records to AWS would fail when an RRSet with a different casing was present

* An issue was fixed involving authentication when using SSO

Improvements
^^^^^^^^^^^^

* An option was added in advanced system settings to toggle between case sensitive / non-case sensitive for values

* The allocation wizard in the Management Console and the old web interface has been changed so that it does not copy read-only custom properties from the parent subnet anymore

* Logging for AWS account discovery was improved

* The following DNS record types are now supported in the Web Application

  - WKS

  - RP

  - AFSDB

  - LOC

  - SSHFP

  - SPF

  - DNSKEY (read only)

  - NSEC (read only)

  - NSEC3 (read only)

  - NSEC3PARAM (read only for now at least)

  - RRSIG (read only)

  - DS

  - DLV (read only)

* The web service has been disabled on the Men&Mice Appliances

.. _9.3.7-release:

9.3.7
-----

*September 4th, 2020*

This is a maintenance release containing various fixes.

Bug fixes
^^^^^^^^^

* An issue was fixed where an if/else statement in the dhcp configuration of ISC DHCP was not handled properly

* An issue was fixed where the installer for the Web Application was overwriting the mmweb.conf file

* An issue was fixed in the Web Application where the "Create DHCP scope" checkbox was enabled when no DHCP servers were available.

* An issue was fixed in the Web Application where the screen could lock up during an import

* An issue was fixed where the DHCP Controller would lose connection to Cisco DHCP and does not recover until it gets restarted.

* An issue was fixed where a large DNS zone hosted on Dyn could cause an error regarding SOA not being present

* An issue was fixed on the Men & Mice DDI appliances where a slaves directory would be missing in the initial config.

* An issue was fixed where a DHCP option would be erroneously deleted when switching between hex and binary.

* An issue was fixed where the DHCP controller could stop due to an error that the configuration was not correct.

* An issue was fixed where Free IP addresses would be listed in a failover DHCP as Assigned (Pool)

.. _9.3.6-release:

9.3.6
-----

*August 20th, 2020*

This is a maintenance release containing a security update.

Appliances
^^^^^^^^^^

* BIND on the Men&Mice DDI appliance was upgraded due to the CVE-2020-8622,CVE-2020-8623 and CVE-2020-8624 vulnerabilities

Bug fixes
^^^^^^^^^

* An issue was fixed where a delay when logging in to a Cisco DHCP server was not handled properly

* An issue was fixed where an exception when logging in to a Cisco DHCP server was not handled properly

Improvements
^^^^^^^^^^^^

* The handling of DNS resolving servers was improved

* The handling of updating the service status of DNS servers was improved

.. _9.3.5-release:

9.3.5
-----

*June 24th, 2020*

This is a maintenance release containing various fixes and improvements.

Appliances
^^^^^^^^^^

* BIND on the Men&Mice DDI appliance was upgraded due to the CVE-2020-8619 vulnerability

* Unbound on the Men&Mice Caching appliance was upgraded due to the CVE-2020-12662 and CVE-2020-12663 vulnerabilities.

.. _9.3.4-release:

9.3.4
-----

*May 19th, 2020*

This is a maintenance release containing various fixes and improvements.

Appliances
^^^^^^^^^^

* BIND on the Men&Mice appliances was upgraded due to CVE-2020-8616 and CVE-2020-8617 vulnerabilities

Bug fixes
^^^^^^^^^

* Improved service state detection for DNS and DHCP server controllers

.. _9.3.3-release:

9.3.3
-----

*May 18th, 2020*

This is a maintenance release containing various fixes and improvements.

Improvements
^^^^^^^^^^^^

* Dynamic update timeout is now configurable

* It is now possible to disable automatic updates of PTR records

* Improved AWS multi account discovery performance

* Improvement performance with API filtering

* Improved handling of Route53 octal encoded characters

Bug fixes
^^^^^^^^^

* An issue was fixed where Men&Mice Central could not communicate as expected with newer Cisco IOS versions

* An issue was fixed where race conditions in network discovery could cause the Men&Mice Central service to go down

* An issue was fixed where an attempt was made to synchronize recently removed DNS servers, causing the sync to abort for all servers

* An issue was fixed where thread information was not being logged to the debug log

* An issue was fixed with adding a scope in the Web Application to a Cisco IOS DHCP server

* An issue was fixed where the IP address last seen column in the Web Application was not updated after an IP address was pinged

.. _9.3.2-release:

9.3.2
-----

*February 21st, 2020*

This is a maintenance release containing various fixes and improvements.

Bug fixes
^^^^^^^^^

* An issue was fixed in the web application where the "Create" button above the lists was disabled if nothing was selected.

* An issue was fixed where it was not possible to create a DNS entry on an AD integrated DNS zone.

* An issue was fixed where Men&Mice Central could crash in certain circumstances.

* An issue was fixed where re-adding a DHCP pool would return an error indicating an already existing pool.

* An issue was fixed in the web application where it was not possible to create a DHCP reservation.

* An issue was fixed where utilization and number of free addresses were not shown initially for DHCP scopes that were synced externally.

* An issue was fixed in the web application where the Import task would not handle importing from a CSV file.

* An issue was fixed where the REST API call for GetAvailableAddressBlocks for an IPv6 address range would not work as expected.

* An issue was fixed in the web application where importing IP address ranges could fail with an error "Unknown element: iscontainer".

* An issue was fixed where a race condition could lead to a DHCP scope on a MS DHCP having two address pools.

* An issue was fixed in the web application where the report preview window could get into an always busy state.

* An issue was fixed in the web application where the column configuration drop down for the Networks / DNS list would not be entirely visible when the screen height was not high enough.

* An issue was fixed where the xDNS creation wizard could end up in an abnormal state.

* An issue was fixed in the web application where editing SOA for multiple DNS zones would not be handled properly.

Improvements
^^^^^^^^^^^^

* Various UI/UX improvements in the web application.

* Various performance and stability enhancements.

.. _9.3.1-release:

9.3.0
-----

*January 24th, 2020*

This is a maintenance release containing various fixes and improvements.

Bug fixes
^^^^^^^^^

* An issue was fixed in the web application where DNS zones hosted on the Akamai Fast DNS cloud provider were not properly handled.

* An issue was fixed where Men&Mice Central could crash due to mishandling of DNSSEC related records.

.. _9.3.0-release:

9.3.0
-----

*January 16th, 2020*

This version will be supported for 2 years or until January 16th, 2022.

End-of-Life Announcements
^^^^^^^^^^^^^^^^^^^^^^^^^

.. important::
  As of version 9.3.0 of the Web Application, Internet Explorer is not supported. In the case of trying to log in to the Web Applications using IE, the user will be redirected to the older version of the Web Interface. For more details, see :ref:`ie-eol`.

.. important::
  Support for Solaris in the Men&Mice Suite will be deprecated in version 10.0 of the Men&Mice Suite.

.. important::
  Version 8.3 of the Men&Mice Suite is no longer supported as of January 11th 2020.

.. important::
  On January 14, 2020, Microsoft ended its support for Windows server 2008 and 2008 R2 and therefore support for those server types will be deprecated in future versions of the Men&Mice Suite.

New Features and Improvements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Web Application
"""""""""""""""

* Support was added to manage DHCP scope options.

* Master server lists for slave zones can be managed.

* It is now possible to view non MAC address client identifiers as ASCII.

* It is now possible to type an IP address into the quick filter for Networks and instantly get the range/scope that contains that IP address.

* The usability of the quick filter was improved.

* TTL shorthand notation is now supported when working with TTL for DNS records.

* DHCP scopes can now be enabled and disabled.

* Support was added for importing DNS hosts along with IPAM data.

* Dynamic DNS zones are now indicated in the list view of DNS zones.

* It is now possible to migrate DNS zones between DNS servers and services.

* Session management and login were improved.

* Improvements were done on viewing the Web Application on mobile screens.

* User can now get various details for an IP address when creating and editing A records in a DNS zone.

* User can now more easily find the next free IP address when creating A records in a DNS zone.

* The usability when working with CNAME records in the Web Application has been improved.

* An administrator can now specify a fixed server name to be used in the login window for the Web Application.

* It is now possible to switch between address spaces in the Web Application.

* The Web Application is now automatically updated with other components of the Men&Mice Suite.

* Management of NAPTR records has been improved.

* It is now possible to add/remove items (DNS zones, networks) to pre-defined folders in the system.

* The inspector on the right hand side in the Web Application is now resizeable and more usable.

* Discovery schedule can now be set for networks as well as enabling/disabling discovery for a particular network.

* IP address ranges can now be converted to containers or DHCP scopes.

* DHCP scopes can now be converted to IP address ranges.

* Containers can now be converted to IP address ranges.

* Typeahead functionality has been added when creating DNS hosts for an IP address.

* Folders in the filtering sidebar are now presented as a collapsable tree.

* Information on which DHCP server is authoritative for a DHCP scope is now shown in the respective list along with the type of the DHCP scope.

* The import task for IP address ranges has been expanded to handle an import of devices and interfaces.

* The list of DNS zones now shows by default the master zones defined in the system.

* When deleting a DNS zone, it is now possible to select which zone instance is to be deleted.

* It is now possible to create a report on IP addresses and get IP addresses and the respective custom field as a result.

* In reporting, the report properties and management of scavenging was merged for better usability.

* In reporting, a separate page now exists for displaying all reports that belong to a particular report definition.

* DHCP pool information is now shown in the DHCP scope list.

* Performance of showing DNS zones or networks in the list was improved.

* Non-responding or disabled servers are not shown in the server list when adding DNS zones.

* Various accessibility improvements were done in order to be conforming to the Web Content Accessibility Guidelines 2.1.

* The active filter in the filtering sidebar is now a part of the URL in order to better maintain the filter when the page is refreshed.

* Improvements were done on displaying errors in case of login errors.

* It is now possible to specify a script that is run after a scheduled report run.

* A widget was added for specific fields to quickly switch between ASCII and HEX representation of the data in the field.

General improvements
^^^^^^^^^^^^^^^^^^^^

* An issue was fixed where the state of services were not consistent between the UI and the API.

* Various improvements were done for the High Availability feature of the Men&Mice Suite.

* Rate-limiting for the NS1 cloud service is supported.

* Support for AD authentication from Linux has been added.

* The support for python 3 in the Linux installer for the Men&Mice Suite has been improved.

* Message severity is now being indicated in the logs for Men&Mice Central.

* The functionality when promoting a slave zone to a master zone has been improved.

* The functionality when migrating a DNS zone between DNS servers has been improved.

* Full support was added for Akamai's Fast DNS.

* Support was added for MS-SQL when running Men&Mice Central on Linux.

* The DHCP scope contents are now synchronized when opening the DHCP scope to ensure most accurate data being shown.

* Various security related enhancements.

* Various performance improving enhancements.

* Various improvements on High Availability.

* It is now possible to specify if empty resource groups in Azure are hidden or not under DNS views.

Bug Fixes
^^^^^^^^^

* An error was fixed where disabled zones would not be handled properly after an upgrade.

* An error was fixed where Men&Mice Central could crash in a specific case where user was sorting by DNS views in the Web Application.

* An error was fixed where the object type was being shown in the history for the Web Application instead of the type of the event being shown.

* An issue was fixed in the Web Application where reloading the list would lose the current selection in the list.

* An issue was fixed in the Web Application where an error stating "IP range not found" would be wrongly returned when deleting an IP range.

* An issue was fixed in the Web Application where creating a reservation would not prompt for a save comment.

* An issue was fixed where an extra zero was being shown for the "Lease expires" column in the UI's.

* An issue was fixed in the Web Application where creating a network would not properly handle IPv6 addresses.

* An issue was fixed where a deadlock could occur when splitting IP address ranges.

* An issue was fixed in the Web Application where creating a range would not refresh the list afterwards.

* An issue was fixed in the Web Application where form buttons were reversed in the wizards.

* An issue was fixed where the Management Console would not show inherited DHCP options in the case of both failover DHCP scopes being selected.

* An issue was fixed in the Web Application where the IP address report was not working as expected.

* An issue was fixed in the Web Application where under specific circumstances, a UNIQUE KEY CONSTRAINT error would be returned when opening an IP address.

* An issue was fixed in the Web Application where deleting a DNS zone would not properly handle DNS views.

* An issue was fixed in the Web Application where pool information in the create new network wizard would get reset to default.

* An issue was fixed in the Web Application where in the case of creating a reservation in a failover DHCP scope, only one reservation would be created.

* An issue was fixed in the Web Application where the quick command dialog would not close after an action was executed.

* An issue was fixed in the Web Application where it was not possible to create a PTR record that contained multiple labels.

* An issue was fixed in the Web Application where the default view name would not be rendered correctly.

* An issue was fixed in the Web Application where pressing enter on a selected row in the list could result in an error.

* An issue was fixed in the Web Application where validation errors for custom properties were not being shown when creating a DHCP scope.

* An issue was fixed in the Web Application where the access was not being properly handled for data in the inspector.

* An issue was fixed in the Web Application where entering an invalid user name when creating a new report would wrongly result in a validation error.

* An issue was fixed in the Web Application where creating a DNS zone would not reveal the DNS zone after creating if required.

* An issue was fixed in the Web Application where creating a report based on SOA DNS records would not work as expected.

* An issue was fixed in the Web Application where some discovery data was not being sent from Men&Mice Central which resulted in invisible columns containing discovery information.

* An issue was fixed in the Web Application where deleting a report result could lead to a toaster being shown referring to the report as "undefined".

* An issue was fixed in the Web Application where the number of items in the favorite filter was incorrect.

* An issue was fixed in the Web Application where usage of the quick filter would reset the configuration of visible columns in the list.

* An issue was fixed in the Web Application where deleting a report and then deleting another report afterwards would result in a message indicating you are deleting two reports.

* An issue was fixed in the Web Application where opening a DHCP scope and using the quick filter would render the Web Application unusable.

* An issue was fixed in the Web Application where creating a report based on access would require an additional backslash when working with AD users.

* An issue was fixed in the Web Application where an IPv6 address would not be displayed in the quick command results if the IPv6 address was contained in the root range.

* An issue was fixed in the Web Application where an IPv6 address could not be revealed as expected.

* An issue was fixed in the Web Application where creating a DNS record would not respect the default TTL value, but always show 1D for the TTL value.

* An issue was fixed where the DHCP pool utilization could in specific circumstances be higher than 100%.

* An issue was fixed where a limit on the NS1 cloud service prevented a successful sync of DNS records between NS1 and Men&Mice Suite.

* An issue was fixed where the proxy functionality for AWS cloud services was not working as expected when adding a new AWS cloud service.

* An issue was fixed where the Men&Mice Central service could crash under the circumstances where the SQLite database was locked.

* An issue was fixed in the support for ISC DHCP where in some cases specific keywords for leases would not be recognized.

* An issue was fixed where the performance of ping in the system would not be as expected.

* An issue was fixed where SNMP monitoring on the Men&Mice Appliances was not working as expected after an upgrade.

* An issue was fixed where a check for duplicate DNS record names was wrongly case sensitive.

* An issue was fixed where an error was wrongly being displayed when creating reservations inside DHCP pools on the ISC DHCP server.

* An issue was fixed where deleting an NAPTR record could in some cases fail.

* An issue was fixed where the GetIPAMRecords API command for an array of IPs would not return DHCP related data.

* An issue was fixed where adding a DNS zone to an xDNS group could fail and would not be handled properly.

* An issue was fixed where migrating a DNS zone would not properly handle a hidden master.

* An issue was fixed where an external promotion of a DNS zone from slave to master was not being detected in the Men&Mice Suite.

* An issue was fixed where the Generic DNS controller did not properly manage DNSServerSubtype.

* An issue was fixed where disabled DNS zones were not being managed properly after changing the name of the DNS server.

* An issue was fixed where creating an xDNS group could result in an error which stated "Object reference provided is not a valid zone reference".

* An issue was fixed where adding a DNS zone to an xDNS group could result in an exception.

* An issue was fixed where synchronizing cloud data could result in an error caused by missing parameters.

* An issue was fixed where it was not possible to re-sync DNS zones in an xDNS group when they were reported out of sync.

* An issue was fixed where leases in the state Free or Backup on the ISC DHCP server were being displayed as Leased or Inactive.

* An issue was fixed where migrating master DNS zones would not correctly update the slave DNS servers.

* An issue was fixed where migrating DNS zones to Akamai's Fast DNS could result in an exception, preventing the migration.

* An issue was fixed where migrating a DNS zone from a cloud provider could result in an error being shown indicating that the DNS zone was not found.

* An issue was fixed where Men&Mice Central could crash in certain circumstances when processing errors from a cloud provider.

* An issue was fixed where changing the name of a DHCP scope could result in an error stating that the DHCP server was not found.

* An issue was fixed where newly created IP address ranges did not have the usage calculated correctly for previous claimed IP addresses.

* An issue was fixed where it was possible to add a DNS record which had the same data as an existing dynamic DNS record.

* An issue was fixed where changes made to a failover partner DHCP scope were not synchronized properly.

* An issue was fixed where adding a slave server for a master zone did not work as expected.

* An issue was fixed where DNS controller did not properly handle a BIND configuration which included "use-v4-udp-ports" / "use-v6-udp-ports" statements.

* An issue was fixed where the installer for the DNS controller did not properly handle a BIND configuration which included "use-v4-udp-ports" / "use-v6-udp-ports" statements.

* An issue was fixed where Men&Mice Central could crash due to incorrect error handling when updating DNS zones.

* An issue was fixed where creating a DHCP scope in the Management Console could result in error when selecting AD site in the wizard.

* An issue was fixed where the installer for the Web Application erroneously removed the preferences.cfg file during an upgrade.

* An issue was fixed where one user could delete a DNS record, while another user edited the same record without a clear error message.

* An issue was fixed where updating a DNS zone could result in concurrency issues.

* An issue was fixed where the GetDNSZoneOptions API command did not return the masters IP address list for Forward DNS zones for Windows DNS servers.

* An issue was fixed where reloading a DNS zone in a view using rndc could fail due to mishandled casings of the view name.

* An issue was fixed where an exception was thrown when deleting/modifying A records on claimed addresses.

* An issue was fixed where non MAC address clientIdentifiers would be formatted as MAC addresses in the Management Console.

* An issue was fixed where empty custom properties were not being handled properly.

* An issue was fixed where duplicate cloud accounts along with duplicate data would be added under certain circumstances.

* An issue was fixed where it was not possible to open DHCP scopes which resulted in a "DNS Server not found" error message.

Appliances
^^^^^^^^^^

* BIND on the Men&Mice appliances was upgraded due to the CVE-2019-6477 vulnerability.

* BIND on the Men&Mice appliances was upgraded due to the CVE-2019-6471 vulnerability.

* BIND on the Men&Mice appliances was upgraded due to the CVE-2018-5743 vulnerability.

* ISC DHCP on the Men&Mice appliances was upgraded to 4.4.1.
