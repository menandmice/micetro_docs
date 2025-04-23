.. meta::
   :description: Kea DHCP High Availability and Micetro
   :keywords: Kea DHCP, DHCP servers, Kea DHCP servers

.. |kea-ok| image:: ../../images/kea-ok.png
  :height: 4ex

.. |kea-down| image:: ../../images/kea-down.png
  :height: 3ex

.. |kea-impaired| image:: ../../images/kea-impaired.png
  :height: 3ex

.. |kea-unreachable| image:: ../../images/kea-unreachable.png
  :height: 3ex

.. _dhcp-kea-ha:

Kea DHCP in High Availability
=============================
The following page provides information on how to configure a High Availability (HA) setup for your Kea DHCP servers in Micetro.

.. important::
  Kea DHCP servers need to be configured for HA **before** the primary server is added to Micetro. Micetro will recognize the HA relationship and configure accordingly.

.. warning::
  Synchronized clocks are **essential** for the HA setup to operate reliably. If a clock skew is not corrected and exceeds 60 seconds, the HA service on each of the servers is terminated.

Two modes of failover operation are supported:

Load-balancing
  One of the servers must be designated as *primary* and another as *secondary*. During normal operation, these two servers are identical. When the servers are started at (nearly) the same time, and synchronize their lease databases, the primary server will always synchronize its database first. The secondary server will wait for the primary to finish before it starts its own synchronization.

Hot standby
  In hot standby configuration, one of the servers is designated as *primary* and another as *secondary*. During normal operation, **only** the primary server will respond to DHCP requests. The secondary (or *standby*) server receives lease updates from the primary through the control channel. When the secondary server considers the primary to be offline, it will start responding to DHCP queries.


High Availability Hooks Library
-------------------------------
Previously only available to paid subscribers, the HA hooks library is now part of the open-source Kea. The library needs to be loaded **before** the Kea DHCP servers can be managed in a High Availability setup.

**Hooks Library Locations**:

* For RedHat-like systems (such as RHEL, SUSE, Fedora, etc.), the hooks library is typically located at ``/usr/lib/x86_64-linux-gnu/kea/hooks/libdhcp_ha.so``.
* For Debian-based systems (such as Ubuntu, Linux Mint, Raspbian, etc.), the hooks library is typically located at ``/usr/lib64/kea/hooks/libdhcp_ha.so``.

Ports and Networking
--------------------
Micetro can only support a Kea High Availability setup if it can communicate with each Kea DHCP server through the correct ports. (This is also necessary for cross-communication between the Kea DHCP servers themselves through the :ref:`kea-control-agent`.)

The Kea Control Agent uses port ``8000`` by default, but that value can be manually defined in its configuration file (usually located at ``/etc/kea/kea-ctrl-agent.conf``). This port must be open and accessible on every server that hosts a Kea DHCP service and a Kea Control Agent.

Configuring the High Availability setup
---------------------------------------

Kea DHCP servers in a High Availability environment must already be synced and configured to communicate with each other before you add them to Micetro. After setting up the HA environment and adding the primary server to Micetro, the configuration file is parsed and all HA relationships are detected. The relationships will be imported to Micetro and replication between servers begins.

.. note::
  If the *Configuration Backend* section is set and configured, Micetro will assume that the config is shared between all HA members and will not replicate the changes between servers.

An example of a ``hook-libraries`` section of the configuration where Micetro will successfully detect the setup and act accordingly is as follows:

