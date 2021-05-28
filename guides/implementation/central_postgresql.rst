.. meta::
   :description: Configuring PostgreSQL as the database backend for Micetro by Men&Mice
   :keywords: PostgreSQL, Micetro, database, DDI database 

.. _central-postgresql:

PostgreSQL
----------

.. _central-psql-unix:

Men&Mice Central running on Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Edit the configuration file for Men&Mice Central:

.. code-block:: bash

  nano /var/mmsuite/mmcentral/preferences.cfg

Find (or create) and set the following values:

.. code-block::
  :linenos:

  <database value="postgresql"/>
  <databaseserver value="HOSTNAME@DATABASE"/>
  <databaseusername value="USERNAME" />
  <databasepassword value="plaintext:PASSWORD" />

Where

* ``HOSTNAME`` and ``DATABASE``: the server’s hostname running the PostgreSQL service, and the system user on the server
* ``USERNAME``: the user with permissions to read and write the PostgreSQL database
* ``PASSWORD``: the database user’s password

.. note::
  Once Central starts and reads the configuration file, it’ll automatically change the plaintext password to hashed, to increase security.

Restart Central and verify it’s running:

.. code-block:: bash

  systemctl restart mmcentral
  systemctl status mmcentral

If the database connection fails, the service will fail to start with the appropriate error message.

Proceed to :ref:`psql-ha`, :ref:`central-ha`, or :ref:`install-controllers`.

.. _central-psql-windows:

Men&Mice Central running on Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The preferences.cfg file in the data directory contains (beside the fingerprint of Central, i.e. the "password" XML-tag) four additional XML tags: database, databaseserver, databaseusername and databasepassword

The preferences.cfg file for normal user/password authentication should look like:

.. code-block::
  :linenos:

  <password value="the fingerprint hash"/>
  <database value="postgresql"/>
  <databaseserver value="<name or ip of the PostgreSQL server>\<name of instance, e.g. PSQLDB>@,<name of database, e.g. mmsuite"/>
  <databaseusername value="mmSuiteDBUser"/>
  <databasepassword value="password hash"/>

An example preferences.cfg file for the Windows Authentication method should look like (databaseusername tag must be present and the value attribute must be set to empty string):

.. code-block::
  :linenos:

  <password value="the fingerprint hash"/>
  <database value="postgresql"/>
  <databaseserver value="<name or ip of the PostgreSQL server>\<name of instance, e.g. PSQLDB>@,<name of database, e.g. mmsuite"/>
  <databaseusername value=""/>

Proceed to :ref:`psql-ha`, :ref:`central-ha`, or :ref:`install-controllers`.
