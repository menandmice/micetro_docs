.. meta::
   :description: Configuring PostgreSQL as the database backend for Micetro
   :keywords: PostgreSQL, Micetro, database, DDI database

.. _central-postgresql:

PostgreSQL
----------

.. _central-psql-unix:

Micetro Central Running on Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Edit the configuration file for Micetro Central:

.. code-block:: bash

  nano /var/mmsuite/mmcentral/preferences.cfg

Find (or add) the following entries and configure them accordingly:

.. code-block::

  DatabaseType = postgresql
  DatabaseServer = "HOSTNAME@DATABASE"
  DatabaseUsername = "USERNAME"
  DatabasePassword = "plaintext:PASSWORD"

Definitions:

* ``HOSTNAME`` and ``DATABASE``: The hostname of the server running the PostgreSQL service and the system user on the server.
* ``USERNAME``: The user with read and write permissions for the PostgreSQL database.
* ``PASSWORD``: The password for the database user.

.. note::
  After Central starts and processes the configuration file, it will automatically convert the plaintext password into a hashed format to increase security.

To restart Central and check its status:

.. code-block:: bash

  systemctl restart mmcentral
  systemctl status mmcentral

If the database connection fails, the service will not start and an error message will be displayed.

.. _central-psql-windows:

Micetro Central Running on Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The preferences.cfg file located in the data directory contains, in addition to the fingerprint of Central (the "password" XML tag), four other XML tags: ``DatabaseType``, ``DatabaseServer``, ``DatabaseUsername`` and ``DatabasePassword``.

The preferences.cfg file for standard user/password authentication should look like this:

.. code-block::

  Password = "the fingerprint hash"
  DatabaseType = postgresql
  DatabaseServer = "<name or IP of the PostgreSQL server>\<instance name, for example, PSQLDB>@<database name, for example, mmsuite>"
  DatabaseUsername = mmSuiteDBUser
  DatabasePassword = "password hash"

For the Windows Authentication method, an example preferences.cfg file would look like  this (the ``DatabaseUsername`` tag must be included and its value attribute should be an empty string):

.. code-block::

  Password = "the fingerprint hash"
  DatabaseType = postgresql
  DatabaseServer = "<name or ip of the PostgreSQL server>\<instance name, for example, PSQLDB>@<database name, for example, mmsuite>"
  DatabaseUsername = ""

Setting Up a PostgreSQL Database
--------------------------------
Micetro requires the creation of a new database on the database server with the UTF-8 encoding.
