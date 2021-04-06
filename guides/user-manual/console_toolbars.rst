.. _console-toolbars:

Toolbars
--------

.. |create| image:: ../../images/console-create.png
.. |delete| image:: ../../images/console-delete.png
.. |options| image:: ../../images/console-options.png
.. |server-info| image:: ../../images/console-server-info.png
.. |server-log| image:: ../../images/console-server-log.png
.. |history| image:: ../../images/console-history.png
.. |zone-wizard| image:: ../../images/console-zone-wizard.png
.. |view-hierarchical| image:: ../../images/console-view-hierarchical.png
.. |view-flat| image:: ../../images/console-view-flat.png
.. |save| image:: ../../images/console-save.png
.. |print| image:: ../../images/console-print.png
.. |find| image:: ../../images/console-find.png
.. |analyze| image:: ../../images/console-analyze.png
.. |edit| image:: ../../images/console-edit.png
.. |claim| image:: ../../images/console-claim.png
.. |release| image:: ../../images/console-release.png
.. |next-free-ip| image:: ../../images/console-next-free-ip.png

The toolbar, which runs along the top of the *Object Section* and *Object List*, provides fast access to commonly performed operations. The function of any given button is always in the context of the currently selected object. Some buttons will not be available (i.e., greyed out) when certain objects are selected.

.. csv-table::
  :header: "Button", "Name", "Description"
  :widths: 5, 10, 85

  |create|, "**Create**", "Lets you create a zone, add a name server, a DHCP scope, or a DHCP server based on the currently selected object."
  |delete|, "**Delete**", "Lets you delete a zone, a name server, a DHCP scope, or a DHCP server; based on the currently selected object."
  |options|, "**Options**", "Display the options dialog box for the currently selected object, if applicable (e.g., Zone options, Server options, etc.)."
  |server-info|, "**Server Info**", "Displays a window that provides general information about the selected server—e.g., server type, IP Address, OS, number of zones, number of requests sent/received, etc. Refer to DNS Servers—Server Information ."
  |server-log|, "**Server Log**", "Displays the Server Log window that shows the DNS log of that server. Refer to DNS Servers—Server Log ."
  |history|, "**History**", "Opens the History window and displays a log of all changes that have been made to the selected object, including the date and time of the change, the name of the user who made it, the actions performed, and any comments entered by the user. Refer to Management Console—Object Change History ."
  |zone-wizard|, "**Zone Wizard**", "Launches the Zone Wizard, which helps you create the desired type of zone by prompting you with a series of questions. Refer to DNS Zones—Zone Migration Wizard ."
  |view-hierarchical|, "**View (Hierarchical)**", "When selected, toggles to hierarchical view for the IP Address range."
  |view-flat|, "**View (Flat)**", "When selected, toggles to flat view for the IP Address range."
  , "**Quick Filter**", "This text field lets you instantly filter out objects that you do not want to display. For example, if you type 'ex' in the field, only objects that contain 'ex' somewhere in their name are displayed in the Object List. When you clear the contents from this field, all available objects are again displayed. Refer to Quick Filter ."

Zone toolbar
^^^^^^^^^^^^

.. csv-table::
  :header: "Button", "Name", "Description"
  :widths: 5, 10, 85

  |analyze|, "**Analyze**", "Analyzes the contents of the zone. Refer to DNS Zones—Zone Analysis ."
  |history|, "**History**", "Displays the history for the selected zone. Refer to the DNS Zones—View History ."
  |zone-wizard|, "**Wizard**", "Launches the Record Creation Wizard. Refer to DNS Resource Records."
  , "**Zone Controls**", "Only available for static zones on BIND Opens the Zone Controls dialog box. Refer to the DNS Zones—Zone Controls ."
  |find|, "**Find**", "Opens the Find Zone dialog box in which you enter criterion to locate specific information for this zone. Refer to DNS Zones—Search ."
  |options|, "**Options**", "Opens the Zone Options dialog box. Refer to the DNS Zones—Zone Options ."
  |print|, "**Print**", "Prints the zone information."
  |save|, "**Save**", "Saves the information as entered in the main zone information window."

IP Address Range toolbar
^^^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
  :header: "Button", "Name", "Description"
  :widths: 5, 10, 85

  |delete|, "**Delete**", "Removes the currently selected host. Refer to IP Address Management."
  |edit|, "**Edit**", "Opens the IP Address dialog box in which you can edit details for the IP Address. Refer to IP Address Management ."
  |claim|, "**Claim**", "Use this feature to prevent accidental assignment of a reserved address without creating a DNS entry for it. [1]_"
  |release|, "**Release**", "Use this feature to release assignment of a reserved address."
  |next-free-ip|, "**Next Free Address in Range**", "Finds the first IP Address in the range that is not in use. When clicked, opens the IP Address dialog box in which you enter the IP Address info."

Scope toolbar
^^^^^^^^^^^^^

.. csv-table::
  :header: "Button", "Name", "Description"
  :widths: 5, 10, 85

  |edit|, "**Edit**", "Allow you to edit the selected host by opening the IP Address dialog box. Refer to DHCP Scopes."
  |delete|, "**Delete**", "Deletes the currently selected IP Address. Refer to DHCP Scopes."
  |claim|, "**Claim**", "Use this feature to prevent accidental assignment of a reserved address without creating a DNS entry for it. [1]_"
  |release|, "**Release**", "Use this feature to release assignment of a reserved address."


.. [1] The workflow is as follows:

  * A user with "edit data" privileges can select one or more addresses that have no associated A record(s) and choose "Claim" from the menu. Going forward, no one can create A records for the address(es) through the zone window (neither auto-assign nor manually assign).

  * A user can select one or more claimed addresses and select "Release." These addresses are then restored to their previous state.

  * A user can edit a Claimed record through the IPAM module. When the user opens a IP Address details window for a claimed address, a dialog prompts, "This address has been claimed. Are you sure you want to edit it?" Yes/No? When Save is selected in the IP Address details window, one of two things happens: (1) If the user only entered non-DNS data (custom properties, MAC address, name), the "claimed" flag says in place. (2) If the user entered one or more DNS hosts for the IP Address, the "claimed" flag is cleared.
