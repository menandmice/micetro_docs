.. meta::
   :description: Adding DNS servers (Microsoft DNS, BIND, Azure DNS, AWS Route 53, NS1, Akamai Fast DNS, PowerDNS, etc.) to Micetro
   :keywords: DNS, Micetro, DNS management, Active Directory DNS

.. _adding-dns:

Adding DNS Service
==================

After installation, Micetro contains no data about DNS servers. These need to be added.

DNS servers require :ref:`install-controllers` and need to be added using their fully qualified names (such as ``dns1.europe.ad.mmdemo.local``).

.. note::
  Servers in Microsoft Active Directory environments can be added without installing an agent. See :ref:`agent-free-dns-dhcp`.

Services are managed on the **Admin** page in the :guilabel:`Service Management` section. There you select :guilabel:`Add Service` to add a new server.

For further details, see :ref:`adding-service` in the Admin Guide.

DNS Servers in Active Directory Integrated Zones
------------------------------------------------

The DNS agent will use two different methods to retrieve information from Microsoft AD integrated zones.  First it will do a zone transfer (both full and incremental) to get the latest records for the zone and then it will use Microsoft APIs to get detailed information for individual records.  Due to this it is important that the DNS agent is allowed to do a zone transfer from the local server.

.. image:: ../../images/add-dns-arch-old.png
  :width: 55%
  :align: center

The DNS agent on the DNS server must be able to transfer AD integrated zones from the local DNS server.

