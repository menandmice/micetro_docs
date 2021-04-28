.. _release-notes:

Release notes
=============

.. note::
  All upcoming major releases are supported for 2 years.

Jump to: :ref:`10.0-release`

.. _10.0-release:

10.0
----

*April 20th 2021*

.. important::
  **End-of-Life Announcement**

  * Kea versions before 1.6 are no longer supported. Users must update their Kea servers *before* updating to Micetro 10.0.

  * Microsoft DNS and DHCP servers version 2008 R2 are no longer supported.

  * Solaris is no longer supported.

  See :ref:`system-requirements` for supported platforms.

New features
^^^^^^^^^^^^

* The Men&Mice Suite is now called \*drumroll please* **Micetro by Men&Mice**. Cue the (sheet) music.

* We talked about this many times, but at the risk of parroting (<snicker>) ourselves: ISC Kea 1.6 and 1.8 is now a fully supported DHCP server. Enjoy modern, high availability DHCP!

* We’ve felt guilty for enjoying the famous Icelandic pools with just ourselves. So now you can get a piece of that action and manage DHCP pools in the Web Application.

* You can now manage DNS and DHCP servers, and Men&Mice Virtual Appliances in the Web Application.

* Are you one of those people who likes to update? We’re too! Micetro works with MS SQL Server 2019 now, the latest and greatest, so have at it.

* If you’re not a fan of MS SQL or SQLite, worry not: Men&Mice Central can now be configured to use PostgreSQL as its database backend.

* G-(Wo)Man? Enjoy managing your services in Azure Government cloud through Micetro and be Free(man).

* Logging in to the Web Application before adding license keys in the Management Console sometimes created awkward situations, so now you can add your license keys in the Web Application without slowing your roll.

* You can now promote secondary zones to primary zones in the Web Application.

* Windows DNS users can now manage all their zone transfer and notify settings in the Web Application.

* We heard you liked DNS records, so we’ve put support for new record types in the Web Application: WKS, RP, AFSDB, LOC, SSHFP, SPF, DNSKEY (read only), NSEC (read only), NSEC3 (read only), NSEC3PARAM, RRSIG (read only), DS, DLV (read only).

* You can now manage users, groups and roles in the Web Application. Group hug!

* Static-stub zones are now supported in the Web Application

* Some of y’all wanted search instead of filtering, so now you can switch the Quickfilter to a Quicksearch and back again. The Quickfilter will only show the matching records in the grid, while Quicksearch will highlight them but still display all other objects as well.

* You can import DNS records into a zone with an “Import” task in the Web Application’s DNS context. No muss, no fuss.

Improvements
^^^^^^^^^^^^

* The Web Application now conforms to the WCAG Accessibility standard.

* The "Related DHCP data" section in sidebar for IP addresses now includes a list of leases that are attached to the IP address. Like a Thanksgiving guest list, but make it DDI.

* You can select a DHCP server and view all the DHCP scopes without rummaging around in the UI.

* When you’re creating a new DNS zone, record, or network or DHCP scope, Micetro will use the selected item in the left sidebar as the default value.

* An ellipsis menu has been added to list rows that provides action shortcuts for its respective object to make you (even more of) a DDI ninja.

* When you’re logged in through a domain, you can no longer change your password. No cheating you sly foxes you.

* The network list is now automatically updated after a ping is done.

* The allocation wizard for IP address ranges in the Management Console and the old web interface no longer copies read-only custom properties.

* The “preference” field in NAPTR DNS records is now a required field.

* The SNMP discovery has been improved, so virtual switches can be better identified uniquely.

* You can filter by the ‘Type’ column when editing zone authority.

* You can now find ‘Actions’ conveniently on the top, instead of in the Inspector.

* Indicators for server states have been improved. They were a tad bit confusing, which made you confused which made us sad. Now we can all be happy.

* Filtering a range that contains the IP address will no longer match the root range.

* Micetro now properly updates the ‘Last seen’ column if an IP address responds to an ad-hoc ping.

* Akamai Fast DNS server support has been added to the Web Application.

* Improved AWS multi-account discovery performance and security.

* Detach/Attach used to be called Disable/Enable, which wasn’t really accurate since they did not disable/enable but detach/attach stuff. So now they’re called Detach/Attach. Nomen est omen.

* Validating the values specified for custom property drop-down fields is now case insensitive. We’re not casists.

* Quick Command now displays authority/view if it finds multiple copies of a zone to make it, well, quicker.

