.. _dhcp-servers:

DHCP servers
============

Overview
--------

This section shows you how to perform specific actions in the Men & Mice Management Console associated with maintaining your DHCP servers, such as adding and deleting servers and setting DHCP server options. In order to use the DHCP functionality of the Men & Mice Suite you need to have a valid DHCP license key.

.. information::
  The functions for this menu option are listed alphabetically after the New DHCP Server section.

New DHCP Server
---------------

When adding a DHCP server, the system automatically changes existing IP Address ranges to scopes if it finds IP Address ranges that contain the same start and end address as a scope on the DHCP server being added.

You must be logged in as a user with privileges to administer DHCP in order to add a DHCP server.

.. information::
  For information on adding a DHCP server on a Men & Mice Appliance, refer to Appliance Management.

1. From the menu bar, select File, New, DHCP Server. The Add DHCP Server dialog box is shown.

..

Server Name.
  Type either the DNS name or the IP Address of the DHCP server.

Server address (optional).
  If desired, type the IPv4 or IPv6 address for the server. This is not required, but doing so allows the Management Console to connect to the server by IP Address instead of by name.

Server Type.
  Click the drop-down list, and select the desired server type.

Microsoft with Agent Installed
  connects to a Microsoft DHCP server that has a DHCP Server Controller installed. If you want to gather the lease history from the DHCP server, you must use this connection method.

Microsoft Agent-Free
  connects to a Microsoft DHCP server that does not have a DHCP Server Controller installed. When using this connection method, it is not possible to gather the lease history from the DHCP server. For further information regarding this connection method, refer to DHCP Servers--Server Access on Remote Computers.

ISC
  connects to an ISC DHCP server.

Cisco
  connects to a Cisco Router that is running DHCP server software. For more information, see Adding a Cisco DHCP server.

Kea
  connect to a ISC Kea DHCP server.

Use proxy server.
  If you are adding a Microsoft or a Cisco DHCP server you can specify the location of the DHCP Server Controller by clicking the Use proxy server checkbox and entering the DNS name or IP Address of the machine running the DHCP Server controller. This option allows the system to connect to DHCP servers in different forests where a cross-forest trust does not exist. It also allows a non-Windows version of Men & Mice Central to manage Microsoft DHCP servers.

2. Click OK. You are connected to the server. Once connected, the name of the newly added server displays under DHCP Servers in the Object Section. (You may need to click the plus (+) sign next to DHCP Servers to see it.)

Server Access on Remote Computers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To manage DHCP servers you must have the DHCP Server Controller installed. For the ISC DHCP server and the Kea DHCP server, a DHCP Server Controller must be installed on each DHCP server you want to manage.

If you plan to use Men & Mice Suite to manage any Microsoft DHCP servers, install the DHCP Server Controller on a Windows machine that is a member of the same domain or workgroup as the DHCP servers. You may install multiple copies of the DHCP Server Controller, for example if you want to manage Microsoft DHCP Servers that reside in different forests. A single DHCP Server Controller for Microsoft DHCP Servers can manage multiple DHCP servers. The DHCP Server Controller must adhere to whatever restrictions and security standards are set forth in Microsoft Windows.

To configure the DHCP Server Controller to access DHCP servers on remote computers, do the following:

1. Before you can administer DHCP servers, verify that the DHCP Controller is running as a Windows User and has the necessary privileges.

2. To enable DHCP Management in the Men & Mice Suite, start the Windows Services program and open the properties dialog box for Men & Mice DHCP Server Controller.

3. Click the Log On tab. The Local System account radio button is most likely selected.

4. Click the This account radio button and enter the name and password of a Windows User that is a member of either the Administrators role or the DHCP Administrators role.

5. Close the dialog box and restart the Men & Mice DHCP Server Controller service.

.. warning::
  Lease history gathering is not possible if you are managing MS DHCP servers on remote computers using the DHCP Server Controller. To gather lease history for a MS DHCP server, you must install the DHCP Server Controller on the server and use the Microsoft with Agent Installed connection method when connecting to the server.

Edit DHCP Server Name
---------------------

This feature allows you to change the name or IP Address used to connect to a DHCP server. This is useful if you need to refer to the server by another name or if you are connecting to the server by an IP Address and the IP Address has changed. You can also use this feature to change the connection method for MS DHCP servers.

To access this feature, do the following:

1. Locate the applicable server.

2. Right-click and, from the shortcut menu, select Edit Server Name. The Edit Server name dialog box displays.

..

3. Change the Server name, Server address (optional), and Server Type. If applicable, you can select Use proxy server and enter the relevant information.

4. Click OK.

Inherited Access
----------------

You can manage access to scopes just as you can for other object types in the Men & Mice Suite, but there is one important distinction: you can set Inherited Access for scopes. When you open the Access dialog box for a scope, the dialog box has an extra section for inherited access.

Checking the Inherit Access checkbox will have the selected scope inherit all access bits from its parent range. This means that whenever the access privileges for the parent range are changed, they will be applied to the scope as well.

Clicking the Apply access inheritance in child ranges button will enable access inheritance for all descendants of the scope. This means that whenever the access privileges in the scope are changed, the changes will be applied of all descendants of the scope.

Regarding other access settings, refer to :ref:`global-access`.

Delete
------

.. note::
  For information on removing a DHCP server on a Men & Mice Appliance, refer to Appliance Management.

To remove a DHCP server, do the following:

1. In the Object Section of the Management Console, click on DHCP Servers.

2. In the Object List, right-click on the DHCP Server you want to remove.

3. From the shortcut menu, select Delete.

4. In the confirmation dialog box, click Yes.

Managing Groups/Hosts
---------------------

Applies to ISC DHCP Servers only. Allows you to manage groups and hosts within groups on an ISC DHCP server. You can also manage host entries that are defined in the global scope.

To manage groups and hosts, do the following:

1. Select the ISC DHCP server for which you want to manage groups and/or hosts.

2. Right-click on the server and, from the shortcut menu, select Manage Groups and Hosts. A new menu displays in the menu bar and the DHCP Groups dialog box displays.

..
