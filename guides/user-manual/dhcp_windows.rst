.. meta::
   :description: Defining options on Microsoft DHCP servers 
   :keywords: DHCP, Windows, Microsoft server 

.. _dhcp-windows:

Microsoft DHCP
--------------

.. _dhcp-windows-define-options:

Defining Options on MS DHCP Servers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. In :menuselection:`Admin --> Server Management` select the applicable DHCP Server and select :guilabel:`Edit DHCP options` from the ellipsis menu or use :menuselection:`Actions --> Edit DHCP options`. The *Edit DHCP options* box displays. The dialog box shows all options defined on the DHCP server.

2. Use the drop-down menu to select the option you want to define.

.. image:: ../../images/windows-dhcp-options-Micetro.png
  :width: 50%
  :align: center

3. To add an option, select the option from the list. The option filed is added to the dialog box.

4. To delete an option, hover over its field and click the trash button next to it.

5. Click :guilabel:`Save` to save the updated options.

.. _ms-dhcp-dns-options:

MS DHCP options (DNS tab)
^^^^^^^^^^^^^^^^^^^^^^^^^

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

Reconcile Scopes
----------------

See :ref:`console-dhcp-windows-reconcile`.