* The ‘Recent DNS zones’ and ‘Recent ranges’ in the filtering sidebar are now expanded by default. You can also select them to open the zone/range.

* When you press the reload button inside a zone, Micetro does a DNS synchronization with the DNS server so you get crispy fresh data.

Bugfixes
^^^^^^^^

* Ping discovery will update IP addresses in all IP address spaces, not just the default.

* The Apache web server will no longer try to log to the wrong directory and fail to start after installing the Web Application before Apache is started.

* CAA records with additional double quotes are handled correctly on NS1.

* TXT records with 255 characters or more are handled correctly on NS1.

* An issue was fixed where caching for basic and negotiate did not work as expected in mmWS.

* Akamai DNS zones in Micetro are no longer being accidentally removed during a DNS synchronization.

* An issue was fixed where VPCs were not being discovered due to an authorization issue.

* TXT records to AWS Route 53 containing an ampersand should not be converted into "&amp."

* Initial DNS syncs to Azure DNS pull data without removing DNS zones from Micetro and adding them back again.

* The GetIPAMRecords API command for an array of IP addresses no longer forgets to return DHCP related data.

* The password check for the admin account in the Azure Marketplace allows special characters.

* An issue was fixed in the Azure marketplace configuration for a database where an incorrect error string was being shown for in invalid Azure SQL database username.

* Men&Mice Central no longer tries to update the old web service when it updating mmws.

* When selecting multiple DNS zones and editing SOA in the Web Application’s Inspector works as expected.

* Quick Command in the Web Application will prompt for login when the session is expired.

* Migrating a DNS zone from cloud providers no longer results in “DNS Server not found” errors when the server is found.

* Synced the UI and API terminology for DNS/DHCP server states.

* Fixed the dialog windows when creating xDNS Redundancy groups with syntax correct zones in one platform but not in the other, erraneously suggesting you could cancel/undo.

* The DHCP Server Controller will handle if/else statements properly in the dhcpd.conf for ISC DHCP.

* The login window after a session timeout will no longer have all the buttons disabled.

* Men&Mice Central will no longer display Microsoft DHCP scopes with two address pools.

* Adding a cloud network will no longer report a database error.

* An issue was fixed where the GetAvailableAddressBlocks API command for IPv6 was failing because of wrong default subnet mask.

* An issue was fixed in the "SetProperties" API command where an empty "addresses" field was not allowed.

* Tasks will no longer prompt for a save comment when no changes have been made.

* The Web Application now allows all file types to be selected when importing data.

* You can no longer create DNS zones on servers you don’t have access to. Also, Micetro will no longer blank on populating the ‘master server’ value on servers that don’t support it.

* Utilization and free IP addresses will show up as expected when DHCP scopes were synced in from a MS DHCP server.

* An issue was fixed in the web application where creating a DHCP reservation could result in an error indicating that the client identifier was not valid.

* Deleting and re-adding DHCP pools no longer create ghost pools that’d prevent adding identical pools.

* DNS synchronization will no longer try to sync removed DNS servers and end up aborting the sync process.

* An issue was fixed where managing a Cisco DHCP server could result in an “unhandled exception” and unknown prompt messages.

* Login timeouts for communications with DHCP servers are properly handled again.

* Large Dyn DNS zones no longer claim that the SOA record isn’t present.

* DHCP Option ID 120 value can no longer be deleted when editing a different option value.

* Authentication through SSO no longer takes an overly long time.

* Fixed REST Basic Authentication with passwords containing a colon.

* Adding new DNS records to AWS is now case insensitive and will no longer fail when the same but case insensitive resource record set with the same name already exists in AWS Route 53 and other cloud providers.

* Restarting a DHCP Server Controller is no longer necessary after losing connection to a Cisco DHCP server.

* Report creation will no longer fail just because of missing required fields.

* Editing ISC DHCP options for reservations with more than one address will no longer fail with an internal error.

* When users set the checkbox "Show inherited options" in DHCP options, Micetro will remember the setting properly.

* Installing the Web Application no longer fails because it wouldn’t overwrite some files.

* Regex fields in reports are validated properly, and editing a filter criteria will no longer crash the Web Application.

* An issue was fixed where old partial filters could be applied in the case of a very slow performing system.

* It’s no longer possible to scroll a list heading out of view.

* Disabling a DHCP scope on Cisco DHCP servers aren’t supported by the DHCP server, and the Web Application no longer shows actions for it.

* Creating A records through workflows will now properly link the A record to its IP address.

