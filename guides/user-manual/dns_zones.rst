.. meta::
   :description: Overview, analysis, viewing, and deleting of DNS zones in Micetro
   :keywords: DNS zones, DNS servers

.. _dns-zones:

DNS Zones
=========

.. |controls| image:: ../../images/console-dns-zones-zone-controls-icon.png
.. |analyze| image:: ../../images/console-analyze.png

.. note::
   This information applies to the Micetro web interface. For information about DNS zone management in the M&M Management Console, see :ref:`console-dns-zones`.

By default, the DNS page displays all primary zones in the system regardless of authority. 

.. image:: ../../images/DNS-Micetro.png
   :width: 90%
|
The left sidebar offers several options for filtering and organizing zones. At the bottom of the sidebar, you can select what to display: **Menu**, **Folders**, and **DNS services**. 


.. image:: ../../images/sidebar-tabs.png
   :width: 65%

* **Menu** provides the most commonly used filtering options for zones, such as zone types, favorites, and reverse zones.

* **Folders** allow you to organize zones and filter queries into folders. For more information about folder management, see :ref:`folder-management`.

* **DNS services** allows you to view zones by server/service. This can be useful if you have multiple DNS services and want to view the zones associated with each one separately.

Micetro will remember your current view selection when you navigate away from the DNS page and return to it later.

.. _dns-zone-types:

Zone Types
-----------
This table shows the zone types supported by Micetro.

.. csv-table::
  :header: "Type", "Description"
  :widths: 15, 85

  "Primary (blue)", "A primary zone, which is always the original copy of the zone, and always present on that zone's primary server."
  "Primary (yellow)", "A dynamic primary zone, which is always the original copy of the zone, and always present on that zone's primary server."
  "Primary (purple)", "An Active Directory Integrated primary zone."
  "Secondary", "A read-only copy of a primary zone or another secondary zone."
  "Hint", "Root zone used for bootstrapping of recursive DNS servers."
  "Options template", "This configuration template is specific to the AuthServe DNS server and can be used to add templated options configuration to multiple zones. Editing the options template will affect all zones using the template."
  "*Configuration types*", "*The below zone types are essentially a configuration that tells the (recursive) DNS server how to resolve zones it cannot resolve the normal way*."
  "Stub", "A stub zone is a copy of a DNS zone that contains only resource records that identify the authoritative DNS servers for that zone. A stub zone is dynamically updated from the list of primary DNS servers."
  "Static-stub", "A BIND specific zone type to configure conditional forwarding, similar to Stub but is static, that is, it has a set of preconfigured NS entries."
  "Forward", "A forward zone contains a list of name server addresses, called forwarders, that can resolve queries for the zone. With forward zones queries are forced to go to the specified addresses."
 
Zone Contents
^^^^^^^^^^^^^

The Inspector panel on the right provides a look at the Start of Authority (SOA) record, and properties of the selected zone. 

.. image:: ../../images/DNS-zone-contents-Micetro-10.5.png
   :width: 65%
      
Click the header of the desired section to collapse or expand the section.

