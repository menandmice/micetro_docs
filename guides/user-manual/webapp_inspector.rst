.. meta::
   :description: The Inspector in the Micetro by Men&Mice Web Application overview 
   :keywords: DNS zone, DDI, Micetro

.. _webapp-inspector:

The Inspector
=============

Overview
--------

The inspector, located to the right of the grid in each context, serves as an infobox for the selected objects (such as the DNS zone list) in the grid, as well as always showing the possible actions for the selected item at the top. In some cases it is possible to edit the information, such as DNS zone authority or the SOA record, for each zone.

Actions
-------

All actions for the selected object are shown in the actions section.

Properties
----------

All properties for the selected object are shown in the properties section. These include all custom properties that have been defined for a specific object type.

For IP addresses, where available, the vendor for the specific MAC address is also shown.

Context specific
----------------

DNS zones
^^^^^^^^^

The following sections are specific to DNS zones.

SOA
"""

Allows the user to see and edit SOA information for the selected DNS zone.

Authority
"""""""""

Lists all authoritative servers for the selected DNS zones. Allows for modifying which servers are slave servers for the DNS zone.

DNS Records
^^^^^^^^^^^

Related DNS Data
""""""""""""""""

Shows all related DNS records. (For example TXT or CNAME records that are associated with a specific A record.)

Allows editing each record by clicking on the menu for each.

Networks
^^^^^^^^

Related DNS Data
""""""""""""""""

Shows all related DNS records. (For example TXT or CNAME records that are associated with an IP address.)

Allows editing each related record by clicking on the menu for each.

Related DHCP Data
"""""""""""""""""

Only shown where applicable. (I.e. when there is related DHCP data.)

Shows a list of reservations where each reservation can be edited or deleted through a menu.
