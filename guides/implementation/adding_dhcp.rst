.. _adding-dhcp:

Add DHCP Servers
================

DHCP servers require :ref:`install-controllers` and need to be added using their fully qualified names (such as ``dns1.europe.ad.mmdemo.local``).

.. note::
  Servers in Microsoft Active Directory environments can be added without installing a server controller. See :ref:`agent-free-dns-dhcp`.

The following table demonstrates the different options when adding a DHCP Server.

+---------------------------+----------------------------------------------------------------------------------------------------------+
| Server type               | Description                                                                                              |
+===========================+==========================================================================================================+
| Microsoft Agent-Free      | The DHCP Server Controller has been installed on the machine running the Men&Mice Central Component,     |
| (Use proxy not checked)   | and that machine will be used as a proxy. Men&Mice is not able to track lease history data.              |
+---------------------------+----------------------------------------------------------------------------------------------------------+
| Microsoft Agent-Free      | The DHCP Server Controller has been installed on the machine identified in the "Use proxy server" field, |
| (Use proxy checked)       | and that machine will be used as a proxy. Men&Mice is not able to track lease history data.              |
+---------------------------+----------------------------------------------------------------------------------------------------------+
| Microsoft                 | The DHCP Server Controller has been installed on the remote DHCP server.                                 |
| with Agent Installed      | Men&Mice is able to track lease history data.                                                            |
+---------------------------+----------------------------------------------------------------------------------------------------------+
| ISC DHCP                  | Either a Unix server running the ISC DHCPD or a Men&Mice Appliance with the mm-dhcpd package installed   |
+---------------------------+----------------------------------------------------------------------------------------------------------+
| ISC Kea                   |                                                                                                          |
+---------------------------+----------------------------------------------------------------------------------------------------------+
| Cisco                     | The DHCP Server Controller has been installed on the machine running the Men&Mice Central Component,     |
| (Use proxy not checked)   | and that machine will be used as a proxy.                                                                |
+---------------------------+----------------------------------------------------------------------------------------------------------+
| Cisco                     | The DHCP Server Controller has been installed on the machine identified in the "Use proxy server" field, |
| (Use proxy checked)       | and that machine will be used as a proxy.                                                                |
+---------------------------+----------------------------------------------------------------------------------------------------------+
