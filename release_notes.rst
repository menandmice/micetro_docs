.. meta::
   :description: Release notes for Micetro by Men&Mice 10.1.x versions
   :keywords: Micetro, release notes, releases, update notes

.. _release-notes:

Release notes
=============

.. note::
  Major releases are supported for 2 years.

..
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

Jump to: :ref:`10.1-release`, :ref:`10.1.1-release`, :ref:`10.1.2-release`, :ref:`10.2-release`, :ref:`10.2.1-release`,

.. _10.2.1-release

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

*October 19th, 2021.*

.. important::
  Version 9.2 will no longer receive bug fixes and feature updates. Please update your Micetro to at least version 9.3.

Known issues
^^^^^^^^^^^^

..
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
