.. meta::
   :description: How to manage DNS and DHCP servers in the Micetro by Men&Mice Web Application
   :keywords: DNS servers, DHCP servers, DNS server management, DHCP server management

.. _webapp-server-management:

Service management
=================

DNS and DHCP servers are managed in the Service Management area of the Admin workskpace:

1. Select **Admin** on the top navigation bar.

2. Click **Service Management** on the menu bar at the top of the admin workspace.



.. image:: ../../images/dns-context.png
  :width: 90%
  :align: center

* By default, all services configured in the system are shown.

* In the left pane you can choose from viewing DNS services, DHCP services, or Appliances (if configured in the system).

* In the right pane, the properties of a selected server are shown. Any custom fields defined will also be displayed there.

Service Management actions
-------------------------

Any actions that can be performed on a selected server can either be accessed in the :guilabel:`Actions` above the list or by clicking the Row menu **...** button that appears when the pointer rests on the right hand side of the row.

.. csv-table::
  :header: "Action", "Description"
  :widths: 15, 85

  "Add DNS server", "Adds a DNS server to the system."
  "Add DHCP server", "Adds a DHCP server to the system."
  "Add appliance", "Adds an Appliance to the system."
  "Edit DNS server", "Allows to edit the server name and server properties."
  "Attach server", "Attaches a previously detached server."
  "Detach server", "Detaches or disables the server. The server can be attached again for it to be part of the server synchronization again."
  "View history", "Allows to view history for the selected server."
  "Remove server", "Removes the selected server from the system."

Server states
-------------

See :ref:`server-states`.
