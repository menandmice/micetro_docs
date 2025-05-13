.. meta::
   :description: Architecture design of Micetro
   :keywords: Micetro, system design, hardware requirements, DDI components

.. _architecture:

Architecture
============
Micetro is a non-destructive, software-defined overlay for managing DNS, DHCP, and IPAM in diverse network environments.

.. image:: ../../images/Micetro-Mockup-1.png
  :width: 50%
  :align: center

* Non-destructive: Micetro does not interfere with network structure or service integrity.

* Software-defined: Micetro can be deployed using virtual machines (no hardware component is necessary) and uses a single-layer API for orchestration.

* Overlay: Micetro is capable of managing multiple DNS and DHCP services dynamically, on-premise, in data centers, or in cloud platforms.

----

Components
----------
Micetro consists of the following components:

Micetro Central
  The server component of Micetro, running the orchestration logic for all configured services. *Can be configured for high availability on certain platforms.*

Data storage
  Accumulating and organizing data from connected services. *Can be configured for high availability on certain platforms.*

Micetro Agent(s)
  Minimal-footprint service handling communication between Micetro Central and the connected services. *Some services can be connected natively to Central and don't need an agent.*

Web Application
  Users manage connected services through a browser-based user interface.

.. image:: ../../images/micetro-mockup-2.png
  :width: 100%
  :align: center
|
.. note::
  All communications between the Micetro components are encrypted.

.. _about central:

Micetro Central
^^^^^^^^^^^^^^^

.. note::
  At least one copy of Micetro Central needs to be installed.


Through the connected database, Micetro Central stores all data, including user-specific and centrally stored information.

Micetro Central handles user authentication and contains information about access privileges for the user. If the Micetro IP Address Management (IPAM) page is activated, Micetro Central is responsible for the management and allocation of IP addresses.

Micetro Central listens on TCP port ``1231``. Fore more information, refer to :ref:`firewall-ports`.

Use this table as a guide for allocating resources to ensure smooth operation of Micetro:

.. csv-table::
   :header: "Size of environment","Number of objects", "Hardware guidelines (per Central instance)"
   :widths: 20, 40, 40
 
   "**Small to medium**","**Zones**: fewer than 5000; **IP addresses**: fewer than 5000; **Subnets**: fewer than 1000", "Central can be run on a server alongside other services, such as on a DNS/DHCP server or an Agent [1]_"
   "**Medium to large**","**Zones**: fewer than 1000; **IP addresses**: fewer than 50000; **Subnets**: fewer than 10000", "4 CPU cores, >=2 GHz, 8 GB of memory, 50 GB disk space"
   "**Large enterprises and service providers**","**Zones**: tens of thousands; **IP addresses**: millions; **Subnets**: hundreds of thousands",">=8 CPU cores, >2 GHz, >=16 GB of memory, 100 GB disk space"


.. [1] In smaller installations, Micetro Central can be installed on one of the DNS or DHCP servers, as it will not require much resources. More resources are needed as the managed environment gets larger.

..
  If the organization is using Active Directory (AD) and wishes to use AD user authentication, Micetro Central must be installed on a Microsoft Windows member server in the domain. All users in that domain, that forest, and trusted forests, will be able to authenticate in Micetro, given that they have been granted access in Micetro. As the other Micetro components (DNS Server Controller and DHCP Server Controller) can be installed on the DNS and DHCP servers, Micetro can manage DNS and DHCP servers that reside in forests where there is no trust between the forest where Central is installed and DNS/DHCP is installed. See :ref:`active-directory` for more information.
  .. image:: ../../images/central-arch-old.png
    :width: 80%
    :align: center

Additional instances of Micetro Central can also be installed as a "cold standby". With Micetro's embedded SQLite data storage, the database is periodically copied from the active Central server to the cold standby and, if the active server becomes unavailable, the Central service on the cold standby can be activated. If Central is configured with a different database backend, the database needs its own high availability setup for redundancy.

Refer to :ref:`central-ha` for information about running multiple Micetro Central instances for High Availability.

----

Data storage
^^^^^^^^^^^^

.. note::
  In case of conflict, the authoritative data is always the data source itself (e.g., the DNS or DHCP server).

By default, Micetro Central uses an embedded :ref:`central-sqlite` database. The embedded database is suitable for small to medium environments but larger environments should use a more robust database backend. Currently supported database platforms are MS SQL and PostgreSQL server.

Information on how to use MS SQL or PostgreSQL as the database for Micetro Central can be found in the :ref:`central-database` section.

.. note::
  Deploying Micetro through the Azure Marketplace will use Azure SQL as its database backend automatically. Refer to :ref:`installation-azure` for details.

----

Micetro Agents
^^^^^^^^^^^^^^

The Micetro agents are minimal-footprint services running on the DNS/DHCP server or alongside Micetro Central, and facilitate the communication between the connected service and Central.

.. _about-dns-controller:

DNS Agents
""""""""""
The Micetro DNS Agent is used to control the DNS server and must be installed on each DNS server machine you want to control. The Micetro DNS agent reads and writes zone data and option files, and sends commands to the DNS server. The Micetro DNS agent listens on TCP port ``1337``.

(Unix) BIND DNS environment
  The DNS Agent is installed on each DNS server that is to be managed.

(Microsoft) AD environment
  The DNS Agent can be installed on some of the DNS servers or they can all be managed agent-free. If they are to be managed agent-free, the DNS Agent is typically installed on the machine running Micetro Central. When adding the DNS server, the option to add the server as "Microsoft Agent-Free" is selected. Refer to :ref:`agent-free-dns-dhcp`.

  The DNS Agent must be running as a user that has the necessary permissions.

  If you plan to install the DNS Agent on some of the DNS servers in a Microsoft AD environment, and the environment is a pure AD environment (meaning that *all* zones are AD integrated), the DNS Agent is typically installed on two DNS servers in each AD domain. Micetro will read and write DNS updates to the first server from each AD domain, but if the first server becomes unavailable it will failover to the second server.

  For more information, refer to :ref:`ad-preferred-servers`.

Other environments
  The Micetro agent service can also communicate with other DNS platforms, such as PowerDNS. refer to :ref:`generic-dns-controller` for more information.

.. note::
  The Micetro DNS Agent communicates with the DNS server using RNDC (BIND) or DNSP/RPC (Windows Server 2008 and above).

.. _about-dhcp-controller:

DHCP Agents
"""""""""""
The Micetro DHCP Agent is used to control the DHCP server. The DHCP agent listens for connections from Micetro Central on TCP port ``4151``.

ISC DHCP
  A copy should be installed on each DHCP server machine.

MS DHCP
  A copy can be installed on each DHCP server machine, or in certain circumstances it can be installed on another server and connected to the DHCP service over the network. For this remote DHCP management to work, the DHCP Agent must be installed on a Windows server and must run under an account that has permissions to manage the DHCP service over the network. Operating this way, one DHCP Agent can manage several different DHCP servers.

Cisco DHCP
  The DHCP Agent can be installed on any machine.

There are a few strategies for installing the Micetro DHCP Agent:

* In a Unix ISC DHCP environment, the DHCP Agent is installed on all DHCP servers that are to be managed.
* In a Microsoft environment, the administrator can install the DHCP Agent on one, some, or all of the servers. If all the DHCP servers are in the same security realm---maybe in different forests, but with trust between them---the DHCP Agent can be installed on one server, typically the server running Micetro Central.

  .. note::
    If you want the DHCP Agent to be used to manage DHCP on other DHCP servers, the DHCP Agent must be running as a member of the AD DHCP Administrators group.

* If some of the managed DHCP servers are not in the same forest as Micetro Central, and there is no trust between the forests, the administrator must install at least one DHCP Agent in the foreign forest. That DHCP Agent can act as a proxy between Micetro Central and the DHCP servers and must be running as a member of the AD DHCP Administrators group in the foreign forest.
* The DHCP Agents can be installed on each managed DHCP server. In this scenario, the DHCP Agent can be run as the Local System account, which means that no additional configuration is needed after the installation is complete.

For more information, refer to :ref:`dhcp_agents_windows` or :ref:`dhcp_agents_linux`.

Cisco IOS DHCP servers can be managed using Micetro. A Micetro DHCP Agent must be installed on a machine in the environment, which will acts as a proxy to manage the Cisco IOS DHCP servers and uses either plain ``telnet`` or ``ssh`` to connect to the managed servers.

----

.. _about-ui:

Web Application
^^^^^^^^^^^^^^^

.. note::
  Of the different user interfaces, multiple copies may be installed, and multiple instances can be logged in at once to manage the environments.

.. _about-webapp:

The Micetro Web Application can be installed on any server on the network running Microsoft Internet Information Services (IIS) or Apache. The Web Application talks directly to the Web Server (IIS or Apache) which redirects its request to Micetro Central through TCP port ``1231``.

The Web Application supports a minimum browser viewport area of 1366x768 pixels when using a maximum (100%) zoom setting. Lower resolutions are not supported.

.. image:: ../../images/IPAM1.png
  :width: 80%
  :align: center
|
.. tip::
  It's common practice to install the Web Application on the same server as Micetro Central.


..
  Middle Layer
  ------------
  The middle layer is responsible for collecting and synchronizing data and handling requests from different Interfaces. Micetro Central has its own database to store all related data. (See :ref:`central-database`.)  To retrieve data from the different data sources it uses various methods, as listed above.  It might also communicate with other services to get or set information - e.g., Microsoft Active Directory to authenticate users. (See :ref:`webapp-sso`.)

.. _about-virtual-appliances:

Virtual Appliances (Optional)
------------------------------

The MDDS DNS/DHCP Appliance can be used as both a DNS and a DHCP server. Once the appliance has been configured, you work with the DNS and DHCP servers just as you would work with the BIND and ISC DHCP servers. Fore more information, refer to :ref:`webapp-appliance-management`.
