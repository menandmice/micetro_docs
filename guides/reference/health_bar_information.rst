.. meta::
   :description: The user is able to click a link from the Management Console to get more details about each error / warning that is shown there.
   :keywords: Micetro, Management console
.. _health-bar-information:

Health Bar information (Management Console)
-------------------------------------------

On this page, the errors / warnings from the :ref:`console-health-bar` in the Management Console are made available.

The user is able to click a link from the Management Console to get more details about each error / warning that is shown there.

Component out of date
  This warning is shown when a Men&Mice component is out of date in the system. This can be confirmed by going to :menuselection:`Tools --> Update Status`. It will show all components that are out of date in the system. From this window, they can also be updated.

Component unreachable
  This error is shown when the Men&Mice Central cannot communicate with the specified component. It can be due to one of the following reasons:

  * The network connection is not functional between the component and the central server. That can be due to firewall issues. See :ref:`firewall-ports`.

  * The component is not turned on or has been shut down

Database has multiple schemas
  This error is displayed when it has been detected that the database has multiple schemas. This can happen if the database has been migrated and not configured properly. Contact Men&Mice Support for further assistance. (See :ref:`support`.)

Database size exceeded the recommended value
  When the database is the default one (SQLite) and the size of the database is higher than the threshold of 1 GB, then this warning is shown. Collecting lease history for DHCP is one of the factors that can increase the size of the database. In cases of that and also when the network environment is considered to be large, it is recommended to use SQL Server or PostgreSQL as a database backend for Micetro. See :ref:`central-mssql` and :ref:`central-postgresql` for more details.

DHCP failover partner server unreachable
  This error is displayed when the defined failover partner server for a DHCP server is not reachable. The reason could be a networking issue or that the DHCP service on the server is down.

Error loading zone
  This warning is shown when DNS server (e.g. BIND) is unable to load its zones. This warning is also posted if the server has not successfully finished checking all zones for errors.

Failed to do a SOA request for zone
  This error is shown when the Men&Mice DNS Server Controller is able to query the server, but SOA request for the zone failed.

Failed to load ODBC Driver for SQL Server
  The preferred version of the Microsoft ODBD Driver for SQL Server failed to load. The latest version can be downloaded from `https://www.microsoft.com/en-us/download/details.aspx?id=53339`_.

**Failover partner Down**

High availability failure state
  This warning is shown when the active Central server went down and a standby Central server took over the service. For some reasons active server didn’t report and therefore the standby server was activated. The Standby server is updated and becomes the active server and vice versa. The former active server will be in failed state until it is fixed or restarted.

License exceeded
  This warning is shown when the current license for Men&Mice component has been exceeded. For example, if the appliance license is only valid for a single appliance, and another appliance is added, then the additional appliance is not shown. Please contact `sales@menandmice.com`_ to resolve the matter.

**Multiple PTR records in zone**

**Orphaned PTR records in zone**

Outdated database server version
  For Men&Mice Suite version 8.1 and higher we recommend to use only SQL Server 2014 or higher. Support for older versions will be dropped in version 8.2 of the Men&Mice Suite.

Scope contains inconsistencies that need reconciling
  This warning is shown when scope contains inconsistencies and it needs reconciling. See :ref:`console-dhcp-windows-reconcile` and `https://technet.microsoft.com/en-us/library/dd183579(v=ws.10).aspx`_ about reconciling a DHCP scope.

Scope is not part of a failover relationship on partner server
  This warning is shown when scope is not a part of a failover relationship on partner server, but should be.

Scope pool collision
  This warning is shown when one of the following situations occur:

  * Scopes in a failover relationship have mismatching address pools or exclusions. Failover scopes should be identical.

  * An address pool conflict was detected. Addresses exist in multiple pools without exclusions.

  * An address pool conflict was detected. The address pool is not identical across the split scope.

  * An address pool conflict was detected.

Scope reservation mismatch
  This warning is shown when DHCP reservations do not match, that is name, MAC address and description are not identical.

Slave zone not updated from master or is about to expire
  This warning is shown when a slave zone is not receiving an update from its master. This warning could also be shown when a slave zone is not receiving update from its master and is about to expire.

Superscope, subnet, static or dynamic part of scope over utilized
  This warning is shown when a specific threshold is reached, that is, not enough IP addresses is available in this range. To fix this issue remove the scope and create a larger one instead or create a super scope which will join together two or more scopes for larger one.

Unable to check whether scope contains inconsistencies
  This warning is shown when Men&Mice Central can’t connect to the DHCP Server Controller service to check whether scope contains inconsistencies. The reason could be if the DHCP Server Controller is offline or not turned on.

Unable to check whether scope is part of a failover relationship on partner server
  This warning is shown when Men&Mice Central can’t connect to the DHCP Server Controller service to see if a scope is a part of a failover relationship on partner server. The reason could be if the DHCP Server Controller is offline or not turned on.

Unable to fetch scope info from partner server
  This warning is shown when Men&Mice Central can’t connect to the DHCP Server Controller service to gather scope info from partner server. The reason could be if the DHCP Server Controller is offline or not turned on.

Unable to get status for DNS or DHCP server
  This warning is shown when Men&Mice Central is unable to connect to DNS or DHCP Server Controller to do a status check for the server. This occurs if the Server Controller is offline, not turned on or has been shut down (in some case not installed). To fix this issue get the server online again and turn on the remote or (re)install.

Unable to get status for scope
  This error is shown when Men&Mice Central can’t connect to the DHCP Server Controller service to get scope status from DHCP server. The reason could be if the DHCP Server Controller is offline or not turned on.

Unable to get status for zones
  This warning is shown when Men&Mice Central can’t connect to the DNS Server Controller service to get status on the zones. The reason could be if the DNS Server Controller service is turned off or is offline.

Update available
  This warning is shown when new version of Micetro is available. To get this new version go to :menuselection:`Tools --> Check for updates` in the menu bar and run the update wizard.

Update server unreachable
  This warning is shown when Men&Mice Central has lost its connection to Men&Mice update server. It is not mandatory to have this connection and it can be turned off. To fix this issue make sure that machine running the Men&Mice Update service and the machine running the Men&Mice Central are listening to the same TCP port. TCP port ``4603`` is reserved for the update service but it can be changed if there is another software using that TCP port. See :ref:`change-updater-port` about changing the TCP port.

Zone replication group out of sync
  This error is shown when a member of a zone replication group is out of sync.

**Zone serial out of date**