SOA 
""""
The SOA record contains the following data fields. To edit SOA information, click the pencil icon in the section header.

.. csv-table:: 
  :header: "Field", "Description"
  :widths: 15, 75

  "Primary", "The name of the server that serves as the primary server for the zone."
  "Hostmaster", "The email address of the individual responsible for the zone, formatted with a period (.) in place of the @ symbol. For example, hostmaster@example.com should be entered as hostmaster.example.com. The username must not contain a literal dot (.). See RFC 1912 'Common DNS Operational and Configuration Errors', Section 2.2 for additional information."
  "Serial", "A ten-digit number representing the year, month, day, and a two-digit daily revision number. It is actually any integer between 0 and approximately 4 billion, but the aforementioned format is the standard convention."
  "Refresh", "The interval in seconds at which secondary servers verify if their zone files are up to date by checking the serial number against the primary server. The standard setting for this field is 28800 seconds, or every 8 hours."
  "Retry", "The time a secondary server will wait to attempt reconnection with the primary zone after a failed attempt. The standard setting is 7200 seconds, or every 2 hours."
  "Expire", "The duration a secondary server will continue to serve a zone following the last successful contact with the primary name server. After expiration, the secondary server stops providing information about the zone, considering it unreliable. The standard expiration time is 604800 seconds, or 1 week."
  "Neg. caching", "This field is only available when connected to a BIND server. It specifies how long a server will cache the knowledge negative reponses. The standard setting is 86400 seconds, 24 hours."

Managing DNS Zones
-------------------

Viewing Zone Contents
^^^^^^^^^^^^^^^^^^^^^^
To view the DNS resource records for a particular zone, you can double-click the zone, or select it and then click :guilabel:`Open` on the page toolbar or the row menu :guilabel:`...`. A list of the zone's resource records is displayed. For more information about DNS resource records, see :ref:`dns-records`.

Creating Zones
^^^^^^^^^^^^^^^

**To create a new DNS zone**:

1. Click :guilabel:`Create` on the DNS page toolbar.

2. Select the zone type. For more information about zone types, see :ref:`dns-zone-types` above.

   .. image:: ../../images/dns-zone-create.png
      :width: 65%
      
3. Follow the steps of the wizard. The number of steps will vary based on the zone type and the configuration of Micetro.

.. tip::
   You can specify the network address in CIDR format, such as 192.168.1.0/24. Micetro will automatically convert this CIDR format into a reverse zone name (0.168.192.in-addr.arpa.). 

Primary Zone
"""""""""""""
1. Use the server filter to select the DNS server where the zone should be created. If xDNS profiles have been created on the instance, the zone can be added directly to an xDNS profile in the first step of the wizard.

   .. image:: ../../images/zone-flow-filter-all.png
      :width: 65%

2. Optional. You can select server(s) to host an identical copy of the zone. The zone files from the primary DNS are synced to the secondary DNS through a zone transfer.

   .. image:: ../../images/zone-flow-redundancy.png
      :width: 65%

3. If **custom properties** have been defined for zones, they can be edited in a separate step. Custom properties provide additional attributes that enhance the ability to understand, search, and sort zone data in Micetro. 

   .. image:: ../../images/zone-flow-custom-properties.png
      :width: 65%

   Custom properties appear as individual columns on the DNS page for each zone.

4. On the **Zone Options** page, you can specify which DNS servers will be notified of changes to the zone and to which servers it is allowed to perform zone transfers. 

   .. image:: ../../images/zone-flow-options.png
      :width: 65%

5. If DNS **Folders** have been configured in Micetro, the new zone can be added directly to a folder. DNS folders are a neat way to organize zones in Micetro to have a better overview and manageability. For more information about folders, see :ref:`folder-management`.

   .. image:: ../../images/zone-flow-folder.png
      :width: 65%   
      
6. The **Summary** step summarises the configuration for the new zone before it is created. To edit the configuration, go to the respective page of the wizard and make the desired changes.

Secondary Zone
"""""""""""""""
When creating a secondary zone, you need to specify the zone name and either the IP address or hostname of the primary servers that hold the zone you are creating a secondary copy for.

Stub Zone
"""""""""""
When creating a stub zone, you must provide the zone name and one or more primary servers for the zone being copied. You can use the toggle control above the text box to turn the address resolution on and off.


Static-stub Zone
""""""""""""""""
When creating a static-stub zone, you must provide the zone name and a target DNS server. To configure how to resolve the zone, specify either hostnames or IP addresses on the zone options page.
  
Forward zone
""""""""""""
Forward zones are similar to stub zones. You must provide a zone name and a list of Forward servers as well as at least one target server for where to create the zone.

