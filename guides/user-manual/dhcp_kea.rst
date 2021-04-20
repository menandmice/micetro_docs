.. _dhcp-kea:

ISC Kea DHCP
============

.. danger::
  Starting with Micetro 10.0, older versions of the Kea DHCP server are no longer supported. See :ref:`system-requirements` for a list of supported versions. You need to remove your existing (older) Kea DHCP servers from the system, and update them to a supported version of Kea before updating to Micetro 10.0 from an older version of the Men&Mice Suite. Not doing so could result in lost access to and data from the older Kea servers in Micetro.

.. _kea-control-agent:

Kea Control Agent
-----------------

The Kea Control Agent is a daemon that exposes a RESTful control interface for managing Kea servers. The Control Agent daemon can receive control commands over HTTP and either forward these commands to the respective Kea servers or handle them commands on its own.

.. note::
  The default port for the Kea Control Agent is ``8000``.

Because of the Kea Control Agent, Kea DHCP servers can be added to Micetro without a DHCP Server Controller running on every machine that runs Kea. A *single* DHCP Server Controller, installed on a machine that can access the instances that run Kea services, is sufficient and will communicate with all Kea servers on Micetro's behalf.

Kea high availability
---------------------

Kea DHCP servers need to be configured for high availability **before** the primary server is added to Micetro. If the high availability is set up properly, once added to the system Micetro will recognize the failover nodes and the method (load balancing, hot standby, etc.) and configure the server objects accordingly.

For more information, see :ref:`dhcp-kea-ha`.

Split scopes in load balancing mode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When creating scopes on Kea servers configured in load balancing mode for high availability, Micetro will split the available pool evenly between primary and secondary servers.

.. image:: ../../images/kea-ha-lb-split-scopes-Micetro.png
  :width: 50%
  :align: center

.. _kea-dhcp-poperties:

Kea DHCP Server Properties
--------------------------

.. image:: ../../images/console-kea-properties-new.png
  :width: 80%
  :align: center

Default/Maximum/Minimum Valid Lifetime
  Specifies the time after which a lease will expire if not renewed.

Renew Timer
  Specifies the time when a client will begin a renewal procedure.

Rebind Timer
  Specifies the time when a client will begin a rebind procedure.

Match Client ID
  Specifies if the server should ignore the client identifier during lease lookups and allocations for a particular subnet.

Echo Client ID
  Specifies if the server should send back client-id options when responding to clients.

Decline Probation Period
  Specifies a probation time that will be set on addresses that are in use by some unknown entity.

Next Server
  Specifies the server address to use when clients want to obtain configuration from a TFTP server.

**Control Socket**

  Name
    The path to the UNIX socket. Cannot be empty.

Server tag
  The name used for this server in a High Availability setup.

.. toctree::
  :maxdepth: 2

  dhcp_kea_external_changes
  dhcp_kea_ha
