.. meta::
   :description: When Micetro synchronizes in data from Meraki it maps the Meraki objects into the Micetro object model. This article describes how Meraki objects get mapped into Micetro.
   :keywords: Meraki, Micetro, Mapping, Dashboard

.. _meraki-mapping:

Mapping of Meraki objects to Micetro
=======================

When Micetro synchronizes in data from Meraki it maps the Meraki objects into the Micetro object model. This article describes how Meraki objects get mapped into Micetro.

Networks
--------
Micetro can sync in multiple Meraki organizations with the same API key. When Micetro syncs in a Meraki network it creates a DHCP server object for each network. 
The DHCP server object is named after the network it represents.

VLANS/SingleLANs
--------

Micetro syncs in **VLANs/SingleLans** as DHCP scopes. The DHCP scopes are attached to the DHCP server that Micetro uses to represent the Meraki network that they are on. 
If the LAN does not have DHCP enabled or if the LAN is configured with a DHCP relay it will be shown as a disabled DHCP scope since that scope instance is not actually doing the DHCP.

**Fixed IP assignments** on Meraki are shown as DHCP reservations in Micetro. They can be managed through Micetro just like reservations on other DHCP providers. 
The static IPs in LANs for Meraki devices like appliances and access points are also shown as reservations in Micetro.

**Reserved IP ranges** in Meraki are shown in Micetro as DHCP exclusions. DHCP Exclusions can be managed through Micetro for Meraki just like on Cisco IOS and Microsoft DHCP.

.. note::
    Note that if a Meraki environment has multiple LANs that share the same address block, they will be shown in Micetro as a overlapping DHCP scope.


DHCP options
^^^^^^^^^^^^
Regular **DHCP options** in Meraki get mapped to Micetro DHCP options and can be managed like DHCP options for all other providers.
Micetro also maps certain Meraki LAN properties like "Lease time", "DNS nameservers" to DHCP Options. 

Meraki LAN properties that Micetro treats as DHCP options

.. csv-table::
   :header: "Property", "Option"
   :widths: 40, 40

   "DNS nameservers", "DHCP options 6"
   "Lease time", "DHCP options 51"
   "Boot next-server", "DHCP options 66"
   "Boot filename", "DHCP options 67"

To update one of these LAN properties, open up the DHCP Options dialog for a scope and select the matching Option from the dropdown list at the top.

Network Clients
--------
**Network clients** in Meraki get synced into Micetro as DHCP leases. After opening up a scope client related information for the lease is both visible in the IP address table and in the
inspector view on the right hand side when the lease is higlighted. 