Options Template Zone
"""""""""""""""""""""""
The template zone option is available only if an AuthServe DNS server is connected to Micetro.

Deleting Zones
^^^^^^^^^^^^^^^

**To delete a zone from one or more servers**:

1. Select the zone(s) you want to delete.

2. Select :guilabel:`Delete zone` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.    
      
3. The Delete Zone dialog box opens, showing each zone you selected and a list of servers that currently serve that zone. The zone(s) you selected will be deleted from every server that is selected on this list. To keep the zone on a particular server, clear the checkbox for that server.

4. Click :guilabel:`Delete`. The zone is removed from the servers.


Migrating Zones
^^^^^^^^^^^^^^^

You can migrate one or more zones from one server to another, including all data in the zone.

**To migrate a zone**:

1. Select the zone you want to migrate.

2. Select :guilabel:`Migrate zone` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.  
   
3. The Migrate Zone(s) dialog box opens.

4. Select the DNS service you want to migrate the zone to. 

5. If you want to remove the zone from the current service, select the :guilabel:`Remove original zone` checkbox. If the checkbox is left unselected, a copy of the zone is left on the current service.


.. _ad-preferred-servers:

Editing Preferred Servers
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::
  This option is only available when working with Active Directory (AD) integrated zones. For more information about AD, see :ref:`active-directory`.

DNS administrators can specify the server to use when opening an AD-integrated zone, as well as the order of servers to use if the first preferred server becomes unavailable.

1. In the filtering sidebar, select the :guilabel:`AD Integrated`.

2. Select the zone(s) you'd like to set preferred servers for.

3. Select :guilabel:`Edit preferred servers` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.
   
4. Arrange the order of your servers into the preferred order. The server on the top of the list is tried first, then, if that server is unavailable, the second, and so on.

5. Click :guilabel:`Save`.

.. warning::
  If you selected multiple zones, they might have different settings for preferred servers. Saving the configuration will overwrite the previous settings on all selected zones.


Editing Zone Properties
^^^^^^^^^^^^^^^^^^^^^^^^

You can click :guilabel:`Edit Properties` on the toolbar to edit custom properties that have been configured for the selected zones.


Promoting Secondary Zones
^^^^^^^^^^^^^^^^^^^^^^^^^
The Promote Zone feature makes it possible to change a secondary zone to a primary zone. This might be necessary in emergencies, for example, if the primary zone becomes unavailable for an extended period of time. This feature is only available for DNS Administrators.

When a secondary zone is promoted, the following actions are performed:

* Micetro checks whether the most recent copy of the zone is found in its internal database or on the server hosting the secondary zone, and uses the more recent copy.

* The server hosting the secondary zone is configured so that the zone is saved as a primary zone on the server.

* The zone history and access privileges from the old primary zone are applied to the new primary zone.

* The configurations of other instances of the secondary zone are modified so that they will get the updates from the new primary zone.

**To promote a secondary zone to a primary zone**:

1. Select the secondary zone.

2. Select :guilabel:`Promote to primary` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.  
   
3. Click :guilabel:`Save` to continue, or :guilabel:`Cancel` to discontinue the process.


View History
^^^^^^^^^^^^^
The :guilabel:`View history` option on the :guilabel:`Action` menu opens the History window that shows a log of all changes that have been made to the zone, including the date and time of the change, the name of the user who made it, the actions performed, and any comments entered by the user when saving changes to objects. See :ref:`view-change-history`.


Editing Zone Options on BIND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
For BIND servers you can configure individual settings for a specific zone on each server.

**To edit zone options for a BIND zone**:

1. Select the zone(s) for which you want to edit the options.

2. Select :guilabel:`Edit zone options` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.

3. By default, the **Show inherited options** checkbox is selected. When selected, any inherited options that are applied to the selected zone are displayed. Inherited options are settings that are propagated from higher-level configurations, either the server or view. You can edit the inherited options by selecting :guilabel:`Override` or select the specific option you wish to modify from the dropdown list.

   .. image:: ../../images/zone-options-bind.png
      :width: 65%   

4. In the configuration interface that appears, adjust the settings according to your requirements. To add another entry, click :guilabel:`Add`.

   * **Query restrictions** (primary, secondary, stub, static-stub): Specifies which hosts or IP addresses are allowed to query the DNS zone.
   * **Transfer restrictions** (primary, secondary): Transfer restrictions can specify which IP addresses or hosts are permitted to request zone transfers.
   * **Update restrictions** (primary):  Control who is allowed to dynamically update the DNS records within the zone. 
   * **Update notifications** (primary, secondary): Specify which servers should receive notifications when changes are made to the zone's DNS records. When dynamic updates occur, servers listed in the update notifications receive notifications to ensure they can synchronize their records accordingly.
   * **Response policy** (primary, secondary): Specify whether the zone is a response policy zone.
   * **Query forwarding** (forward): Determines how BIND behaves when forwarding queries for the forward zone. The **First - resolve if forwarding fails** option provides a fallback to local resolution if forwarding fails, while the **Only - fail if forwarding fails** option strictly relies on forwarding and does not attempt local resolution if forwarding fails.

5. Click :guilabel:`Save` when you're done.
  

Raw Configuration of Zone Options (BIND)
""""""""""""""""""""""""""""""""""""""""
The :guilabel:`Raw Configuration` option is intended for experienced users who have a good understanding of DNS configurations. There you can access and modify raw configuration files directly, granting you control over zone options not available through the GUI.
