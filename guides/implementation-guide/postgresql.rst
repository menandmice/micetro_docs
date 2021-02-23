.. _postgresql:

PostgreSQL
==========

Setting up PostgreSQL
---------------------

.. note::
  Men&Mice uses ``pg_auto_failover`` for PostgreSQL high availability. Refer to `their documentation <https://pg-auto-failover.readthedocs.io/en/latest/>`_ for more details about different configurations.

  The setup presented here will establish resilience against losing any one of the configured three nodes.

.. image:: ../../images/postgres_ha.png

.. csv-table:: Variables
  :header: "Name", "Description", "Example value"
  :widths: 20, 60, 20

  "``[port]``", "The port number that will be used for communication between database nodes", "5000"
  "``[monitor]``", "The monitor node’s machine hostname", "postgresql-node-0"
  "``[node-1]``", "The primary node’s machine hostname", "postgresql-node-1"
  "``[node-2]``", "The secondary node’s machine hostname", "postgresql-node-2"
  "``[ip-address-monitor-machine]``", "The monitor node’s machine IP address", "172.17.0.2"
  "``[ip-address-node-1]``", "The machine’s IP address of node-1", "172.17.0.3"
  "``[ip-address-node-2]``", "The machine’s IP address of node-2", "172.17.0.4"
  "``[monitor_node_password]``", "The monitor node’s password to its database. **This password cannot contain the *@* character.**", "test123"
  "``[replication-password]``", "The password used for replication between nodes", "vg8@urenHfhk"
  "``[postgres-password]``", "The password used to access the mmsuite database", "postgres"
  "``[ip-address-of-central-primary]``", "The IP address of the *primary* machine running Central", "172.17.0.5"
  "``[ip-address-of-central-secondary]``", "The IP address of the machine running the *secondary* Central", "172.17.0.6"
  "``[pre-existing-database-port]``", "The port of the pre-existing database (if any)", "5432"

Make sure that the hostnames are resolvable between all three machines along with the machine running Central (and the second instance if Central is running in HA mode).
If that is not possible, using the ip-addresses instead of hostnames is allowed.

Install requirements
^^^^^^^^^^^^^^^^^^^^

Install ``sudo`` and ``which``:

.. code-block:: bash

  yum install sudo
  yum install which

Enable the package repository that distributes ``pg_auto_failover``:

.. code-block:: bash

  curl https://install.citusdata.com/community/rpm.sh | sudo bash

Install ``pg_auto_failover`` for PostgreSQL 12:

.. code-block:: bash

  sudo yum install -y pg-auto-failover10_12

If you will be using hostnames, edit ``/etc/hosts``:

.. code-block:: bash

  echo "[ip-address-monitor-machine] [monitor]" >> /etc/hosts
  echo "[ip-address-node-1] [node-1]" >> /etc/hosts
  echo "[ip-address-node-2] [node-2]" >> /etc/hosts
