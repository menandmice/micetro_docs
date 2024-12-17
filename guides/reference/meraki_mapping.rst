.. meta::
   :description: When Micetro synchronizes in data from Meraki it maps the Meraki objects into the Micetro object model. This article describes how Meraki objects get mapped into Micetro.
   :keywords: Meraki, Micetro, Integration, Mapping, Dashboard

.. _meraki-mapping:

Mapping Meraki Objects to Micetro
==================================

Micetro synchronizes data from Meraki by mapping Meraki objects into its object model. This article outlines the mapping process of Meraki objects into Micetro.

Networks
--------
Micetro is capable of synchronizing multiple Meraki organizations using the same API key. It creates a DHCP server object for a Meraki network during synchronization, naming the object after the network.

.. note::
   Only Meraki networks with Meraki MX devices will be visible in Micetro


VLANS
---------------

**VLANs** on Meraki devices which are configured to serve DHCP from the Meraki device will be visible in Micetro as DHCP scopes, attaching them to the correscponding DHCP server object representing the Meraki network. 

**VLANs** without DHCP or those configured with a DHCP relay **won't** appear in Micetro.

**Fixed IP assignments** in Meraki are shown as DHCP reservations in Micetro, allowing management similar to other DHCP providers. 
Static IPs in LANs for Meraki devices, such as appliances and access points, are also shown as in Micetro as DHCP reservations.

**Reserved IP ranges** in Meraki are shown as DHCP exclusions in Micetro, which can be managed in the same way as Cisco IOS and Microsoft DHCP systems.

.. note::
    In cases where a Meraki environment has multiple LANs sharing the same address block, Micetro will display them as a overlapping DHCP scopes.


DHCP Options
---------------
Regular **DHCP options** in Meraki are mapped to Micetro DHCP options and can be managed similarly to DHCP options for other providers.
Micetro also maps certain Meraki LAN properties such as "Lease time" and "DNS nameservers" to DHCP options. 

Meraki LAN properties that Micetro treats as DHCP options:

.. csv-table::
   :header: "Property", "Option"
   :widths: 40, 40

   "DNS nameservers", "DHCP options 6"
   "Lease time", "DHCP options 51"
   "Boot next-server", "DHCP options 66"
   "Boot filename", "DHCP options 67"

To update any of these LAN properties, open the DHCP Options dialog box for a scope and select the appropriate option from the drop-down list at the top.

Network Clients
---------------
**Network clients** in Meraki are displayed in Micetro as DHCP leases. When drilling down into a scope, details related to the client for that lease are displayed both in the IP Address table and the
inspector panel on the right-hand side when a lease is selected. 

|
**Related Topics**:

* :ref:`cisco-meraki`
