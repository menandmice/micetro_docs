.. meta::
   :description: Managing failover configurations for Microsoft, ISC, and KEA DHCP servers in Micetro
   :keywords: failover management, Microsoft, ISC, Kea, DHCP

.. _failover-management:

Failover Management
====================
Micetro can be used to manage failover configurations for ISC DHCP, Kea DHCP, and Microsoft servers. Failover is a feature that improves the reliability and availability of DHCP services by creating redundancy between two DHCP servers. This failover mechanism ensures that if one server becomes unavailable, the other can seamlessly take over the DHCP service, minimizing downtime and disruption to network operations. Servers can be configured in Hot Standby or Load Balancing modes, depending on the server type.

.. note::
  Both servers must be in Micetro for the functionality to work.

The following permissions and roles are required for effective failover management across ISC DHCP, Kea DHCP, and Microsoft DHCP servers:

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

----------------------------------------------------

  
.. toctree::
  :maxdepth: 1

  failover_management_isc
  failover_management_kea
  failover_management_windows