* Editing reservations in the Web Application will always preserve the client identifiers.

* Editing DHCP reservations will work regardless where it’s started from, as intended.

* Micetro will no longer have DHCP scopes in the database if no DHCP servers are configured.

* Previewing a report will no longer cause the dialog window to be stuck and prevent users from downloading the report.

* Opening a DNS record with read-only access will no longer result in access error.

* Creating a DNS record will no longer report an access error if the Networks module isn’t activated.

* Users can again add A records to AD zones.

* Users can no longer create DNS entries on an AD integrated zone if the record already exists in a dynamic zone.

* The 'Create a DHCP scope' checkbox is no longer enabled if no DHCP servers are available.

* The "Create" button in the toolbar is no longer disabled if nothing is selected for a non-admin user.

* An issue was fixed where adding a DHCP scope on a Cisco DHCP server could result in an error indicating that a pool already exists on server.

* Lease MAC addresses are again properly formatted.

* Disabled buttons are no longer clickable.

* The default value for "Maximum number of days to keep results" in report scheduling is no longer empty and will not revert to empty on its own.

* The Web Application Installer script will no longer assume certain XML elements in the IIS configuration.

* Operators in reporting filters (such as startsWith, endsWith, and contains) no longer  behave differently between database types and field types.

* The IN operator in reporting filters now can contain more than one item when used with reference and datetime column types.

* The width of a column can no longer be less than the header label.

* The Web Application installer on Linux will no longer overwrite the mmweb.conf file.

* CAA record flag "0" will no longer get ignored.

* Users can once again create and run “Access” reports.

* Disabling DNS records in dynamic zones is not supported, and the Web Application won’t show the action.

* Reports will no longer fail because the object type contains a space.

* Users can run a DNS record report both directly or by saving it.

* Using the quickfilter will highlight all matched strings.

* Shorthand notations are no longer misinterpreted in the TTL column of DNS Records reports.

* DNS zone authority information in the Inspector is automatically updated when zone instances are deleted.

* IP Insights for subnets will again display properly at all times.

* The ‘Delete’ task will no longer assume that DHCP reservations have a specific name.

* Fixed DHCP options dialog.

* ISC DHCP scopes can be enabled/disabled in the Web Application properly.

* Users can properly download reports after clicking "Run."

* Detailed errors will display while migrating DNS zones.

* DDNS values are no longer missing for DHPC reservations.

* Address pool inputs are visible even when disabled on Cisco servers.

* The “Create report” link opens the Generate Report task.

* Escaping an expired session instead of logging back in will no longer create an error.

* Clearing an IP address will properly reload the grid as expected.

* Adding changes to the Edit Zone task window will automatically enable the ‘Next’ button without having to manually exit the field first.

* The “Find next free” and "Clear" actions for IP addresses no longer require the user to have access to  the DNS module.

* Micetro will no longer show stale address pool information after converting a scope into a range.

* An issue was fixed where pool validation could fail when converting an IP address range to a scope.

* Long client identifiers will no longer cause the ellipsis menu button in the inspector to go out of view.

* Users will get a “Preview is unavailable” message instead of a vague error message.

* The “Create DHCP network” wizard will now properly validate data.

* Scrollbars no longer appear in error dialogs, and text is wrapped.

* Errors while creating a DNS zone will no longer display two error dialogs.

* Report filtering criteria that only allowed true/false values now also supports yes/no.

* Creating a CAA DNS record with the flag field on the default value will no longer cause an invalid field error.

* Creating a network without having write permissions is properly denied and no longer creates a save comment loop.

* Fixed encoding for Lease client identifiers.

* The Migrate button in the “Migrate DNS zone” task is only enabled when the destination field is filled in.

* Users can again properly edit reservations with the ClientIdentifier reservation method on Cisco servers.

* The Web Application no longer shows the "Comment" field for DNS records on Akamai Fast DNS.

* Improved the built-in API documentation.

* Various stability improvements for Men&Mice Central.

Virtual Appliances
^^^^^^^^^^^^^^^^^^

* The authoritative DNS software (BIND) on the Men&Mice Virtual Appliances was patched for the following vulnerabilities: CVE-2020-8616, CVE-2020-8617, CVE-2020-8619, CVE-2020-8622, CVE-2020-8623 and CVE-2020-8624

* The caching DNS software (Unbound) on the Men&Mice Virtual Appliances was patched for the following vulnerabilities: CVE-2020-12662 and CVE-2020-12663.
