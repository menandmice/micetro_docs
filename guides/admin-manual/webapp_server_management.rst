.. meta::
   :description: How to manage DNS and DHCP servers in the Micetro by Men&Mice Web Application
   :keywords: DNS servers, DHCP servers, DNS server management, DHCP server management

.. _webapp-server-management:

Service Management
===================
Service Management is the place for connecting and orchestrating DNS, DHCP, and IP Address Management (IPAM) services with Micetro. Your services can be hosted on-premises, deployed on specialized appliances, or reside in the cloud. Connected services are displayed on the **Service Management** tab on the Admin page.

To access Service Management:

1. Select :guilabel:`Admin` on the top navigation bar.

2. Click the :guilabel:`Service Management` tab in the upper-left corner.

   .. image:: ../../images/dns-context-10.6.png      
       :width: 65%
   |
   * By default, all services configured in the system are shown.

   * In the left pane, you can filter the list by type of service or provider.
   
   * In the right pane, the properties of a selected service are shown.

.. note:: 
   The Micetro web interface does not yet provide full management of IPAM services. Therefore they are not listed here, but you can still enable IPAM services by using the :guilabel:`Add service` function. 

User Permissions and Access Management
---------------------------------------
Depending on user permissions and available license keys, DNS and DHCP services and functions can be disabled or hidden.

Micetro has a granular role-based :ref:`access-control` system. For DNS and DHCP administrators, it is recommended to be members of the built-in **DNS Administrators** and/or **IPAM Administrators** roles. To manage Appliances, it is recommended to be a member of the built-in **Administrators** role. 

When not using the built-in roles, users need to be members of a role with the following permissions. Note that additional permissions might be necessary for comprehensive service management. For more information on Micetro's granular role-based access controls, see :ref:`access-control`. 

* To manage DNS services: **Administer DNS servers**

* To manage DHCP services: **Administer DHCP servers**

* To manage cloud services: **Access to manage clouds**

* To manage appliance services: **Administer appliances**

Supported Platforms
-------------------
Micetro supports the following DNS and DHCP platforms

* DNS

  * AuthServe

  * AWS Route 53 (cloud)

  * Azure DNS (cloud)

  * BIND

  * DynDNS (cloud), (Note DynDNS is EOL May 31st 2023)

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
  
Micetro Agents
--------------
To handle communication between Micetro and the external service, an Agent is needed. Depending on the type of service and if it’s on-premises or cloud, the agent is either installed on the respective machine, on the machine running Men&Mice central or, in some cases, on any machine that is in the same domain as the DNS/DHCP servers. A single agent can handle communication with multiple servers. For more information on agents and how to install them, see :ref:`install-controllers`.

.. note::
   When managing Microsoft DNS servers on remote computers with the DNS Server Controller, some actions for static zones may not be available:

   * Disable resource record

   * Enable resource record
   
   * View and edit record comments

   * Disable zone

   To perform these actions, you need to install the DNS Agent on the server and use that connection when adding the server.
   
.. _adding-service:

Adding a Service
----------------
You must have the permission to administer DNS to add a new service to Micetro.

Adding a new service is either a two or three step process, depending on the type of service being added.

To add a service:

1. On the :guilabel:`Service Management` tab, click :guilabel:`Add Service`. The Add Service wizard opens.

    .. image:: ../../images/add-servive-dialog.png
      :width: 65%

2. Choose the platform you want to use. You'll see a list of options to choose from, based on your license keys. You can use the **DNS**, **DHCP**, and **IPAM** filters at the top to narrow down the list. You can also use the search box to search for the right service.

3. Select an agent: 

    .. image:: ../../images/add-kea.png
      :width: 65%

   * This step is skipped for cloud services.

   * For ISC BIND and ISC DHCP this step is skipped, as the agent must be installed on the service host.

   * With the exception of the service types mentioned above, the agent can be installed on the Micetro Central host, on the Service host, or in the case of MS DNS/DHCP, ISC Kea, and Cisco IOS on a different host. If you have already added a service of this type before, you have the opportunity to either select from existing agents or create a new agent. A single agent can be used to manage multiple connections.

    .. image:: ../../images/add-kea-2.png
         :width: 65%
   |
    * In the case of **AuthServe**, you can select from a list of available agents that were registered in the installation process.  
        
    .. image:: ../../images/add-authserve.png
         :width: 65%

    * For AuthServe git you can also register a new agent on the :guilabel:`New Agent` tab. Enter a hostname for the agent and, optionally, the IP address. If the hostname is not resolvable, an IP address is needed here.

