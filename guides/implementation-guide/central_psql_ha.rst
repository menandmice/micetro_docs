.. _central-psql-ha:

Connect Central to the PostgreSQL high availability cluster
-----------------------------------------------------------

Machine: monitor
""""""""""""""""

To see the connection string we run this command on the monitor machine:

``pg_autoctl show uri --formation default --pgdata ./[monitor]``

The connection string will look somewhat like this:

.. code-block::

  postgres://[node-1]:[port],[node-2]:[port]/postgres?target_session_attrs=read-write

But we have to change to this (postgres to mmsuite):

.. code-block::

  postgres://[node-1]:[port],[node-2]:[port]/mmsuite?target_session_attrs=read-write

Machine: central-primary
""""""""""""""""""""""""

Update the /etc/hosts file:

``echo "[ip-address-node-1] [node-1]" >> /etc/hosts``
``echo "[ip-address-node-2] [node-2]" >> /etc/hosts``

Add this to the Men&Mice Central ``preferences.cfg`` file:

.. code-block::

  <Database value="postgresql"/>
  <DatabaseServer value="postgres://[node-1]:[port],[node-2]:[port]/mmsuite?target_session_attrs=read-write" />
  <DatabaseUsername value="postgres" />
  <DatabasePassword value="plaintext:[postgres-password]" />
  <DatabaseConnectionPolling value="1" />

Machine: central-secondary
""""""""""""""""""""""""""

Update the /etc/hosts file:

``echo "[ip-address-node-1] [node-1]" >> /etc/hosts``
``echo "[ip-address-node-2] [node-2]" >> /etc/hosts``

Add this to the Men&Mice Central ``preferences.cfg`` file:

.. code-block::

  <Database value="postgresql"/>
  <DatabaseServer value="postgres://[node-1]:[port],[node-2]:[port]/mmsuite?target_session_attrs=read-write" />
  <DatabaseUsername value="postgres" />
  <DatabasePassword value="plaintext:[postgres-password]" />
  <DatabaseConnectionPolling value="1" />
