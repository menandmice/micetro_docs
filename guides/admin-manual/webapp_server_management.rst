.. meta::
   :description: How to manage DNS and DHCP servers in the Micetro by Men&Mice Web Application
   :keywords: DNS servers, DHCP servers, DNS server management, DHCP server management

.. _webapp-server-management:

Service management
=================
Service Management is the place to connect DNS/DHCP and IPAM services that you want to orchestrate with Micetro. These services can be hosted on-premises, on appliances, or in the cloud. Services that have been connected are listed in a table in Service Management in the admin workspace.

1. Select :guilabel:`Admin` on the top navigation bar.

2. Click :guilabel:`Service Management` on the menu bar at the top of the admin workspace.

   .. image:: ../../images/dns-context-10.5.png      
   
   * By default, all services configured in the system are shown.

   * In the left pane you can filter the list by type of service or provider.
   
   * In the right pane, the properties of a selected service are shown.

.. note:: 
   The Micetro web interface does not yet provide full management of IPAM services. Therefore they are not listed here, but you can still enable IPAM services by using the :guilabel:`Add service` function. 

Depending on the user permissions and available license keys, DNS and DHCP services and functions can be disabled or hidden.

For DNS and DHCP administrators, it is recommended to be members of the built-in  **DNS Administrators** and/or **IPAM Administrators** roles. To manage Appliances, it is recommended to be a member of the built-in **Administrators** role. For more information on Micetro's granular role-based access controls, see :ref:`access_control`. 

When not using the built-in roles, users need to be members of a role with the following permissions. Note that other permissions could be needed to manage the services fully.

To manage DNS services

Administer DNS servers

To manage DHCP services

Administer DHCP servers

To manage cloud services

Access to manage clouds

To manage appliance services

Administer appliances

Service Management actions
-------------------------

Any actions that can be performed on a selected server can either be accessed in the :guilabel:`Actions` above the list or by clicking the :guilabel:`Row menu (...)` button that appears when you hover over the right hand side of a row.

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
