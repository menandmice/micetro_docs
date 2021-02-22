.. _ha-tweaks-psql:

PostgreSQL
==========

Lower timeout threshold
-----------------------

Machine: monitor
""""""""""""""""

We want to lower the database timeout value, i.e. when the failover should be performed if the primary database is unreachable:

.. code-block::

  psql -p [port] -d pg_auto_failover
  # List the health_check variables
  SELECT name, setting FROM pg_settings WHERE name ~ 'pgautofailover\.health';
  # Check status of database every 5s, setthe timeout to 2s and set the node unhealthy timeout to 5s
  ALTER SYSTEM SET pgautofailover.health_check_period TO 5000;
  ALTER SYSTEM SET pgautofailover.health_check_timeout TO 2000;
  ALTER SYSTEM SET pgautofailover.node_considered_unhealthy_timeout TO 5000;
  # Reload config:
  select pg_reload_conf();
  # Verify changes
  SELECT name, setting FROM pg_settings WHERE name ~ 'pgautofailover\.health';
  SELECT name, setting FROM pg_settings WHERE name ~ 'pgautofailover\.node';

II/2.2.2. Create a startup service
""""""""""""""""""""""""""""""""""

For each machine create a startup service that runs the pg_autoctl process:

**Machine: monitor**

.. code-block:: bash

  pg_autoctl -q show systemd --pgdata /var/lib/pgsql/[monitor]/ | sudo tee /etc/systemd/system/pgautofailover.service
  systemctl enable pgautofailover.service

**Machine: node-1**

..code-block:: bash

  pg_autoctl -q show systemd --pgdata /var/lib/pgsql/[node-1]/ | sudo tee /etc/systemd/system/pgautofailover.service
  systemctl enable pgautofailover.service

**Machine: node-2**

.. code-block:: bash

  pg_autoctl -q show systemd --pgdata /var/lib/pgsql/[node-2]/ | sudo tee /etc/systemd/system/pgautofailover.service
  systemctl enable pgautofailover.service

Configuring PostgreSQL logging
------------------------------

**Machine: monitor**

.. code-block::

  sudo su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  psql -p [port]
  ALTER SYSTEM SET log_truncate_on_rotation = 'on';
  ALTER SYSTEM SET log_filename = 'postgresql-%a.log';
  ALTER SYSTEM SET log_rotation_age = '1440';
  ALTER SYSTEM SET log_line_prefix = '%m - %l - %p - %h - %u@%d - %x';
  ALTER SYSTEM SET log_directory = 'pg_log';
  ALTER SYSTEM SET log_min_messages = 'WARNING';
  ALTER SYSTEM SET log_min_error_statement = 'NOTICE';
  ALTER SYSTEM SET log_min_duration_statement = '10s';
  ALTER SYSTEM SET log_checkpoints = 'on';
  ALTER SYSTEM SET log_lock_waits = 'on';
  ALTER SYSTEM SET log_temp_files = '0';
  ALTER SYSTEM SET log_connections=on;
  ALTER SYSTEM SET log_disconnections=on;
  ALTER SYSTEM SET log_duration=on;
  SELECT pg_reload_conf();

**Machine: node-1**

.. code-block:: bash

  sudo su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  psql -p [port]
  ALTER SYSTEM SET log_truncate_on_rotation = 'on';
  ALTER SYSTEM SET log_filename = 'postgresql-%a.log';
  ALTER SYSTEM SET log_rotation_age = '1440';
  ALTER SYSTEM SET log_line_prefix = '%m - %l - %p - %h - %u@%d - %x';
  ALTER SYSTEM SET log_directory = 'pg_log';
  ALTER SYSTEM SET log_min_messages = 'WARNING';
  ALTER SYSTEM SET log_min_error_statement = 'NOTICE';
  ALTER SYSTEM SET log_min_duration_statement = '10s';
  ALTER SYSTEM SET log_checkpoints = 'on';
  ALTER SYSTEM SET log_lock_waits = 'on';
  ALTER SYSTEM SET log_temp_files = '0';
  ALTER SYSTEM SET log_connections=on;
  ALTER SYSTEM SET log_disconnections=on;
  ALTER SYSTEM SET log_duration=on;
  SELECT pg_reload_conf();

**Machine: node-2**

.. code-block::

  sudo su - postgres
  export PATH="$PATH:/usr/pgsql-12/bin"
  psql -p [port]
  ALTER SYSTEM SET log_truncate_on_rotation = 'on';
  ALTER SYSTEM SET log_filename = 'postgresql-%a.log';
  ALTER SYSTEM SET log_rotation_age = '1440';
  ALTER SYSTEM SET log_line_prefix = '%m - %l - %p - %h - %u@%d - %x';
  ALTER SYSTEM SET log_directory = 'pg_log';
  ALTER SYSTEM SET log_min_messages = 'WARNING';
  ALTER SYSTEM SET log_min_error_statement = 'NOTICE';
  ALTER SYSTEM SET log_min_duration_statement = '10s';
  ALTER SYSTEM SET log_checkpoints = 'on';
  ALTER SYSTEM SET log_lock_waits = 'on';
  ALTER SYSTEM SET log_temp_files = '0';
  ALTER SYSTEM SET log_connections=on;
  ALTER SYSTEM SET log_disconnections=on;
  ALTER SYSTEM SET log_duration=on;
  SELECT pg_reload_conf();
