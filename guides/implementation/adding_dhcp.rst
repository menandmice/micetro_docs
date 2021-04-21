.. _adding-dhcp:

Add DHCP Servers
================

DHCP servers require :ref:`install-controllers` and need to be added using their fully qualified names (such as ``dns1.europe.ad.mmdemo.local``).

.. note::
  Servers in Microsoft Active Directory environments can be added without installing a server controller. See :ref:`agent-free-dns-dhcp`.

.. note::
  ISC DHCP servers require a DHCP Server Controller to be installed on each DHCP server. Kea servers require *only one* DHCP Server Controller installed in the system, either on the machine running Kea, or a machine that can connect to the :ref:`kea-control-agent` through the network.

The following table demonstrates the different options when adding a DHCP Server.

+---------------------------+---------------------------------------------------------------------------------------------------------------------+
| Server type               | Description                                                                                                         |
+===========================+=====================================================================================================================+
| Microsoft Agent-Free [1]_ | The DHCP Server Controller has been installed on the machine running the Men&Mice Central Component,                |
| (Use proxy not checked)   | and that machine will be used as a proxy. Micetro is not able to track lease history data.                          |
+---------------------------+---------------------------------------------------------------------------------------------------------------------+
| Microsoft Agent-Free [1]_ | The DHCP Server Controller has been installed on the machine identified in the **Use proxy server** field,          |
| (Use proxy checked)       | and that machine will be used as a proxy. Micetro is not able to track lease history data.                          |
+---------------------------+---------------------------------------------------------------------------------------------------------------------+
| Microsoft                 | The DHCP Server Controller has been installed on the remote DHCP server.                                            |
| with Agent Installed      | Micetro is able to track lease history data.                                                                        |
+---------------------------+---------------------------------------------------------------------------------------------------------------------+
| ISC DHCP                  | Either a Unix server running the ISC DHCPD or a Men&Mice Appliance with the ``mm-dhcpd`` package installed          |
+---------------------------+---------------------------------------------------------------------------------------------------------------------+
| ISC Kea                   | A server running ISC Kea with the :ref:`kea-control-agent` installed and accessible for the DHCP Server Controller. |
| (Agent-free) [1]_         |                                                                                                                     |
+---------------------------+---------------------------------------------------------------------------------------------------------------------+
| ISC Kea                   | A server running ISC Kea with a DHCP Server Controller and Control Agent installed. [2]_                            |
+---------------------------+---------------------------------------------------------------------------------------------------------------------+
| Cisco                     | The DHCP Server Controller has been installed on the machine running the Men&Mice Central Component,                |
| (Use proxy not checked)   | and that machine will be used as a proxy.                                                                           |
+---------------------------+---------------------------------------------------------------------------------------------------------------------+
| Cisco                     | The DHCP Server Controller has been installed on the machine identified in the **Use proxy server** field,          |
| (Use proxy checked)       | and that machine will be used as a proxy.                                                                           |
+---------------------------+---------------------------------------------------------------------------------------------------------------------+

.. [1] See :ref:`agent-free-dns-dhcp`.

.. [2] Alternatively, you can configure a socket for communication in ``kea-dhcp4.conf``.

.. important::
  To add Kea servers to Micetro, they need to be configured with the ``libdhcp_lease_cmds.so`` library. See :ref:`add-kea-hooks` for details.

1. Log in to the Web Application

2. Navigate to :menuselection:`Admin --> Server Management`.

3. Click :guilabel:`Add DHCP server` in the interface

.. image:: ../../images/Admin-Micetro.png
  :width: 80%
  :align: center

4. The *Add DHCP server* modal will display.

5. Fill in the server’s FQDN. Optionally, you can specify its IP address (IPv4 or IPv6).

6. Select the server type from the dropdown.

.. image:: ../../images/add-dhcp-server.png
  :width: 60%
  :align: center

7. Click :guilabel:`Confirm`.

If the entered details are correct and the server is accessible, it will show up in the server management list and the Networks context.

For further details, refer to :ref:`dhcp` in the User Guide.


.. note::
  To add a new DHCP server in the Management Console, the administrator will select :menuselection:`File --> New --> DHCP Server`.
