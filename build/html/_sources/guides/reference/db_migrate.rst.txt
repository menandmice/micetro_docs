.. meta::
   :description: Migrating stored data to the PostgreSQL database backend to use with Micetro by Men&Mice
   :keywords: database migration, data migration, Micetro, PostgreSQL

.. _db-migrate:

Migrate data from another database
----------------------------------

The new PostgreSQL High Availability setup has the database ``mmsuite`` but with no data. If you have a pre-existing database you need to migrate the data to the new setup.

Create a dump using ``pg_dump``:

.. code-block:: bash

  pg_dump -U postgres -p [pre-existing-database-port] -O mmsuite > mmsuite_dump.sql

If you’ve already created the mmsuite database in the HA PostgreSQL server, first drop it and recreate:

.. code-block:: bash

  psql -U postgres -p [port] -c "DROP DATABASE mmsuite;"
  psql -U postgres -p [port] -c "CREATE DATABASE mmsuite ENCODING = 'LATIN1' LC_CTYPE = 'POSIX' LC_COLLATE='POSIX' TEMPLATE template0;"

Finally execute the commands in the dump file to copy the data:

.. code-block:: bash

  psql -U postgres -p [port] -d mmsuite -f mmsuite_dump.sql
