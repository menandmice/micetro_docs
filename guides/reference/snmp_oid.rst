.. meta::
   :description: The supported SNMP OIDs in Micetro by Men&Mice.
   :keywords: SNMP, service discovery, DHCP, ARP tables, Micetro 

.. _snmp-oid:

Which SNMP OIDs are used by Micetro in IP address and Subnet Discovery
----------------------------------------------------------------------

Micetro has the capability to scan a defined list of routers and retrieve the ARP tables and/or the subnets and their information found on the routers.

To perform this scanning, the following suite of SNMP OIDs are used:

IP-MIB:
"""""""

* ipNetToMediaPhysAddress: .1.3.6.1.2.1.4.22.1.2

* ipAdEntAddr: .1.3.6.1.2.1.4.20.1.1

* ipAdEntIfIndex: .1.3.6.1.2.1.4.20.1.2

* ipAdEntNetMask: .1.3.6.1.2.1.4.20.1.3

ENTITY-MIB:
"""""""""""

* entPhysicalSerialNum: .1.3.6.1.2.1.47.1.1.1.1.11

SNMPv2-MIB:
"""""""""""

* sysName: .1.3.6.1.2.1.1.5

CISCO-VLAN-IFTABLE-RELATIONSHIP-MIB:
""""""""""""""""""""""""""""""""""""

* cviRoutedVlanIfIndex: .1.3.6.1.4.1.9.9.128.1.1.1.1.3

CISCO-VRF-MIB:
""""""""""""""

* cvVrfInterfaceType: .1.3.6.1.4.1.9.9.711.1.2.1.1.2

* cvVrfName: .1.3.6.1.4.1.9.9.711.1.1.1.1.2

.. note::
  Each device is only queried once, as the system checks the serial number and the sysName to discover both physical and virtual switches. Micetro does not synchronize with the same serial number twice.
