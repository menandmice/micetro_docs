.. meta::
   :description: Release notes for Micetro by Men&Mice 10.1.x versions
   :keywords: Micetro, release notes, releases, update notes

.. _release-notes:

Release notes
=============

.. note::
  All upcoming major releases are supported for 2 years.

Jump to: :ref:`10.1-release`

.. _10.1-release:

10.1
----

*October 12th, 2021.*

.. important::
  Version 9.2 will no longer receive bug fixes and feature updates. Please update your Micetro to at least version 9.3.

New features
^^^^^^^^^^^^

* MM-20417/MM-20271	New Access Control management: access controls in Micetro have been redesigned from the ground-up, and provide a fully role-based, flexible management. Existing configurations will be converted into the new model while preserving backward compatibility. Read :ref:`access-control` and :ref:`access-control-example` for details.

* MM-20257	Folder management is now available in the Web Application. Users can organize DNS and IPAM objects using traditional folders and customizable smart folders (saved filters) to quicken their workflows. "Smart people use folders. Even smarter people use smart folders."

* MM-20125	AD Sites and Subnets management has been streamlined and integrated into the IPAM context of the Web Application.

* MM-19048	Administrators can manage license keys in the Web Application, and view system utilization.

Improvements
^^^^^^^^^^^^

* MM-20068	DNS administrators can manage preferred servers for DNS zones in the Web Application.

* MM-19102	SNMP profile management is available in the Web Application.

* MM-20785	A new slide-in help is available for many functions, offering further details on functionality and syntax for their respective operations. Not a water slide in a theme park, but it is still weirdly satisfying.

* MM-19898	Micetro components will no longer display errors if they're reporting different minor versions. We're all one family here.

* MM-18391	Users can import DHCP reservations to Micetro using the Web Application, including bulk import. Get yer CSV goodness on!

* MM-15334	Lease names are searchable in the Quick Command. So you can have a better leash on them. (We'll see ourselves out.)

* MM-20487	Custom links can be added to the Micetro login screen.

* MM-20196	Improved subnet management, including splitting and merging subnets. Alchemy, almost; although no turning iron into gold with Micetro. Yet.


Bug fixes
^^^^^^^^^

* MM-19813	Wildcard policies on AWS will display a descriptive error message (as they're not currently supported in Micetro).

* MM-20312	Users can use relative time (i.e. >=-7d) in the Reporting module. Because time is relative, and E equals m times c squared. Except in quantum, but let's not sweat the small stuff.

* MM-16879	BIND installer will no longer get stuck during installation. Sticks and stones may break our bones, but stuck things are just weird.

*

* MM-21082	Creating new reports will not crash the Web Application.

* MM-21077	DNS and IPAM data is properly updated when changing address spaces. Multiverse mixup, we've had words with the Sorcerer Supreme.

* MM-21075	Using the Quick Filter properly highlights the query in the name column. As this is how it's supposed to work, this fix is a highlight to share.

* MM-21053	Address spaces will no longer be created partially in the Web Application. Mystical wholeness restored.

* MM-21052	Using the 'View scopes' action on a DHCP server will properly show the scopes on the DHCP server. Because it. Has. One. Job.

* MM-21050	The grid is properly reloaded after removing an AD Forest.

* MM-21046	Creating a reservation in the Management Console will successfully close and refresh the IP data.

* MM-21041	Users are once again able to edit and view Microsoft DHCP server options in the Management Console.

* MM-21036	Creating a scope on a Cisco DHCP server again works as expected.

* MM-21033	No longer possible for the logged-in user to remove themselves. Word came down that it created a bunch of variants that bottlenecked the TVA, and who needs that?

* MM-21021	Updating refresh times on SOA records will no longer fail with a cryptic error.

* MM-21018	Tooltips no longer appear erroneously on top of the screen after closing their window. They understand now that they have to respect the boundaries of others, just like all polite UI elements do.

* MM-21002	Editing a DHCP pool will no longer result in a locked up dialog window due to illegal from/to address input.

* MM-21001	Converting a network to a DHCP scope will no longer have a missing field. It's returned safe and sound, we can take it off the milk cartons finally.

* MM-20958	Using the 'View history' action will no longer return an error message.

* MM-20956	Existing SNMP profiles are properly detected in the Web Application.

* MM-20947	Adding license keys in the Web Application will properly disable the First Run Wizard in the Management Console. A wizard is never late, but it also shouldn't just show up willy-nilly either.

* MM-20910	The 'Reserve' button will no longer disappear from the Action menu. This type of hide-and-seek is not appropriate in the workplace.

* MM-20888	Streamlined the Men&Mice Central binary to reduce size. Took a lot of pilates, but now it's in much better shape.

* MM-20733	The 'Import records' task is no longer available in Quick Command. We don't know why it was there in the first place. It's not like we put it there. <whistles innocently>

* MM-20725	Login no longer fails if no DNS license key is activated. Some like IPAM with no pulp, and we don't judge.

* MM-20607	Users can use the 'subType' field as a query paramaters within data from cloud providers. Suber!

* MM-20593	Adding a cloud provider to Micetro properly runs synchronization for DNS data.

* MM-20551	Router scanning will no longer crash Men&Mice Central. Scan away at will. Or when you need to.

* MM-20511	Men&Mice Web Services will no longer report unhandled exceptions on a Windows Server. While Micetro is exceptional, we're plenty able to handle it.

* MM-20481	The 'Edit reservation' button once again works as expected. Good button, have a cookie.

* MM-20372	Resizing the Inspector panel will no longer cause sections to lock up. No DataTables left behind.

* MM-20287	You can use 'Add to favorites' on IPAM objects as well. We don't like to play favorites, so we're giving favorites to all.

* MM-20194	Removing a cloud account will properly remove all related data from Micetro. Having your ex's stuff around is never a good idea.

* MM-20168	Men&Mice Central will no longer run out of memory when scanning a large number of SNMP profiles. To paraphrase Lady Liberty: give Micetro your huddled SNMP masses yearning to breathe free.

* MM-20013	Pool indicators are refreshed when editing exclusions for a scope.

* MM-20007	Deleting TXT records containing & in the data field no longer fails in AWS. & all rejoiced & the world was at peace again.

* MM-19932	Using the Quick Filter for Networks will no longer cause loading skeletons to appear.

* MM-19797	Exceeding the retry limit in Azure will properly throw an exception.

* MM-19582	Fixed an issue where DNS administrators would not have access to a DNS record's history. Obviously they should. And now they do.

* MM-19444	The 'Edit configuration' task is no longer enabled for unreachable servers.

* MM-17345	The 'Add DNS Zone' task from Quick Command properly fills out the name for the zone. Otherwise it's not magic, now is it?

* MM-16638	Clicking 'Save' on dialogs with no changes made closes the dialog. Clicking save on dialogs that have been modified validates the input.

Other
^^^^^

* Various performance improvements and UX tweaks. Micetro does things faster and nicer.
