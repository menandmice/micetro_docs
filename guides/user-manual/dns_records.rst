.. _dns-records:

DNS resource records
====================

Overview
--------

Each zone contains DNS resource records that define how requests are processed or delegated by the zone. The Zone tab provides a spreadsheet-like interface that makes it easy to view, edit, and manipulate information within a zone.

.. image:: ../../images/console-dns-records.png
  :width: 80%
  :align: center

Types of Resource Records
-------------------------

There are varieties of resources records that actively affect zones, as well as several informational records that can be used to provide supporting data about a zone. The primary record types are described in the table below.

+-------------+-------------------------------------------------------------------------------------------+
| Record type | Description                                                                               |
+=============+===========================================================================================+
| NS          | The Name Server record is used to list a name server for this zone. NS records state the  |
|             | domain name of the zone's name servers. The name of an NS record is the fully qualified   |
|             | domain name of a zone. Every zone must have at least one NS record with the same name     |
|             | as the zone itself.                                                                       |
|             |                                                                                           |
|             | **Example:**                                                                              |
|             | +---------+-----------+-----------------+                                                 |
|             | | Name         | Type | Data            |                                                 |
|             | +==============+======+=================+                                                 |
|             | | example.com. | NS   | ns1.example.com |                                                 |
|             | +--------------+----+-------------------+                                                 |
+-------------+-------------------------------------------------------------------------------------------+
