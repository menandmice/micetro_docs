.. _psql-ha:

Setting up the PostgreSQL High Availability environment
-------------------------------------------------------

.. note::
  You can use the commands ``pg_autoctl stop`` and ``pg_autoctl drop node --destroy`` to start with a clean slate and get rid of everything that might have been set up previously.

Machine: monitor
""""""""""""""""

Switch to user *postgres* and export *pgsql path*:

``sudo su - postgres``

``export PATH="$PATH:/usr/pgsql-12/bin"``

Set up a monitor node:

``pg_autoctl create monitor --pgdata ./[monitor] --pgport [port] --nodename [monitor] --auth scram-sha-256``

Next, the ``pg_hba.conf`` file needs to be edited to allow connection in from the two nodes:

``echo "host pg_auto_failover autoctl_node [ip-address-node-1]/32 scram-sha-256" >> ./[monitor]/pg_hba.conf``

``echo "host pg_auto_failover autoctl_node [ip-address-node-2]/32 scram-sha-256" >> ./[monitor]/pg_hba.conf``

Edit the ``postgresql.conf`` file to allow *scram-sha-256* authentication:

.. code-block::

  vi ./[monitor]/postgresql.conf
  # uncomment the line and set
  # password_encryption = 'scram-sha-256'
  # uncomment the line and set
  # listen_addresses = '*'
  # save the file and restart

``pg_ctl restart -D ./[monitor]``

Still running as user *postgres*, set the database user password in the monitor database:

.. code-block::

  psql -p [port] -d pg_auto_failover
  ALTER USER autoctl_node PASSWORD '[monitor_node_password]';
  \q

Machine: node-1
"""""""""""""""

Switch to user *postgres* and export *pgsql path*:

``sudo su - postgres``

``export PATH="$PATH:/usr/pgsql-12/bin"``

Set up a primary node:

``pg_autoctl create postgres --pgdata ./[node-1] --pgport [port] --pgctl `which pg_ctl` --nodename [node-1] --monitor postgres://autoctl_node:[monitor_node_password]@[monitor]:[port]/pg_auto_failover --auth scram-sha-256``

Set up a replication password

``pg_autoctl config set replication.password [replication-password] --pgdata ./[node-1]``

Edit the ``postgresql.conf`` file to allow *scram-sha-256* authentication:

.. code-block::

  vi ./[node-1]/postgresql.conf
  # uncomment the line and set
  # password_encryption = 'scram-sha-256'
  # uncomment the line and set
  # listen_addresses = '*'
  # save the file and restart

``pg_ctl restart -D ./[node-1]``

Still running as user *postgres*, set the database user password in the database:

.. code-block::

  psql -p [port]
  ALTER USER pgautofailover_replicator PASSWORD [replication-password];
  ALTER USER postgres PASSWORD [postgres-password];
  \q

Run the primary node in the background:

``pg_autoctl run --pgdata ./[node-1]/ &``

Machine: node-2
"""""""""""""""

.. code-block::
  :linenos:

  sudo su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  pg_autoctl create postgres --pgdata ./[node-2] --pgport [port] --pgctl `which pg_ctl` --nodename [node-2] --monitor postgres://autoctl_node:[monitor_node_password]@[monitor]:[port]/pg_auto_failover --auth scram-sha-256
  pg_autoctl config set replication.password [replication-password] --pgdata ./[node-2]
  pg_autoctl run --pgdata ./[node-2]/ &

Machine: monitor
""""""""""""""""

Show state to verify the setup:

``pg_autoctl show state --pgdata ./[monitor]``

.. code-block::

  Name                       |   Port    | Group |  Node |     Current State |    Assigned State
  ---------------------------+-----------+-------+-------+-------------------+------------------
  [node-1]                   |   [port] |     0 |     1 |            primary |           primary
  [node-2]                   |   [port] |     0 |     1 |          secondary |         secondary

Set up the mmsuite database and edit config files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Machine: node-1
"""""""""""""""

Enter the ``postgresql`` database as user *postgres*:

.. code-block::
  :linenos:

  psql -p [port]
  > CREATE DATABASE mmsuite ENCODING = 'LATIN1' LC_CTYPE = 'POSIX' LC_COLLATE='POSIX' TEMPLATE template0;
  > GRANT ALL PRIVILEGES ON DATABASE mmsuite TO postgres;

Edit the ``pg_hba.conf`` to allow access to the database from the outside:

.. code-block::
  :linenos:

  echo "host mmsuite postgres [ip-address-of-central-primary]/32 scram-sha-256" >> ./[node-1]/pg_hba.conf
  echo "host mmsuite postgres [ip-address-of-central-secondary]/32 scram-sha-256" >> ./[node-1]/pg_hba.conf
  psql -p [port] -c 'SELECT pg_reload_conf();'

Machine: node-2
"""""""""""""""

Edit the ``pg_hba.conf`` to allow access to the database from the outside:

.. code-block::
  :linenos:

  echo "host mmsuite postgres [ip-address-of-central-primary]/32 scram-sha-256" >> ./[node-2]/pg_hba.conf
  echo "host mmsuite postgres [ip-address-of-central-secondary]/32 scram-sha-256" >> ./[node-2]/pg_hba.conf
  psql -p [port] -c 'SELECT pg_reload_conf();'
