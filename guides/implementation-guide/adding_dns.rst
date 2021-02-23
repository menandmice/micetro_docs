.. _adding-dns:

Adding DNS servers
******************

After installation, the Men&Mice Suite contains no data about DNS servers. These need to be added through the Web Application.

.. note::
  When adding a Member Server to a Server Group, the (read-only) DNS server object is added at the same time. DNS servers that are meant to be part of Server Groups must not be added manually here.

1. Log in to the Web Application
2. Select the :guilabel:`Admin:` tab on the top of the screen
3. Click :guilabel:`Add DNS server` in the interface

.. image:: ../../images/add-dns.png
  :width: 60&
  :align: center

4. The *Add DNS server* modal will display.
5. Fill in the server’s FQDN. Optionally, you can specify its IP address (IPv4 or IPv6).
6. Select “BIND” as server type from the dropdown.

.. image:: ../../images/add-dns-modal.png
  :width: 30&
  :align: center

7. Click :guilabel:`Confirm`.

If the entered details are correct and the server is accessible, it will show up in the DNS view.

For further details on DNS servers, refer to the Operations Guide.