.. code-block::

  "hooks-libraries": [{
      "library": "/usr/lib/kea/hooks/libdhcp_ha.so",
      "parameters": {
          "high-availability": [{
              "this-server-name": "server1",
              "mode": "load-balancing",
              "heartbeat-delay": 1000,
              "max-response-delay": 10000,
              "max-ack-delay": 5000,
              "max-unacked-clients": 0,
              "peers": [{
                  "name": "server1",
                  "url": "http://192.168.56.33:8000/",
                  "role": "primary",
                  "auto-failover": true
              }, {
                  "name": "server2",
                  "url": "http://192.168.56.66:8000/",
                  "role": "secondary",
                  "auto-failover": true
              }, {
                  "name": "server3",
                  "url": "http://192.168.56.99:8000/",
                  "role": "backup",
                  "auto-failover": false
              }]
          }]
      }

this-server-name (Server Tag)
  This field must reflect the Kea DHCP server where the configuration file resides.

  .. note::
    It's only possible to add a primary Kea DHCP server in a preconfigured HA relationship. When the server is added to Micetro, ``this-server-name`` must match the peer with ``"role": "primary"`` in the *high-availability* section.

  This setting is also available in the Micetro :guilabel:`Server Properties` under the name **Server tag**. For more information, refer to :ref:`admin_dhcp_service_properties`.

max-response-delay
  This value should be greater than the ``heartbeat-delay``, and is usually greater than the duration of multiple ``heartbeat-delay`` values.

  When the server detects that communication is interrupted, it may transition to the ``partner-down`` state (when ``max-unacked-clients`` is 0) or trigger the failure-detection procedure using the values of the two parameters below. Setting ``max-unacked-clients`` to 0 ensures that the Kea servers are vigilant, and correctly and immediately change states if the connection between them is lost. To allow some leniency, change the ``max-unacked-clients`` value to a positive number, e.g., 5.

  The default value of ``max-response-delay`` is **60000 ms**.

  .. warning::
    If ``max-response-delay`` is not configured correctly, the servers will be unable to consistently and efficiently detect downtime between one another, and Micetro won't be able to ensure the correct replication and operations of the servers.

Adjusting the DHCP Agent
------------------------
To adjust your Kea High Availability setup, edit the following values in the ``preferences.cfg`` file for the DHCP Agent:

keaReplicateConfig
  If this value is set to ``0``, Micetro will not replicate between Kea DHCP servers in a HA setup. The default value is ``1``. Example: ``<keaReplicateConfig value=”0”/>``.

keaControlAgentHost
  Determines which host to use when connecting to a control agent. If the Kea Control Agent is running on the same machine, the default value is either ``127.0.0.1`` or the IP address of the server added to Micetro.

keaControlAgentPort
  Determines which port to use when connecting to the Kea Control Agent. The default value is ``8000``.

Adding a High Availability-enabled Kea DHCP server
--------------------------------------------------
If the Kea High Availability environment is set up correctly, system administrators can add the primary Kea DHCP server just like any other DHCP server.

.. important::
  If the DHCP Agent is running on a machine **other** than the primary Kea DHCP server, you must define a proxy in Micetro using the **Add DHCP server** function. In the dialog, enter the IP address or FQDN of the of the machine running the DHCP Agent. For more information, refer to :ref:`adding-service`.

Fallback Behavior and Indicators
--------------------------------
After you add the primary Kea server to Micetro, it acts as the primary mode of communication between Micetro and the HA cluster. All changes will be written to this primary server and replication will be handled with regards to it. The single source of truth for the configuration is the in-memory config on the primary Kea DHCP server.

When both the primary Kea server and all its secondary/backup partners in the HA environment are running and accessible, Micetro reports the Kea DHCP server as |kea-ok|.

Primary server offline |kea-impaired|
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If the primary server is offline or unavailable for any reason, such as reporting itself in a disabled state, or becomes unreachable from Micetro, the secondary/standby server will take its place in Micetro. Micetro will report the Kea DHCP service as **Impaired**. When this occurs, in-memory config on the secondar/standy server becomes the single source of truth, and will remain so until connection to the primary server is re-established.

Secondary/standby/backup server offline |kea-impaired|
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If any of the secondary/standby servers are offline, replication to all other servers still occurs, but Micetro will report the Kea DHCP service as **Impaired**. When the affected secondary/standby server reports itself as *active* again, it is automatically synchronized with the in-memory config of the primary Kea server (the single-source-of-truth configuration).

Both primary and secondary/standby server offline |kea-down|
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If both the primary and secondary/standby servers go offline, Micetro reports the Kea DHCP service as **Service down**. All further operations will result in an error that reports this downtime. All replication is stopped until either the primary or secondary/standby servers report themselves as *active*. The first one to become active will become the single-source-of-truth, but the primary server will always overwrite any secondary/standby server when it becomes active.

DHCP Agent offline |kea-unreachable|
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
In the unlikely event that the DHCP Agent is offline, all Kea HA information will be momentarily lost and Micetro reports the service as **Unreachable**. As soon as the Agent comes back online, Micetro Central will attempt to reconnect to the preconfigured primary Kea DHCP server. After reconnecting to the primary Kea server, the configuration will be parsed again, the HA setup detected, and replication between servers restarted.

If the DHCP Agent goes offline while using the secondary/standby Kea server (because the primary is down)
  The system will **not** be able to reconnect successfully. Because only the primary Kea server can be added to Micetro, a system administrator must reestablish the primary Kea server to a working state before the system can reconnect.

If the DHCP Agent goes offline and is then restored while the primary Kea server is down
  The Agent will **not** be able to reconnect until the primary Kea server becomes active again.

.. _dhcp-kea-ha-external-changes:

Making External Changes to Kea Servers in High Availability
-----------------------------------------------------------

.. note::
  All changes made to the configuration file through Micetro will automatically and instantly be propagated to the secondary/standby servers in a Kea DHCP High Availability setup. Therefore, it's highly recommended to always edit the Kea DHCP server's configuration file through Micetro to ensure the immediate synchronization between Micetro and the Kea DHCP server.

Primary server
  As with the standalone server, Micetro synchronizes any external changes on the primary Kea server on a defined schedule. For details, refer to :ref:`kea-external-changes`.
  
  Automatic propagation of the changes to the secondary/standby servers only occurs after the servers leave an *active* state and then become *active* again. To manually propagate the changes, you need to make a change to the configuration through Micetro. This will trigger synchronization.

Secondary server(s)
  The same rules as those for the primary server apply regarding changes to the configuration and the ``config-reload`` command. However, Micetro will overwrite any external changes with the current in-memory configuration of the primary Kea DHCP server in the HA setup.
