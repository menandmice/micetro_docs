.. meta::
   :description: Managing Microsoft DHCP servers in Micetro
   :keywords: DHCP, DHCP servers, DHCP Windows

.. _admin-dhcp-windows:

Managing Microsoft DHCP
=======================
In Micetro, you can manage your connected Microsoft DHCP services by:

* :ref:`ms-dhcp-dns-options`
* :ref:`dhcp-windows-manage-dhcpv6`
* :ref:`dhcp-windows-reconcile-scopes`


.. _ms-dhcp-dns-options:

Configuring DNS Options on MS DHCP Services
-------------------------------------------
You can configure DNS options related to DNS dynamic updates to determine how the DHCP server interacts with the DNS server to update DNS records dynamically. To configure DNS options on your MS DHCP service:

1. Locate the applicable DHCP service in the data grid.

2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select either :guilabel:`Manage DHCPv4 options` or :guilabel:`Manage DHCPv6 options`.

3. In the dialog, select the :guilabel:`DNS` tab.

4. Select or deselect the following options:

   * **Enable DNS dynamic updates according to the settings below**: Specifies whether the DHCP server sends DNS dynamic record updates (for A and PTR records) to the DNS server. Updates are sent to DNS servers configured in TCP/IP client properties for any active network connections at the DHCP server.

      * **Dynamically update DNS records only if requested by the DHCP clients**: Specifies that the DHCP server updates forward and reverse lookups based on the type of request made by the client during the lease process.

      * **Always dynamically update DNS records**: Specifies that the DHCP server updates forward and reverse DNS lookups when a client acquires a lease, regardless of the type of request used to acquire it.

   * **Discard A and PTR records when lease is deleted**: Specifies whether the DHCP server discards forward DNS lookups for clients when a lease expires.

   * **Dynamically update DNS records for DHCP clients that do not request updates**: Specifies whether the DHCP server sends dynamic updates to the DNS server for DHCP clients that do not support performing these updates. If selected, clients running earlier versions of Windows are updated by the DHCP server for both their host (A) and pointer (PTR) resource records.

   * **Disable dynamic updates for DNS PTR records**: Turns off dynamic updates for PTR records.

5. Select :guilabel:`Save`.


.. _dhcp-windows-manage-dhcpv6:

Enabling or Disabling DHCPv6 Management
---------------------------------------
There is only one DHCP service on a Microsoft DHCP server. Unlike Micetro, where DHCPv4 and DHCPv6 are separate, Microsoft combines them. As a result, any action that requires either DHCPv6 or DHCPv4 to be restarted will cause the unified DHCP service on the Microsoft server to be restarted.

You can turn DHCPv6 management on or off on the MS DHCP server as needed for your operation.

1. In the data grid, locate the Microsoft DHCP server you want to manage.

2. Use either the :guilabel:`Action` menu or the Row :guilabel:`...` menu, select :guilabel:`Edit service properties`. 

3. In the dialog, select the :guilabel:`Manage DHCPv6 service` checkbox to enable DHCPv6 management on the server(s) you selected.

4. Select :guilabel:`Save`.

.. _dhcp-windows-reconcile-scopes:

Reconciling Scopes
--------------------
Use the :guilabel:`Reconcile DHCP Scopes` option to resolve any inconsistencies between information in the registry and the DHCP database.
