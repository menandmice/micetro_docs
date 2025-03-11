.. meta::
   :description: Overview, analysis, viewing, and deleting of DNS zones in Micetro
   :keywords: DNS zones, DNS servers

.. _dns-zones:

DNS zone types
==============

.. |controls| image:: ../../images/console-dns-zones-zone-controls-icon.png
.. |analyze| image:: ../../images/console-analyze.png

.. note::
   This information applies to the Micetro Web Application. For information about DNS zone management in the M&M Management Console, see :ref:`console-dns-zones`.

By default, the **DNS** page displays all primary zones in the system regardless of authority. 

.. image:: ../../images/DNS-Micetro.png
   :width: 90%
|
The leftmost sidebar offers several options for filtering and organizing zones. At the bottom of the sidebar, you can select what to display: **Menu**, **Folders**, and **DNS services**. 


.. image:: ../../images/sidebar-tabs.png
   :width: 65%

* **Menu** provides the most commonly used filtering options for zones, such as zone types, favorites, and reverse zones.

* **Folders** allow you to organize zones and filter queries into folders. For more information about folder management, see :ref:`folder-management`.

* **DNS services** allows you to view zones by server/service. This can be useful if you have multiple DNS services and want to view the zones associated with each one separately.

Micetro will remember your current view selection when you navigate away from the DNS page and return to it later.

.. _dns-zone-types:

Zone types
-----------
This table shows the zone types supported by Micetro:

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
 
Zone contents
^^^^^^^^^^^^^
For each zone in the **DNS** data grid, you can view its properties, details, and resource records.

The Inspector on the right side of the screen provides an overview of the Start of Authority (SOA) record and properties of the selected zone. 

.. image:: ../../images/DNS-zone-contents-Micetro-10.5.png
   :width: 65%
      
Click the header of the desired section to collapse or expand the section.

SOA records
"""""""""""
An SOA record contains the following data fields. To edit SOA information, click the |ico1| in the section header.

.. |ico1| image:: ../../images/edit-pencil-icon.png
   :height: 3ex

.. csv-table:: 
  :header: "Field", "Description"
  :widths: 15, 75

  "Primary", "The name of the server that serves as the primary server for the zone."
  "Hostmaster", "The email address of the individual responsible for the zone, formatted with a period (.) in place of the @ symbol. For example, hostmaster@example.com should be entered as hostmaster.example.com. The username must not contain a literal dot (.). Refer to RFC 1912 'Common DNS Operational and Configuration Errors', Section 2.2 for additional information."
  "Serial", "A ten-digit number representing the year, month, day, and a two-digit daily revision number. It is actually any integer between 0 and approximately 4 billion, but the aforementioned format is the standard convention."
  "Refresh", "The interval in seconds at which secondary servers verify if their zone files are up to date by checking the serial number against the primary server. The standard setting for this field is 28800 seconds, or every 8 hours."
  "Retry", "The time a secondary server will wait to attempt reconnection with the primary zone after a failed attempt. The standard setting is 7200 seconds, or every 2 hours."
  "Expire", "The duration a secondary server will continue to serve a zone following the last successful contact with the primary name server. After expiration, the secondary server stops providing information about the zone, considering it unreliable. The standard expiration time is 604800 seconds, or 1 week."
  "Neg. caching", "This field is only available when connected to a BIND server. It specifies how long a server will cache the knowledge negative reponses. The standard setting is 86400 seconds, 24 hours."


Resource records
""""""""""""""""
To view the DNS resource records for a particular zone, double-click the zone in the **DNS** data grid or select it and then click :guilabel:`Open` on the page task bar or the Row :guilabel:`...` menu. A list of the zone's resource records is displayed. For more information about DNS resource records, refer to :ref:`dns-records`.

View history
^^^^^^^^^^^^^
Select the :guilabel:`View history` option on the :guilabel:`Action` menu to open the **History** dialog, which provides a log of all changes that have been made to the zone, including the following information:

* Date and time of the change
* Name of the user who made the change
* Description of the actions performed
* Comments entered by the user when saving changes to objects

For more information, refer to :ref:`view-change-history`.
