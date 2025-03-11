.. meta::
   :description: Adding DNS servers (Microsoft DNS, BIND, Azure DNS, AWS Route 53, NS1, Akamai Fast DNS, PowerDNS, etc.) to Micetro
   :keywords: DNS, Micetro, DNS management, Active Directory DNS

.. _adding-dns:

Adding a DNS service
====================

After installation, Micetro contains no data about DNS servers. These need to be added.

DNS servers require :ref:`install-controllers` and need to be added using their fully qualified names, such as ``dns1.europe.ad.mmdemo.local``.

.. note::
  Servers in Microsoft Active Directory environments can be added without installing an agent. Refer to :ref:`agent-free-dns-dhcp`.

Services are managed on the :guilabel:`Service Management` tab of the  **Admin** page. To add a new server, select :guilabel:`Add Service` on the task bar.

For more information, refer to :ref:`adding-service` in the :ref:`Admin Guide<admin-overview>`.

DNS servers in Active Directory-integrated zones
------------------------------------------------
The DNS Agent uses two different methods to retrieve information from Microsoft Active Directory (AD)-integrated zones.

1. First, it performs a zone transfer (both full and incremental) to get the latest records for the zone.

2. Then, it uses Microsoft APIs to get detailed information for individual records.

As a result, it's important that the DNS Agent is allowed to perform a zone transfer from the local server. The DNS Agent on the DNS server must be able to transfer AD-integrated zones from the local DNS server.

  .. image:: ../../images/add-dns-arch-old.png
    :width: 55%
    :align: center
