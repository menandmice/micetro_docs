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

For DNS and DHCP administrators, it is recommended to be members of the built-in  **DNS Administrators** and/or **IPAM Administrators** roles. To manage Appliances, it is recommended to be a member of the built-in **Administrators** role. 

When not using the built-in roles, users need to be members of a role with the following permissions. Note that other permissions could be needed to manage the services fully. For more information on Micetro's granular role-based access controls, see :ref:`access_control`. 

* To manage DNS services:

   **Administer DNS servers**

* To manage DHCP services:

   **Administer DHCP servers**

* To manage cloud services:

   **Access to manage clouds**

* To manage appliance services:

   **Administer appliances**

Supported Platforms
-------------------
Micetro supports the following DNS and DHCP platforms

* DNS

  * AuthServe

  * AWS Route 53 (cloud)

  * Azure DNS (cloud)

  * BIND

  * DynDNS (cloud), (Note DynDNS is EOL March 31st 2023)

  * Edge DNS (cloud)

  * Microsoft DNS

  * NS1 (cloud)

  * Unbound (deprecated, new services cannot be added)

  * Men&Mice Appliance

  * Men&Mice caching Appliance

* DHCP

  * Cisco IOS

  * ISC DHCP

  * Kea

  * Microsoft DHCP

  * Men&Mice Appliance
  
Micetro agents
--------------
To handle communication between Micetro and the external service, an Agent is needed. Depending on the type of service and if it’s on-premises or cloud, the agent is either installed on the respective machine, on the machine running Men&Mice central or, in some cases, on any machine that is in the same domain as the DNS/DHCP servers. A single agent can handle communication with multiple servers. Further information on agents and how to install them can be found here. (Link to Micetro Agents page)

.. note::
   When managing Microsoft DNS servers on remote computers with the DNS Server Controller, some actions for static zones may not be available:

   * Disable resource record

   * Enable resource record
   
   * View and edit record comments

   * Disable zone

   To perform these actions, you need to install the DNS Agent on the server and use that connection when adding the server.
