.. meta::
   :description: Adding Kea DHCP server to Micetro
   :keywords: ISC Kea, DHCP, Management Console

.. _console-dhcp-kea:

ISC Kea DHCP (Management Console)
=================================

.. danger::
  Starting with Micetro 10.0, older versions of the Kea DHCP server are no longer supported. See :ref:`system-requirements` for a list of supported versions. You need to remove your existing (older) Kea DHCP servers from the system, and update them to a supported version of Kea before updating to Micetro 10.0 from an older version of the Men&Mice Suite. Not doing so could result in lost access to and data from the older Kea servers in Micetro.

.. _console-kea-control-agent:

Kea Control Agent
-----------------

The Kea Control Agent is a daemon that exposes a RESTful control interface for managing Kea servers. The Control Agent daemon can receive control commands over HTTP and either forward these commands to the respective Kea servers or handle them commands on its own.

.. note::
  The default port for the Kea Control Agent is ``8000``.

Because of the Kea Control Agent, Kea DHCP servers can be added to Micetro without a DHCP Server Controller running on every machine that runs Kea. A *single* DHCP Server Controller, installed on a machine that can access the instances that run Kea services, is sufficient and will communicate with all Kea servers on Micetro's behalf.

.. _add-kea-hooks:

Adding Kea to Micetro
---------------------

Because Micetro uses the Kea API to communicate with the DHCP server(s), it requires (in addition to the DHCP Server Controller) the Kea hook library ``libdhcp_lease_cmds.so``.

.. note::
  On certain distributions (like RHEL) check that the kea-hooks package is also installed.

Configuring the Kea hook library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After installing the Kea hook library, open ``kea-dhcp4.conf`` and locate the ``hooks-libraries`` array. Add the hook to ``libdhcp_lease_cmds.so``:

.. code-block::
  :linenos:

  "hooks-libraries":[
      {
        "library" : "/lib64/kea/hooks/libdhcp_lease_cmds.so",
        "parameters" : {}
      }
  ]

The location of the library depends on your distribution, use ``whereis libdhcp_lease_cmds.so`` to find it.

After adding the library, restart Kea and the Kea Control Agent.

.. _console-kea-dhcp-poperties:

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

Control Socket

  Name
    The path to the UNIX socket. Cannot be empty.

Server tag
  The name used for this server in a High Availability setup. (See :ref:`dhcp-kea-ha`.)
