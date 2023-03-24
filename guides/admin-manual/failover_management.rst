.. meta::
   :description: Managing failover configurations for Windows, ISC, and KEA DHCP servers in Micetro
   :keywords: failover management, Windows, ISC, Kea, DHCP

.. _failover-management:

Failover Management
====================

**Permissions:**

**To manage failover relationships**

* Permission - DHCP administrator
* Built-in role - ``DHCP Administrators (built-in)``

**To add/remove a scope to a failover relationship**

* Permission bit - add a scope. 
* Built-in role - DHCP Administrators (built-in)

**To Replicate Scopes**

* Access bits - one or more of the following:

  * "Read/write scope options"
  * "Edit reservations"
  * "Edit address pools"
  * "Edit exclusions"

* Built-in roles - IPAM Administrators (built-in) and DHCP Administrators (built-in)

**To Replicate all scopes on a server or in a relationship**

* Access bits - "Administer DHCP servers" 
* Built-in role - DHCP Administrators (built-in)

.. note::
   The permissions to replicate scopes are on scope level. This is not to be confused with the "Edit reservation" permission bit on server level that does not apply in this case.

-----------------------------------

Micetro can be used to manage failover configurations for Windows, ISC and Kea DHCP servers. To help with consistency, the term Failover is used interchangeably with High Availability when referring to Kea DHCP.

DHCP failover synchronizses IP Address lease information between two DHCP servers. 

Depending upon the type of server being used, servers can be put into Hot Standby, Load Balancing, or High Availability modes.

You can configure failover for a single scope or for multiple scopes on the same server.

.. note::
  Both servers must be in Micetro for the functionality to work.
  
As an overlay solution, Micetro is also able to add some additional functionality that is not available natively.

Failover relationships for Windows DHCP servers are created without adding scopes to the relationship on creation. The scopes that should be part of the relationship are added later on with the "Add scope to failover" action.

.. note:: 
  Windows DHCP Failover Configurations can be managed from the Micetro Web Application . 
  
  ISC DHCP and Kea DHCP Failover Configurations can only be managed from the Management Console.


Managing Failover Configurations for ISC DHCP
----------------------------------------------


Managing Failover Relationships for Windows DHCP Servers
--------------------------------------------------------





