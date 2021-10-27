.. meta::
   :description: Release notes for Micetro by Men&Mice 10.1.x versions
   :keywords: Micetro, release notes, releases, update notes

.. _release-notes:

Release notes 👣
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

Jump to: :ref:`10.1-release`, :ref:`10.1.1-release`

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

* 👣👣👣 Using the Quick Filter for Networks will no longer cause loading **skeletons** 💀 to appear.

* Exceeding the retry limit in Azure will properly throw an exception.

* Fixed an issue where DNS administrators would not have access to a DNS record's history. Obviously they should. And now they do.

* The 'Edit configuration' task is no longer enabled for unreachable servers.

* The 'Add DNS Zone' task from Quick Command properly fills out the name for the zone. Otherwise it's not magic, now is it?

* Clicking 'Save' on dialogs with no changes made closes the dialog. Clicking save on dialogs that have been modified validates the input. Save the cheerleader, save the world.

Other
^^^^^

* Various performance improvements and UX tweaks. Micetro does things faster and nicer.
