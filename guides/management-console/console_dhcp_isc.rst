.. meta::
   :description: Managing groups and hosts within groups on an ISC DHCP server, managing host entries that are defined in the global scope in Micetro.
   :keywords: ISC DHCP, DHCP management, DHCP Management console

.. _console-dhcp-isc:

ISC DHCP (Management Console, obsolete)
-----------------------------------------

.. |add-dhcp| image:: ../../../images/console-dhcp-add-icon.png
.. |rename-dhcp| image:: ../../../images/console-dhcp-rename-icon.png
.. |delete-dhcp| image:: ../../../images/console-dhcp-delete-icon.png
.. |options-dhcp| image:: ../../../images/console-dhcp-options-icon.png
.. |access-dhcp| image:: ../../../images/console-dhcp-access-icon.png
.. |add-reservation-dhcp| image:: ../../../images/console-dhcp-add-reservation-icon.png
.. |edit-reservation-dhcp| image:: ../../../images/console-dhcp-edit-reservation-icon.png
.. |delete-reservation-dhcp| image:: ../../../images/console-dhcp-delete-reservation-icon.png
.. |reservation-options-dhcp| image:: ../../../images/console-dhcp-reservation-options-icon.png

.. _console-dhcp-isc-groups-hosts:

Managing Groups/Hosts
^^^^^^^^^^^^^^^^^^^^^

Allows you to manage groups and hosts within groups on an ISC DHCP server. You can also manage host entries that are defined in the global scope.

To manage groups and hosts, do the following:

1. Select the ISC DHCP server for which you want to manage groups and/or hosts.

2. Right-click on the server and, from the shortcut menu, select :guilabel:`Manage Groups and Hosts`. A new menu displays in the menu bar and the *DHCP Groups* dialog box displays.

.. image:: ../../../images/console-dhcp-groups.png
  :width: 60%
  :align: center

Groups/Hosts Toolbar
""""""""""""""""""""

The toolbar that displays in the Groups for DHCP Server contains the following:

.. csv-table::
  :header: "Button", "Operation", "Function"
  :widths: 5, 15, 80

  |add-dhcp|, "Add", "Displays the Add Group dialog box. Enter the name for the new group, and click Add."
  |rename-dhcp| , "Rename", "Displays the Edit Group dialog box. Make the desired changes to the name for the selected group, and click Save."
  |delete-dhcp| , "Delete", "When selected, displays a confirmation message asking if you want to delete the selected group."
  |options-dhcp| , "Options", "When selected, displays the DHCP Group Options dialog box. Refer to :ref:`dhcp-options` for details on this dialog box."
  |access-dhcp| , "Access", "When selected, displays the Access Control dialog box. Refer to :ref:`global-access` for details on this dialog box."
  |add-reservation-dhcp| , "Add reservation", "Displays the Add Reservation dialog box. Enter the applicable information, and click OK."
  |edit-reservation-dhcp| , "Edit reservation", "Displays the Edit Reservation dialog box. Make the desired and click OK."
  |delete-reservation-dhcp| , "Delete reservation", "When selected, displays a confirmation message asking if you want to delete the selected reservation."
  |reservation-options-dhcp| , "Reservation options", "When selected, displays the Reservation Options dialog. Refer to :ref:`dhcp-options` for details on this dialog box."

Groups/Hosts Shortcut Menu
""""""""""""""""""""""""""

Edit
  Displays the Edit Host dialog box. Make the desired changes to the name for the selected group, and click :guilabel:`Save`.

Add
  Displays the Add Host dialog box. Enter the applicable information, and click :guilabel:`Add`.

Delete
  When selected, displays a confirmation message asking if you want to delete the selected host.

Options
  When selected, displays the Host Options dialog. Refer to :ref:`dhcp-options` for details on this dialog box.

Copy
  Copies information about the selected host into the clipboard.

Select All
  Selects all groups/hosts. You can then right-click and use the shortcut menu options to manage all the selected items.

.. _console-dhcp-isc-subclasses:

Editing Subclasses
^^^^^^^^^^^^^^^^^^

