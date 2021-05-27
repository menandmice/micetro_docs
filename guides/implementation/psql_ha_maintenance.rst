.. meta::
   :description:
   :keywords:

.. _psql-ha-maintenance:

PostgreSQL HA operations
************************

Triggering a failover
=====================

To call the function successfully, you need to figure out the formation and group of the group where the failover happens.
The following commands when run on a ``pg_auto_failover`` keeper node provide for the necessary information:

Machine: node-1
"""""""""""""""

Get the variables [formation] and [group] from these commands:

.. code-block:: bash

  su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  # [formation] -> the default value is 'default'
  pg_autoctl config get pg_autoctl.formation --pgdata ./[node-1]
  # [group] -> the default value is '0'
  pg_autoctl config get pg_autoctl.group --pgdata ./[node-1]

Machine: monitor
""""""""""""""""

.. code-block:: bash

  sudo su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  psql -p [port] -d pg_auto_failover
  > select pgautofailover.perform_failover(formation_id => '[formation]', group_id => [group]);

Implementing a controlled switchover
====================================

It is generally useful to distinguish a controlled switchover from a failover. In a controlled switchover situation it is possible to organize the sequence of events in a way to avoid data loss and lower downtime to a minimum.
In the case of ``pg_auto_failover``, because we use synchronous replication, we don’t face data loss risks when triggering a manual failover. Moreover, our monitor knows the current primary health at the time when the failover is triggered and drives the failover accordingly.
So to trigger a controlled switchover with ``pg_auto_failover`` you can use the same API as for a manual failover above.

Maintenance of a secondary node:
================================

It is possible to put a secondary node in any group in a MAINTENANCE state so that the Postgres server is not doing synchronous replication anymore and can be taken down for maintenance purposes, such as security kernel upgrades or the like.

Machine: node-1 | node-2
""""""""""""""""""""""""

To enable maintenance we use:

.. code-block:: bash

  pg_autoctl enable maintenance --pgdata ./[node-1 | node-2]

When a standby node is in maintenance, the monitor sets the primary node replication to WAIT_PRIMARY: in this role, the PostgreSQL streaming replication is now asynchronous and the standby PostgreSQL server may be stopped, rebooted, etc.

.. note::
  ``pg_auto_failover`` does not provide support for primary server maintenance.

To disable maintenance we use

.. code-block:: bash

  pg_autoctl disable maintenance --pgdata ./[node-1 | node-2]

Show current state and events
"""""""""""""""""""""""""""""

.. code-block:: bash

  $ pg_autoctl show state --pgdata [monitor | node-1 | node-2]
  $ pg_autoctl show events --pgdata [monitor | node-1 | node-2]

Monitoring ``pg_auto_failover`` in Production
=========================================

The monitor reports every state change decision to a LISTEN/NOTIFY channel named state. PostgreSQL logs on the monitor are also stored in a table, ``pgautofailover.event``, and broadcast by NOTIFY in the channel log.

Machine: monitor
""""""""""""""""

.. code-block:: bash

  sudo su - postgres
  tail -f ./[monitor]/pg_log/postgresql-[WeekDay].log
