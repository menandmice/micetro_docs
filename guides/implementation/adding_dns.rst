.. _adding-dns:

Adding DNS servers
==================

After installation, Micetro contains no data about DNS servers. These need to be added through the Management Console.

DNS servers require :ref:`install-controllers` and need to be added using their fully qualified names (such as ``dns1.europe.ad.mmdemo.local``).

.. note::
  Servers in Microsoft Active Directory environments can be added without installing a server controller. See :ref:`agent-free-dns-dhcp`.

To add a new DNS server the administrator will select :guilabel:`File --> New --> DNS Server`.

1. Log in to the Web Application

2. Select the :guilabel:`Admin` tab on the top of the screen

3. Click :guilabel:`Add DNS server` in the interface

.. image:: ../../images/add-dns.png
  :width: 90%
  :align: center

4. The *Add DNS server* modal will display.

5. Fill in the server’s FQDN. Optionally, you can specify its IP address (IPv4 or IPv6).

6. Select the server type from the dropdown.

.. image:: ../../images/add-dns-modal.png
  :width: 60%
  :align: center

7. Click :guilabel:`Confirm`.

If the entered details are correct and the server is accessible, it will show up in the DNS view.

For further details on DNS management, refer to :ref:`dns`.

DNS servers in Active Directory integrated zones
------------------------------------------------

The DNS agent will use two different methods to retrieve information from Microsoft AD integrated zones.  First it will do a zone transfer (both full and incremental) to get the latest records for the zone and then it will use Microsoft APIs to get detailed information for individual records.  Due to this it is important that the DNS agent is allowed to do a zone transfer from the local server.

.. image:: ../../images/add-dns-arch-old.png
  :width: 55%
  :align: center

The DNS agent on the DNS server must be able to transfer AD integrated zones from the local DNS server.

There is a global setting in that allows Micetro to adjust the zone transfer settings for dynamic or AD integrated zones. It is enabled by default but the administrator can change this setting by selecting :guilabel:`Tools --> System Settings` in the Management Console, and switching to the :guilabel:`DNS` tab.
