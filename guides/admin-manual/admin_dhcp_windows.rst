.. meta::
   :description: Defining options on Microsoft DHCP servers in Micetro by Men&Mice
   :keywords: DHCP, DHCP servers, DHCP Windows

.. _admin-dhcp-windows:

Microsoft DHCP
===============

.. _dhcp-windows-define-options:

Defining Options on MS DHCP Servers
-------------------------------------

1. On the **Admin** page, select :guilabel:`Service Management` in the upper-left corner. 

2. Under **DHCP Services** in the filtering sidebar, select the applicable Microsoft DHCP server. 

3. On the :guilabel:`Action` menu, select either :guilabel:`Manage DHCPv4 options` or :guilabel:`Managem DHCPv6 options`. You can also select these options on the **Row menu (...)**. 

4. The Manage DHCP Options dialog box opens, showing all options defined on the DHCP server.

5. Use the drop-down menu to select the option you want to define.

   .. image:: ../../images/dhcpv6-options-10.5.png
      :width: 65%
 
6. To delete an option, hover over its field, and then click the trash can icon next to it.

7. Click :guilabel:`Save` to save the updated options.

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
  
Editing Server Properties
--------------------------
You can edit the configuration of Windows servers.

1. Select the relevant Windows server.

2. On the :guilabel:`Action` menu, select :guilabel:`Edit configuration`. You can also select this option on the **Row menu (...)**. 

3. In the **Edit Configuration** dialog box, make the desired changes, and then click :guilabel:`Save`.

.. image:: ../../images/windows-dhcp-configuration.png
   :width: 70%
   
Toggling DHCPv6 Management On and Off
--------------------------------------
.. note::
   There is only one DHCP service on a Microsoft DHCP server. DHCPv4 and DHCPv6 are not decoupled in Microsoft as they are in Micetro. Any action performed on either DHCPv6 or DHCPv4 that requires a restart of the service will result in a restart of the single DHCP service on the Microsoft server.
   
1. On the **Admin** page, select one or multiple Microsoft DHCP servers.

2. On the :guilabel:`Action` menu, select :guilabel:`Edit service`. You can also select this option on the **Row menu (...)**. 

3. Select :guilabel:`Managem DHCPv6 service` to enable DHCPv6 management on the server(s) you selected.

4. Click :guilabel:`Confirm`.

Reconciling Scopes
--------------------
The :guilabel:`Reconcile DHCP Scopes` option is used to fix inconsistencies between information in the registry and the DHCP database. For more information about how to reconcile MS DHCP servers, see :ref:`reconcile-scopes`.
