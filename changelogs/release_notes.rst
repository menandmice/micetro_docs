.. _release-notes:

Micetro by Men&Mice AT&T release notes
======================================

9.4.2
-----

**New features**
[MM-17463] - Rollback functionality for server groups has been added
[MM-17559] - Zones within same view that share a master zone file are handled more gracefully
[MM-17655] - Users can revert/undo a change request
[MM-17872] - Added requester column to un-deployed changes report
[MM-18113] - Disabled automatic adjustment of zone transfer statements
[MM-18168] - Implemented TAC updates workflow (#2)
[MM-18169] - Implemented Enterprise provisioning workflow (#3)
[MM-18205] - Added links for static stub zone management to server groups (WING/ASE)
[MM-18229] - Users can search by high-byte/low-byte in TAC sidebar
[MM-18236] - Added User management to Web Application
[MM-18241] - Added Role management to Web Application
[MM-18244] - Added Group management to Web Application
[MM-18321] - Add AT&T logo to Web Application
 [MM-18362] - Solaris is now supported as a platform in server groups

**Fixed**
[MM-18042] - Add group member now reloads the server group list
[MM-18055] - Removing members from server group now creates an entry in the server group history
[MM-18057] - Migration of DNS zones between staging servers has been temporarily disabled.
[MM-18476] - "Clear queue" button in queue task now reverts changes in Traffic Move task as expected.

**Improvements**
[MM-18045] - Performance improvement to shorten delay between deploy and sync to live
[MM-18061] - A Prepare operation now updates the object history for the members
[MM-18062] - A Deploy operation now updates the object history for the members
[MM-18259] - Submitting a request with a syntax error now displays an error dialog pinpointing the issue
[MM-18263] - Added an option to skip arranging the BIND config when installing a DNS server controller on Solaris
[MM-18293] - Improved indicator when the Workflow Queue is disabled due to policy violations
[MM-18339] - Recent zones/ranges in filter Sidebar are expanded, and open on click
[MM-18342] - Traffic move task can be initiated from within a zone

9.4.3
-----

**Improvements**
[MM-18096] - the Deploy operation will now check for sufficient disk space before unzipping config
[MM-18233] - "Back to list" no longer resets sidebar filter
[MM-18317] - when adding new records, the Web Application now shows an empty line in the grid where the new record will be inserted
[MM-18333] - undeployed changes report are now grouped by zone
[MM-18446] - Display view name with the zone in the workflow queue
[MM-18497] - selection in a zone is now switching to the newly created DNS record
[MM-18516] - the Quick Command now shows the view and authority for zones if there are multiple with identical names
[MM-18521] - grid displays more space for NAPTR flags
[MM-18557] - Allocation Wizard no longer copies read-only custom properties
[MM-18563] - database connection check has been improved

**New features**
[MM-14735] - Bulk Import task for DNS records
[MM-17528] - deployment rollback
[MM-17581] - available deployable configs are counted per server group, and can be customized based on number or age of backups to keep
[MM-17614] - SOA serial is updated and dependant zones are reloaded when include zone is updated
[MM-17656] - failed changes in change request queue are reverted immediately
[MM-17850] - system will re-chain zones, instead of re-initializing the entire zone, if previd line number chain is broken
[MM-17864] - external record order changes appropriately sync to the Men&Mice Suite’s database
[MM-18007] - requests that affect multiple server groups need to be specified to affect only one
[MM-18346] - DNS zones can now be easily assigned role-based RO/RW access
[MM-18537] - new functionality to copy and paste DNS records into a zone
[MM-18566] - Customized documentation sidebar to avoid confusion due to customizations

**Fixed**
[MM-16793] - Web Application installer on Linux will no longer overwrite Apache configuration file (mmweb.conf)
[MM-17859] - less frequent occurrence of "Network connection was lost" errors on the server group overview page
[MM-17897] - CAA record flag "0" is no longer ignored
[MM-18031] - removed undefined error message, when needed appropriate error message will be displayed
[MM-18302] - server group members can be filtered by name or server state
[MM-18315] - fixed badly formed change request API call in the UI
[MM-18328] - viewing changes from the non-default address space will no longer display empty contents if there are record changes
[MM-18389] - access reports can be once again created
[MM-18392] - the context grid is now automatically reloaded after detaching/attaching a server
[MM-18398] - Option ID 120 value is no longer deleted when editing
[MM-18399] - improved html handling in highlighter
[MM-18406] - NAPTR type dropdown no longer offers an empty option.
[MM-18407] - when a group is deleted, related users and roles are now properly updated
[MM-18419] - startup checks for DNS record policies have been improved to cause less impact on performance
[MM-18423] - creating a record set now properly saves multiple comments
[MM-18424] - SOA record for zones can be properly edited in server groups
[MM-18426] - users who lack sufficient permissions will no longer be offered to create users, groups, or roles
[MM-18445] - deleting a Server Group will also remove its working directory
[MM-18447] - cloning record sets below the placement will now properly show the change below the source record set
[MM-18452] - editing DNS record changes in the change request queue now works as intended
[MM-18461] - rolling back a deployment now deletes the correct comments in the zone
[MM-18465] - DNS records for which changes are in the queue now correctly show the changes
[MM-18482] - editing advanced zone options no longer creates history event with empty description
[MM-18487] - opening a Traffic move task within a zone will now use a properly working zone selector
[MM-18489] - failed zone deletions no longer leave orphaned (.bak) files behind
[MM-18490] - fixed scaling of Workflow icon
[MM-18491] - failed change requests are not automatically reverted and removed from the queue
[MM-18499] - only editing the flag field now can be saved as it should
[MM-18506] - removing a change in the queue will no longer collapse the entire group
[MM-18508] - modifying records will no longer remove them from filtered view
[MM-18509] - adding records with no record initially selected will now use correct record order
[MM-18511] - when switching between search and filter views, SOA and TTL records are now properly filtered out
[MM-18513] - users can now proceed after fixing policy validation errors in the queue
[MM-18518] - assertion no longer fails in server groups when viewing undeployed changes
[MM-18519] - dropdowns will now scroll to display the selected items on open
[MM-18538] - editing records in the change queue properly updates the changes without having to close the queue
[MM-18542] - reports can now be created for objects with a space in their name
[MM-18545] - record order is now properly maintained after changes are made under different but identical comment records
[MM-18548] - record set filters now properly update with new records
[MM-18552] - if requests are reverted but reference records that are removed by another request, the UI will now display the appropriate error message
[MM-18555] - record order changes are now properly synced
[MM-18558] - records can be inserted after records that are queued for modifications in the request queue
[MM-18582] - reverted requests are once again properly shown in queue and undeployed changes reports

9.4.4
-----

**Fixed**
[MM-17368] - Various filtering highlighter fixes and improvements
[MM-18177] -  A syntax error is sometimes reported when creating comment records
[MM-18486] - When another user deletes a record in the request queue unexpected errors are shown
[MM-18514] - Validate errors for revert are not always attached to records
[MM-18596] - Its possible to prepare and deploy when all server group members are detached
[MM-18629] - Records added under subsequent identical comments are not always inserted at correct position
[MM-18630] - Success toaster is displayed even though creating a stub zone failed
[MM-18653] - Inserting record placeholder shows up in an incorrect place when adding a record at the bottom of a zone
[MM-18659] - Group name is not editable for a single selected group (user management)
[MM-18663] - If record order changes in master file externally, the record order is not updated in M&M
[MM-18684] - A performance issue was fixed when the request queue includes a very large number of DNS Record changes
[MM-18691] - The "Clone record set" task does not validate record name
[MM-18693] - "Show all" option in grid footer doesn't clear selected record set
[MM-18730] - User is offered to choose non-applicable server groups in submit dialog
[MM-18799] - DNS record not found error is shown after reverting a MOP
[MM-18810] - When adding new NAPTR records to a DNS zone, it is appending an additional APN group below
[MM-18811] - Users are unable to see Server Group Member Servers when user is not in DNS Administrators role
[MM-18816] - Non-existing zone with changes in request queue prevents login.
[MM-18834] - Central crashes at AT&T due to DNS record policy issues
[MM-18893] - A user in DNS administrator role is unable to prepare a server group
[MM-18938] - The UI is not blocked in traffic move while adding a large number of changes to queue
[MM-18940] - When submitting a request for two server groups the queue is emptied after submitting the first group
[MM-18941] - Increase Men&Mice Web Service (MMWS) proxy timeout in apache settings at AT&T and document
[MM-18944] - File information is not shown in inspector after opening a DNS zone and going back
[MM-18946] - Labels in left sidebar are sometimes cut off too much
[MM-18951] - Record group is written to masterfile as multiple groups if it contains empty lines
[MM-18969] - Fully qualified records in include files are ignored

**Improvements**
[MM-17450] - Implement bulk deleting of zones
[MM-17819] - Make sure that a check with named-checkconf gives correct results
[MM-18664] - Minor server group management fixes
[MM-18679] - Improve error message when doing a roll-back with Out of sync members
[MM-18809] - AT&T wants to grant access to edit config files for non-DNS admins
[MM-18849] - DNS record policies should not be checked on disabled records
[MM-18767] - Change name for import (DNS records) to bulk modify

**New features**
[MM-18603] - AT&T Zone management with change requests
[MM-18705] - Advanced Server Options management with change requests
[MM-17674] - Convert AT&T regexes into DNS record policies
[MM-18357] - Update tool tips and context sensitive help for AT&T
[MM-18597] - Research and Document how to get a server group in sync when there are out of band changes
[MM-18742] - As an admin I can create zones in multiple views at the same time
[MM-18768] - Be able to export contents of un-deployed changes report
[MM-18784] - Add number un-deployed requests per server group to server groups page

9.4.5
-----

**Bug**
* [MM-18594] - Errors during DNS record import are not associated to lines
* [MM-18808] - Users that are not in DNS Admins role can see, prepare and deploy server groups but can not see their members
* [MM-18837] - Many error messages above server group member grid hide the grid contents
* [MM-18866] - Off by one for syntax error's line number in zone file
* [MM-18902] - Inconsistencies related to undeployed changes in server group member inspector
* [MM-18904] - “Open zone after creating” should be unchecked & disabled when creating static-stub/forward zones
* [MM-18909] - User is not prompted with “Unsaved changes” dialog when closing dirty "Edit configuration"
* [MM-18933] - Edit records is disabled in meatball and "Actions" when multiple records are selected
* [MM-18955] - Unable to view undeployed or deployed changes report if it contains a zone or a view that has been deleted
* [MM-18971] - Undeployed changes report is fully qualifying data in include files
* [MM-18972] - Change requests dealing with include files should not append the name of the include file to unqualified data
* [MM-18975] - Policy errors for "large" policies overflow the tooltip
* [MM-18976] - “Before” values missing for modified records in undeployed changes report export
* [MM-18977] - Remove placeholder/watermark for comment field when editing comment records
* [MM-18981] - Rollback error message unintelligible and ungrammatical
* [MM-18997] - Unable to view the history for a static stub zone in the web UI
* [MM-19001] - Strange grammar in confirmation message when reverting
* [MM-19024] - Enabled records are grayed out while disabled records are displayed normally in the traffic move task
* [MM-19155] - Rollback out of date members results in an error.
* [MM-19188] - DNS Server Controller is not writing into the staging directory in the AT&T lab
* [MM-19298] - Server Group rollback doesn't change state of requests back to "Staged"
* [MM-19389] - Unable to install DNS Server Controller for BIND unless named is installed under /usr/sbin/named
* [MM-19460] - Incorrect error message when pasting FQDN
* [MM-19462] - Records not removed from all zones that share a zone file
* [MM-19475] - Newly created records not immediately caught by the record set filter

**Improvement**
* [MM-18535] - Make the Preference field in NAPTR records a required field
* [MM-18715] - Column configurations for TTL and Comment fields in DNS zone page is not being persisted
* [MM-18800] - Open request in task bar does not work for Configuration requests
* [MM-18929] - Group zone changes in undeployed changes report by zone name
* [MM-18934] - Leading white space in NAPTR record field invalidates the field
* [MM-18948] - Disable create record task for AT&T unless user has selected a row to indicate placement
* [MM-19193] - Enable xhr/dynamic content compression in Apache for AT&T
* [MM-19194] - Disable edit change request properties for AT&T
* [MM-19236] - Users with access_options for DNS server/zone should be able to view configuration files
* [MM-19306] - When pasting records, understand group notation of records
* [MM-19307] - Enable edit change request properties task for AT&T for admins as well as the requester
* [MM-19477] - Minor UI improvements in Submit request dialog (queue)
* [MM-19585] - Enable Add DNS Record task when nothing is selected in AT&T
* [MM-19592] - Disable all sort by column in DNS Records grid for AT&T
* [MM-19600] - Update record sets when adding/removing records

**Story**
* [MM-19007] - Use Edit Options access in blackstar for Config File change tasks
* [MM-19018] - Return a more parsable error message when record violates a policy
* [MM-19531] - Implement zone evacuation workflow for AT&T
* [MM-19626] - List steps needed to for AT&T to verify that its environment is correctly setup
