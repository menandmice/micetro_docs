.. meta::
   :description: Overview, analysis, viewing and deleting of DNS zones in Micetro by Men&Mice
   :keywords: DNS zones, DNS servers

.. _dns-zones:

DNS zones
=========

.. |controls| image:: ../../images/console-dns-zones-zone-controls-icon.png
.. |analyze| image:: ../../images/console-analyze.png

.. note::
   This information applies to the web interface. For information about DNS zone management in the M&M Management Console, see :ref:`console-dns-zones`.

Overview
--------

The commands associated with zone management (located on the *DNS* page) are only available when a specific DNS server or DNS zone is selected. In other words, actions for the DNS zone are only available when DNS zones are listed. The default for the *DNS* context is displaying all zones. When a particular name server is selected, only the zones being managed on that server are listed.

The *DNS* page shows zone types in the second column.

.. csv-table::
  :header: "Indicator", "Description"
  :widths: 15, 85

  "Master (blue)", "A static master zone, which is always the original copy of the zone, and always present on that zone's master server."
  "Master (yellow)", "A dynamic master zone, which is always the original copy of the zone, and always present on that zone's master server."
  "Master (AD-integrated)", "(AD-integrated is displayed in a tooltip) An Active Directory Integrated zone."
  "Stub", "A stub zone. The corresponding master zone(s) is displayed in the Inspector window on the left."
  "Slave", "A slave zone. The corresponding master zone is displayed in the Inspector window on the left."
  "Forward", "A forward zone. The corresponding master zone is displayed in the Inspector window on the left."

Zone Viewing
------------

All Zones on All Servers
^^^^^^^^^^^^^^^^^^^^^^^^

You view all of the existing DNS zones at once, regardless of the server to which they belong.

Click :guilabel:`DNS` on the top. This causes all existing zones (to which you have access) to appear in the grid.

Single Name Server Zones
^^^^^^^^^^^^^^^^^^^^^^^^

In the filtering sidebar or through :menuselection:`Admin --> Service Management`, locate the DNS server that owns the zones you want to view, and then click on it. This will list all zones on the server. (In *Service Management* when a server is selected, select :guilabel:`Show zones` from the ellipsis menu to display all zones residing on the server.)

.. image:: ../../images/DNS-single-server-zones-Micetro.png
  :width: 80%
  :align: center

.. tip::
  The navigation indicator in the bottom left displays the name of the DNS server.

Zone Contents
^^^^^^^^^^^^^

The Inspector window on the right provides a detailed look at the data inside of a zone. The header record (a.k.a. Start of Authority or SOA record) displays as a collection of fields above the resource records.

To view the contents of a particular zone, double-click on it. This opens the Zone tab.

.. image:: ../../images/DNS-zone-contents-Micetro.png
  :width: 80%
  :align: center

SOA
^^^

Since the SOA record is seldom modified after it is created, the Inspector window has a built-in control that allows you to hide the SOA data from view. On the right edge of the Inspector, next to the :guilabel:`Edit` button, you'll notice the open/close button (:guilabel:`>` and :guilabel:`v`, respectively) to show/hide the SOA information.

