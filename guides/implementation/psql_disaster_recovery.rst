.. meta::
   :description: Disaster scenarios and recovery with PostgreSQL high availability in Micetro by Men&Mice
   :keywords: disaster recovery, PostgreSQL, high availability, Micetro 

.. _psql-disaster-recovery:

Possible disaster scenarios
===========================

.. table::

  +-----------------------+-----------+-------------------------------------------------------------------------------------------+
  | Failure of:           | Machine   | HA system response                                                                        |
  |                       | affected  |                                                                                           |
  +=======================+===========+===========================================================================================+
  |                       | Primary   | Failover, automatic service reboot. Replication stops in the meantime.                    |
  |                       |-----------+-------------------------------------------------------------------------------------------+
  | PSQL database service | Secondary | Automatic service reboot. Replication stops in the meantime.                              |
  |                       |-----------+-------------------------------------------------------------------------------------------+
  |                       | Monitor   | Automatic service reboot. Replication continues but no failover possible in the meantime. |
  +-----------------------+-----------+-------------------------------------------------------------------------------------------+
  |                       | Primary   | Failover. Replication stops, waits for a signal from secondary.                           |
  |                       +-----------+-------------------------------------------------------------------------------------------+
  |                       | Secondary | Replication on primary stops. Waits for a signal from secondary.                          |
  |                       +-----------+-------------------------------------------------------------------------------------------+
  | Server shutdown       | Monitor   | The primary database is still usable.                                                     |
  |                       |           | Primary and secondary nodes wait for a connection to monitor. Replication continues.      |
  |                       +-----------+-------------------------------------------------------------------------------------------+
  |                       | All       | Database unavailable, no replication, no failover possible.                               |
  +-----------------------+-----------+-------------------------------------------------------------------------------------------+
  |                       | Primary   | Failover, automatic service reboot on startup.                                            |
  |                       +-----------+-------------------------------------------------------------------------------------------+
  |                       | Secondary | Automatic service reboot. Replication stops in the meantime.                              |
  | Server reboot         +-----------+-------------------------------------------------------------------------------------------+
  |                       | Monitor   | Automatic service reboot. Replication continues but no failover possible in the meantime. |
  |                       +-----------+-------------------------------------------------------------------------------------------+
  |                       | All       | Database unavailable, no replication, no failover possible.                               |
  +-----------------------+-----------+-------------------------------------------------------------------------------------------+
  | ``pg_autoctl``        |           |                                                                                           |
  | corrupted and/or      | All       | Database unavailable, no replication, no failover possible.                               |
  | deleted               |           |                                                                                           |
  +-----------------------+-----------+-------------------------------------------------------------------------------------------+

Controlled switchover
--------------------

.. note::
  In a controlled switchover situation it is possible to organize the sequence of events in a way to avoid data loss and lower downtime to a minimum. Because the HA cluster described here uses synchronous replication, triggering a manual failover doesn’t risk data loss risks. The monitor server keeps the current primary health at the time when the failover is triggered, and drives the failover accordingly.

Triggering a controlled switchover is the same as a manual failover described above.

Recovery
========

Database service failure
------------------------

If the PostgreSQL database fails on one of the machines, the system will automatically reboot the affected service, but the replication process is unavailable for the duration.

Server shutdown
---------------

If either of the component machines is shut down, a manual restart is required. The failover processes will automatically start with the machine, and reinitialize the connections. If only the monitor server is affected, replication continues and failover is still possible.

Server reboot
-------------

The failover system is configured to automatically restart with the server, and no manual intervention is required. If only the monitor server is affected, replication continues but no failover can be triggered until it’s available.

``pg_autoctl`` setup failure
----------------------------

On the current primary database machine:

.. code-block:: bash

  /usr/pgsql-12/bin/postgres -D /var/lib/pgsql/[node-?] -p [port]

Edit the ``preferences.cfg file`` for Central, and change the following line, using the connection string:

.. code-block::
  :linenos:

  postgres://[node-?]:[port]/mmsuite?target_session_attrs=read-write

Restart Central:

.. code-block:: bash

  systemctl restart mmcentral

Complete shutdown
-----------------

If the startup scripts are correct in all of the machines a manual boot of the machines in the correct order (1. monitor; 2. primary; 3. secondary) will be enough to reinitialize the cluster.
On each machine, use the ``ps -ef | grep monitor`` (or ``primary``/``secondary``) command after boot to verify the ``pg_autoctl`` process is running.

If something’s not working, or you’d like to manually restart the services to recover, follow these steps.

.. note::
  You can create bash scripts of each step to execute instead of manually running through them.

Start the monitor machine:

.. code-block:: bash

  sudo su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  pg_autoctl run --pgdata ./[monitor]/

Start the primary machine:

.. code-block:: bash

  sudo su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  pg_autoctl run --pgdata ./[node-1]/

If an error message states an instance is already running, remove the referenced file:

.. code-block:: bash

  rm /tmp/pg_autoctl/var/lib/pgsql/[node-1]/pg_autoctl.pid

And re-run the application:

.. code-block:: bash

  pg_autoctl run --pgdata ./[node-1]/

Start the secondary machine(s):

.. code-bloack:: bash

  sudo su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  pg_autoctl run --pgdata ./[node-2]/

If an error message states an instance is already running, remove the referenced file:

.. code-block:: bash

  rm /tmp/pg_autoctl/var/lib/pgsql/[node-2]/pg_autoctl.pid

And re-run the application:

.. code-block:: bash

  pg_autoctl run --pgdata ./[node-2]/
