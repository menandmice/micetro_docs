.. _dhcp-windows:

Microsoft DHCP
==============

.. _console-dhcp-windows-remote-access:

Server Access on Remote Computers (Microsoft DHCP)
--------------------------------------------------

To configure the DHCP Server Controller to access DHCP servers on remote computers, do the following:

1. Before you can administer DHCP servers, verify that the DHCP Controller is running as a Windows User and has the necessary privileges.

2. To enable DHCP Management in Micetro, start the Windows Services program and open the properties dialog box for Men&Mice DHCP Server Controller.

3. Click the :guilabel:`Log On` tab. The :guilabel:`Local System account` radio button is most likely selected.

4. Click the :guilabel:`This account` radio button and enter the name and password of a Windows User that is a member of either the Administrators role or the DHCP Administrators role.

5. Close the dialog box and restart the Men&Mice DHCP Server Controller service.

.. warning::
  Lease history gathering is not possible if you are managing MS DHCP servers on remote computers using the DHCP Server Controller. To gather lease history for a MS DHCP server, you must install the DHCP Server Controller on the server and use the *Microsoft with Agent Installed* connection method when connecting to the server.

.. _console-ms-dhcp-properties:

MS Server Properties
--------------------

1. Complete the :guilabel:`General` tab using the guidelines below.

Conflict detection attempts
  Specifies the number of conflict detection attempts you want the DHCP server to make before it leases an address to a client.

Audit log file path
  Specifies the location of the DHCP server audit log files.

Database path
  Specifies the location of the DHCP server database.

Backup path
  Specifies the location for the database backup.

2. Click the :guilabel:`DNS` tab, and complete the fields according to the guidelines below:

Enable DNS dynamic updates according to the settings below.
  Specifies whether the DHCP server sends DNS dynamic record updates to the DNS server. Updates are sent to DNS servers configured in TCP/IP client properties for any active network connections at the DHCP server.

Dynamically update DNS A and PTR records.
  Specifies that the DHCP server update forward and reverse lookups are based on the type of request made by the client during the lease process.

Always dynamically update DNS A and PTR records.
  Specifies that the DHCP server update forward and reverse DNS lookups when a client acquires a lease, regardless of the type of request used to acquire it.

Discard A and PTR records when lease is deleted.
  Specifies whether the DHCP server discards forward DNS lookups for clients when a lease expires.

Dynamically update DNS A and PTR records for DHCP clients.
  Specifies whether the DHCP server sends dynamic updates to the DNS server for DHCP clients that do not support performing these updates. If selected, clients running earlier versions of Windows are updated by the DHCP server for both their host (A) and pointer (PTR) resource records.

3. When all selections/entries are made, click :guilabel:`OK`.

.. _console-dhcp-windows-define-options:

Defining Options on MS DHCP Servers
-----------------------------------

1. In the *Object List*, right-click on the applicable DHCP Server and, from the shortcut menu, select :guilabel:`Define Options`. The *DHCP Server Option definition* dialog box displays. The dialog box shows all options defined on the DHCP server.

2. Use the **Vendor class** drop-down list to select the vendor class for which you want to define options.

.. image:: ../../images/console-dhcp-server-options-microsoft.png
  :width: 40%
  :align: center

3. To add an option, click the :guilabel:`+` button at the end of the option list. Enter the ID, name and type of data to use for the option. The IP Address and Integer data types can be specified as arrays. To specify an array, click the :guilabel:`Array` checkbox.

4. To delete an option, click the :guilabel:`-` button next to the option you want to delete.

5. Click :guilabel:`OK` to save the option definition.

.. note::
  You can only add or delete option definitions. You cannot change the properties of an existing option definition.

Reconcile Scopes
----------------

.. note::
  Applies to MS DHCP Servers only.

Use this function to fix inconsistencies between information in the registry and the DHCP database.

1. In the Object List, select DHCP Servers and then select an MS DHCP server.

2. Right-click the server, and select :guilabel:`Reconcile Scopes`.

3. Choose the action to perform: **Verify** (only) or **Fix** (any inconsistencies).

4. Click :guilabel:`OK` to complete the action.