4. Add service:
  * Cloud services: Each service type has its set of credentials in addition to the optional service name.

  * On-premises services

    * Provide the hostname or IP address of the service/server.

    * AuthServe uses channel as the connection string. Channel name is mapped to a host name in a configuration file on the server. ‘ansp' is the default channel name which maps to localhost. To select a different host name the syntax is ``"1.2.3.4#<someseceret>"``. Refer to AuthServe documentation for details.

Editing Services
-----------------
Depending on the service, you can change the name and/or custom properties for the service. For example, if you need to refer to the service by another name or if you are connecting to the service by an IP Address and the IP Address has changed. 

To edit a service:

1. Locate the service you want to edit. 

2. Select the service, and then select :guilabel:`Edit service` on the :guilabel:`Action` menu. You can also double click the service.

3. Make the necessary changes. Click :guilabel:`Confirm` to save the changes.

Editing the Raw Configuration on BIND Servers
-----------------------------------------------
For BIND servers, DNS Administrators can access and modify raw configuration files directly. This is useful for making changes to the server and zone options that are not available through the GUI.

To edit BIND configuration files:

1. Locate the BIND server that you want to configure.

2. Select :guilabel:`Edit configuration` on the :guilabel:`Action` menu. You can also access this option on the Row menu :guilabel:`...`. 

    .. image:: ../../images/bind-raw-config.png
            :width: 65%
|
   
   * The various configuration files assoicated with the BIND server are available on the :guilabel:`File` drop-down list. From this list, select the specific configuration file that you want to modify. Configuration files may represent different aspects of the BIND server.

   * If you're looking to make changes to specific settings within the selected configuration file, you can use the search box. Enter keywords or terms related to the settings you wish to modify.

3. Make your edits, and click :guilabel:`Save` when you are done.

Other Service Actions
----------------------
Depending on the service, you can modify both the service name and its custom properties.
Any actions applicable to a selected server can either be accessed on the :guilabel:`Actions` menu located above the list, or by clicking the row menu :guilabel:`...` button that appears when you hover over the right hand side of a row.

.. csv-table::
  :header: "Action", "Description"
  :widths: 15, 85

  "Attach service", "Attaches a previously detached server/service." 
  "Detach server", "Detaches or disables the server/service. When a server is detached, it is not synchronized with Micetro and excluded from various checks. When a server is detached, it is greyed out in the service view grid. The server can be attached again for it to be part of the server synchronization again."
  "Synchronize", "Triggers synchronization of zones and records or scopes."
  "Remove service", "Removes the selected server/service from Micetro. This option is only available with the Administrator account."
  "Access", "Shows which roles have access to the service and what actions they are authorized to perform. For more information about how to manage object access, see :ref:`acl-object-access`."
  "View history", "Allows you to view history for the selected server/service."

Service States
--------------
The list of services shows an indicator of the state of the individual services configured in the system.
    
The indicators can refer to either the Server Controller (see :ref:`install-controllers`) running on the DNS/DHCP server, or the DNS/DHCP server service itself. 

Use the following table for more information on the indicators:

.. csv-table::
    :header: "Indicator", "Component", "Explanation"
    :widths: 10, 10, 80

    "Unknown", "Controller", "The status of the DNS/DHCP Server Controller is unknown."
    "OK", "Server, Controller", "The DNS/DHCP Server Controller and service are both OK."
    "Unreachable", "Controller", "The DNS/DHCP Server Controller is offline or otherwise unreachable."
    "Out of date", "Controller", "The DNS/DHCP Server Controller has a different version than Central."
    "Updating", "Controller", "The DNS/DHCP Server Controller is being updated."
    "Uninitialized", "Server", "The DNS/DHCP server is uninitialized and needs to be manually initialized."
    "Detached", "Server", "The DNS/DHCP server has been detached without removing it from Micetro."
    "Service Down", "Server", "The DNS/DHCP server is down and not responding to queries."
    "Service Impaired", "Server", "The DNS/DHCP server is running but impaired. [1]_ "

.. [1] In Kea HA configurations. See :ref:`dhcp-kea-ha`.

DHCP Services
--------------
For detailed information about the different DHCP platforms and their configurations, refer to:

.. toctree::
  :maxdepth: 1

  admin_dhcp_windows
  admin_dhcp_kea
  admin_dhcp_isc
  admin_dhcp_cisco