Allows you to edit subclasses on an ISC DHCP server.

.. note::
  You cannot manage DHCP classes – only subclasses of existing DHCP classes.

To edit subclasses, do the following:

1. Select the ISC DHCP server for which you want to edit subclasses.

2. Right-click on the server and, from the shortcut menu, select :guilabel:`Edit Subclasses`. The *DHCP class* dialog box displays.

3. Choose a class to edit and click the :guilabel:`Select` button. A new dialog box displays where you can enter the client identifiers or MAC addresses of the hosts that should belong to the selected class.

4. The dialog box contains a multi-line edit field where you can quickly add multiple entries. NOTE: When entering MAC addresses you **must** use a *colon* (,) as a separator. Each line in the dialog box should contain one entry. To delete an entry, simply remove the corresponding line in the dialog box.

5. Click :guilabel:`OK` to confirm your changes and close the dialog box.

.. _console-dhcp-isc-define-options:

Defining Options on ISC DHCP Servers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. In the Object List, right-click on the applicable DHCP Server and, from the shortcut menu, select :guilabel:`Define Options`. The *DHCP Server Option* definition dialog box displays. The dialog box shows all custom options defined on the DHCP server. The standard ISC DHCP options will reside in the Standard Vendor class. Other custom class that have been added will be available in the Vendor class drop down field.

2. To Add an option, click the :guilabel:`+` button at the end of the option list. Enter the ID, name and type of data to use for the option. The several data types can be specified as arrays and the Array checkbox is enabled when a supported data type is selected. To specify an array, click the Array checkbox.

3. To Delete an option, click the :guilabel:`-` button next to the option you want to delete.

4. To change the ID for an option, enter the new ID in the **ID** field.

.. note::
  You can only edit the ID property for existing options.

5. Click :guilabel:`OK` to save the option definition.

.. _console-isc-dhcp-properties:

ISC Server Properties
^^^^^^^^^^^^^^^^^^^^^

Authoritative
  Specifies whether the server is authoritative to determine if a DHCP request from a client is valid

DDNS Domain Name
  Specifies the DNS domain name to use to store the A record for a DHCP client.

DDNS Reverse Domain Name
  Specifies the DNS reverse domain name to use to store the PTR record for a DHCP client.

DDNS Update Style
  Specifies how the DHCP server does DNS updates. The available styles are:

  None
    Dynamic DNS updates are not performed

  Ad-hoc

    .. warning::
      This update scheme is obsolete

  Interim
    This is the recommended scheme for dynamic DNS updates

DDNS Updates
  Specifies whether to perform DNS updates. This setting has no effect unless DNS updates are enabled globally with the DDNS Update Style setting.

DDNS TTL
  Specifies (in seconds) the TTL value to use when performing a DNS update.

Default Lease Time
  Specifies (in seconds) the default lease time to use for DHCP leases.

Log Facility
  Specifies which syslog facility to use when logging DHCP server messages. All possible facilities are listed; however, not all of these facilities are available on all system.

Max/Min Lease Time
  Specifies (in seconds) the maximum/minimum lease time to use for DHCP leases.

Get Lease Hostnames
  Specifies whether the DHCP server should perform a reverse DNS lookup for each address assigned to a client and send the result to the client in the hostname option.

One Lease per Client
  Specifies whether the DHCP server should free any existing leases held by a client when the client requests a new lease.

Ping Check
  Specifies whether the DHCP server should send an ICMP echo message to probe an IP Address before offering it to a DHCP client.

Ping Timeout
  Specifies for how many seconds the DHCP server should wait for an ICMP echo response when Ping Check is active.

Filename
  Specifies the name of the initial boot file to be used by a client.

Server Name
  Specifies the name of the server from which the client should load its boot file.

Next Server
  Specifies the host address of the server from which the initial boot file (that is specified by Filename) is to be loaded.

.. _console-dhcp-isc-restart:

Restart
-------

  .. note::
    Applies to ISC DHCP servers only.

This menu item is only displayed when a user with DHCP administration privileges is logged in. This command restarts the DHCP server.
