.. meta::
   :description: Adding a new DHCP server in the Micetro by Men&Mice Management Console.
   :keywords: DHCP server, DHCP

.. _console-new-dhcp-server:

New DHCP Server (Management Console, deprecated)
------------------------------------

.. note::
  When adding a DHCP server, the system automatically changes existing IP Address ranges to scopes if it finds IP Address ranges that contain the same start and end address as a scope on the DHCP server being added.

You must be logged in as a user with privileges to administer DHCP in order to add a DHCP server.

.. note::
  For information on adding a DHCP server on a Men&Mice Appliance, refer to :ref:`appliance-management`.

1. From the menu bar, select :menuselection:`File --> New --> DHCP Server`. The *Add DHCP Server* dialog box is shown.

Server Name
  Type either the DNS name or the IP Address of the DHCP server.

Server address (optional)
  If desired, type the IPv4 or IPv6 address for the server. This is not required, but doing so allows the Management Console to connect to the server by IP Address instead of by name.

Server Type
  Click the drop-down list, and select the desired server type.

    Microsoft with Agent Installed
      connects to a Microsoft DHCP server that has a DHCP Server Controller installed. If you want to gather the lease history from the DHCP server, you must use this connection method. See :ref:`dhcp-windows`.

    Microsoft Agent-Free
      connects to a Microsoft DHCP server that does not have a DHCP Server Controller installed. When using this connection method, it is not possible to gather the lease history from the DHCP server. For further information regarding this connection method, refer to :ref:`dhcp-remote-access`. See :ref:`dhcp-windows`.

    ISC
      connects to an ISC DHCP server. See :ref:`dhcp-isc`.

    Cisco
      connects to a Cisco Router that is running DHCP server software. For more information, see :ref:`dhcp-cisco`.

    Kea
      connect to a ISC Kea DHCP server. See :ref:`dhcp-kea`.

Use proxy server
  If you are adding a Microsoft or a Cisco DHCP server you can specify the location of the DHCP Server Controller by clicking the :guilabel:`Use proxy server` checkbox and entering the DNS name or IP Address of the machine running the DHCP Server controller. This option allows the system to connect to DHCP servers in different forests where a cross-forest trust does not exist. It also allows a non-Windows version of Men&Mice Central to manage Microsoft DHCP servers.

2. Click :guilabel:`OK`. You are connected to the server. Once connected, the name of the newly added server displays under DHCP Servers in the Object Section. (You may need to click the :guilabel:`+` sign next to DHCP Servers to see it.)
