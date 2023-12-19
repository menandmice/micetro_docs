.. meta::
   :description: Managing failover configurations for Windows, ISC, and KEA DHCP servers in Micetro
   :keywords: failover management, Windows, ISC, Kea, DHCP

.. _failover-management:

Failover Management
====================
Managing failover relationships for DHCP servers is crucial for ensuring high availability and seamless operation.

The following permissions and roles are required for effective failover management across ISC DHCP, Kea DHCP, and Windows DHCP servers:

**To manage failover relationships**:

* Permission: DHCP administrator
* Built-in role: ``DHCP Administrators (built-in)``

**To add/remove a scope to a failover relationship**:

* Permission bit: ``add a scope`` 
* Built-in role: ``DHCP Administrators (built-in)``

**To Replicate Scopes**:

* Access bits - one or more of the following:

  * ``"Read/write scope options"``
  * ``"Edit reservations"``
  * ``"Edit address pools"``
  * ``"Edit exclusions"``

* Built-in roles: ``IPAM Administrators (built-in)`` and ``DHCP Administrators (built-in)``

**To Replicate all scopes on a server or in a relationship**:

* Access bits: ``"Administer DHCP servers"``
* Built-in role: ``DHCP Administrators (built-in)``

.. note::
   The permissions to replicate scopes are on the scope level. This is not to be confused with the "Edit reservation" permission bit on the server level, which does not apply in this context.

-----------------------------------

Micetro can be used to manage failover configurations for Windows, ISC DHCP, and Kea DHCP servers. The term "Failover" is used interchangeably with "High Availability" in the context of Kea DHCP.

* DHCP failover synchronizes IP address lease information between two DHCP servers.

* Servers can be configured in Hot Standby, Load Balancing, or High Availability modes, depending on the server type.

* Failover can be set up for a single scope or multiple scopes on the same server.

* As an overlay solution, Micetro can also add some additional functionality that is not available natively.


.. note::
  Both servers must be in Micetro for the functionality to work.
  
.. toctree::
  :maxdepth: 1

  failover_management_isc
  dhcp_kea_ha
  failover_management_windows