SOA Fields
""""""""""

.. csv-table::
  :header: "Field", "Description"
  :widths: 15, 75

  "Master", "This field gives the name of the server that acts as master server for the zone."
  "Hostmaster", "This field is properly formatted by giving the e-mail address of the person responsible for zone with the @ symbol replaced with a period (.). For example, instead of hostmaster@example.com type hostmaster.example.com. The username part of the e-mail address cannot contain a (verbatim) dot (.). See RFC 1912 'Common DNS Operational and Configuration Errors', Section 2.2 for additional information."
  "Serial", "The serial number is a ten-digit number consisting of the year, the month, the day, and a two-digit daily revision number. (Actually, it is any integer between 0 and ~ 4 billion, but the preceding is the standard convention.) To create a unique serial number, the Management Console adds 1 to the daily revision number every time the zone is saved."
  "Refresh", "This is the period (in seconds) that determines how often slave servers will check with the master server to determine if their zone files are up to date. This is done by checking the serial number. The default value for this field is 28800, which equates to once every 8 hours."
  "Retry", "This determines the period that a slave server will wait before trying to re-contact the master zone (in the event that an earlier contact attempt is unsuccessful). The default value is 7200 seconds, or once every 2 hours."
  "Expire", "This value determines how long a slave server will keep serving a zone after its last successful contact to the master name server. Once the zone has expired, the slave stops giving information about the zone because it is deemed unreliable. The default expiration period is 604800 seconds, or 1 week."
  "Neg. caching", "This field is only available when connected to a BIND server. This value specifies how long a server will retain (cache) the knowledge that something does not exist. The default value is 86400 seconds, 24 hours."

Access/Access for Non-Master for Zone(s)
----------------------------------------

Refer to :ref:`access-control`.

Delete zone
-----------

Use this command to delete a zone from one or more servers. 

1. Select the zone(s) you want to delete.

2. From the ellipsis menu select :guilabel:`Delete zone` or use :menuselection:`Actions --> Delete zone`. The Delete Zone dialog box opens, showing each zone you selected and a list of servers that currently serve that zone. The zone(s) you selected will be deleted from every server that is checked on this list. To keep the zone on a particular server, clear the checkbox next to that server.

3. To delete the zone(s) from the selected servers, click the :guilabel:`Delete` button. The zone is removed from the servers.


Migrating Zones
-----------------

In the Zone Migration Wizard you can migrate one or more zones from one server to another, including all data in the zone.

To migrate a zone:

1. Select one or more zones.

2. On the ellipsis menu, select :guilabel:`Migrate Zone` or use :menuselection:`Action --> Migrate zone`. The Migrate Zone(s) Wizard dialog box opens.

3. Enter or select the necessary inormation.

.. tip::
  You can duplicate DNS zones by leaving the **Remove original zone** checkbox unselected.


.. _ad-preferred-servers:

Edit Preferred Servers
----------------------

.. note::
  This option is only available when working with AD integrated zones. (See :ref:`active-directory`.)

DNS administrators can specify the server to use when opening an AD integrated zone, as well as the order of servers to use if the first preferred server becomes unavailable.

1. Navigate to the :menuselection:`DNS` page and select the :guilabel:`AD Integrated` filter from the sidebar on the left.

2. Select the zone(s) you'd like to set preferred servers for.

3. Use :guilabel:`Action --> Edit preferred server` from the top bar or the ellipsis menu.

4. Change the order of your servers into the preferred order. The server on the top of the list is tried first, then - if that server is unavailable - the second, and so on.

5. Click :guilabel:`Save`.

.. warning::
  If you selected multiple zones, they might have different settings for preferred servers. Saving the configuration will overwrite the previous settings on all selected zones.


Folders
-------

See :ref:`object-folders` for details on this function.

.. _dns-forward-zone:

Forward Zone
------------

For creating a forward zone, see :ref:`webapp-create-dns-zone`.


Master Zone
-----------

For creating primary zones, see :ref:`webapp-create-dns-zone`.


Editing Zone Properties
----------------------------

Using the :guilabel:`Edit Properties` option on the Action menu, you can edit custom properties that have been configured for DNS zones.


Promote Secondary to Primary
----------------------------

The Promote Zone feature makes it possible to change a secondary zone to a primary zone. This might be necessary in emergency situations, for example if the primary zone becomes unavailable for an extended period of time. This feature is only available for DNS Administrators.

When a secondary zone is promoted, the following actions are performed:

* Micetro checks whether the most recent copy of the zone is found in its internal database or on the server hosting the slave zone and uses the copy that is more recent.

* The server hosting the secondary zone is configured so that the zone is saved as a primary zone on the server.

* The zone history and access privileges from the old primary zone are applied to the new primary zone.

* The configurations of other instances of the secondary zone are modified so that they will get the updates from the new primary zone.

To promote a secondary zone to a primary zone:

1. Select the secondary zone.

2. On the ellipsis menu, select :guilabel:`Promote to primary` or using :menuselection:`Actions --> Promote to primary`. An information message displays:

.. image:: ../../images/DNS-promote-to-master-Micetro.png
  :width: 50%
  :align: center

3. Click :guilabel:`Save` to continue, or :guilabel:`Cancel` to discontinue the process.

Search
------

For search, see :ref:`webapp-quick-command`.

Secondary Zone
----------

For creating slave zones, see :ref:`webapp-create-dns-zone`.


.. _dns-stub-zone:

Stub Zone
---------

For creating stub zones, see :ref:`webapp-create-dns-zones`.


View History
------------

Opens the History window and displays a log of all changes that have been made to the zone, including the date and time of the change, the name of the user who made it, the actions performed, and any comments entered by the user. See :ref:`webapp-object-change-history`.
