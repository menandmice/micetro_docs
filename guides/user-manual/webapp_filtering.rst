.. _webapp-filtering:

Filtering sidebar
=================

Overview
--------

The filtering sidebar acts as a selector in each context, and allows users to quickly find the zones or networks. Users can select pre-defined “filters” or selectors (shown in the image on the right, and described in tables below for other contexts in the system).

The sidebar is open (displaying icon and text) by default, but can be collapsed to an icon-only mode. In case where a list of clickable items is needed the sidebar is automatically unfolded.

Selecting an item in the filtering sidebar applies the filter for the main work grid. Users can further narrow down results with quickfilters from the top menu. (See :ref:`webapp-quick-filter`.)

.. tip::
  When you select a filter in the filtering sidebar, and then use the :guilabel:`Create` operation in the grid, the type of object will be automatically selected based on the active filter.

Common filters
--------------

These are a set of common filters available in all sections for the Web Application.

.. csv-table::
  :header: "Name", "Description"
  :widths: 20, 80

  "All <zones, records, networks, IP addresses>", "When selected, all objects (DNS zones, DNS records, networks and IP addresses) are shown"
  "Favorites", "All items that have been flagged as favorite in the system are shown here in each context"
  "Folders", "All items that have been added to folders in the system are shown here in each context"
  "Recently viewed", "All items that have been viewed in the last 24 hours"
  "Recently created", "The last 15 items that were created"
  "Recently modified", "The last 15 items that were modified"

Filters for DNS zones
---------------------

.. csv-table::
  :header: "Name", "Description"
  :widths: 20, 80

  "Zone types", "Allows users to select between master, slave or other (for example stub, forward or AD integrated) zones"
  "DNS views", "Shows all existing views that are configured in the system as a list"
  "DNS services", "Shows all DNS servers configured in the system"
  "DNSSEC signed", "Shows all DNSSEC signed DNS zones"
  "Reverse zones", "Shows all reverse zones configured in the system"

Filters for DNS records
-----------------------

.. csv-table::
  :header: "Name", "Description"
  :widths: 20, 80

  "Record types", "Allows users to select between the following record types: **A / AAAA**, **CNAME**, **NS**, **MX**, **Other**"
  "DNSSEC records", "Shows all DNSSEC records in the DNS zone"
  "Dynamic records", "Shows all dynamic DNS records in the DNS zone"

Filters for Network list
------------------------

.. csv-table::
  :header: "Name", "Description"
  :widths: 20, 80

  "IP ranges", "Shows all IP ranges configured in the system"
  "DHCP scopes", "Shows all DHCP scopes configured in the system"
  "Containers", "Shows all containers configured in the system and allows users to show the contents from the container that is selected"
  "Highly utilized", "Show all networks that have a utilization higher than or equal to 90%"

Filters for Network contents
----------------------------

.. csv-table::
  :header: "Name", "Description"
  :widths: 20, 80

  "Recently seen", "Show all IP addresses that have been recently discovered by a router or a firewall"
  "Status", "Allows users to show all IP addresses based on the following statuses: *Free*, *Assigned*, *Claimed*, *Leased*, *Reserved*"
