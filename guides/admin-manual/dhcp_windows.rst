.. meta::
   :description: Defining options on Microsoft DHCP servers in Micetro by Men&Mice
   :keywords: DHCP, DHCP servers, DHCP Windows

.. _dhcp-windows:

Microsoft DHCP
===============

.. _dhcp-windows-define-options:

Defining Options on MS DHCP Servers
-------------------------------------

1. On the **Admin** page, select :guilabel:`Service Management` in the upper-left corner. 

2. Under **DHCP Services** in the filtering sidebar, select the applicable Microsoft DHCP server. 

3. On the :guilabel:`Action` menu, select either :guilabel:`Manage DHCPv4 options` or :guilabel:`Managem DHCPv6 options`. You can also select these options on the **Row menu (...)**. 

4. The *Manage DHCP Options* dialog box opens, showing all options defined on the DHCP server.

5. Use the drop-down menu to select the option you want to define.

   .. image:: ../../images/dhcpv6-options-10.5.png
      :width: 50%
 
6. To delete an option, hover over its field, and then click the trash can icon next to it.

5. Click :guilabel:`Save` to save the updated options.

.. _ms-dhcp-dns-options:

MS DHCP options (DNS tab)
^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

Disable dynamic updates for DNS PTR records
  Turns off dynamic updates for PTR records.

Reconciling Scopes
--------------------
The :guilabel:`Reconcile DHCP Scopes` option is used to fix inconsistencies between information in the registry and the DHCP database. For more information about how to reconcile MS DHCP servers, see :ref:`reconcile-scopes`.
