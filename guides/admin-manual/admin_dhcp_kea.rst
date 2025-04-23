.. meta::
   :description: Managing ISC Kea DHCP servers in Micetro
   :keywords: DHCP Kea, DHCP, Micetro

.. _admin_dhcp-kea:

Managing ISC Kea DHCP
=====================
There are several actions specific to managing ISC Kea DHCP servers and services in Micetro. You can:

* :ref:`Manage Kea client classes <kea-client-classes>`
* :ref:`Handle external changes <kea-external-changes>` to a Kea server's configuration file
* :ref:`Resolve synchronization conflicts <kea-sync-conflicts>`

To get started with Kea DHCP in Micetro, refer to :ref:`add-kea-hooks`.

If you want to enable High Availability for your Kea DHCP servers, the servers must be configured for High Availability **before** the primary server is added to Micetro. If High Availability is set up properly, Micetro will recognize the failover nodes and the method (load balancing, hot standby, etc.) and configure the server objects accordingly when you add your servers to Micetro. For more information, see :ref:`failover-management-kea`.

Refer to the following topics for more information about managing Kea DHCP servers in Micetro:

.. toctree::
   :maxdepth: 1

   add_kea_dhcp
   kea_control_agent
   kea_dhcp_client_class
   kea_external_changes
   dhcp_kea_ha
   kea_resolve_conflicts
