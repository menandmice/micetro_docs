.. meta::
    :description: Setting up the database backend for Micetro on Linux
    :keywords: database, Micetro, SQLite, PostgreSQL, Linux

.. _central-database-linux:
 
Setting up the database backend on Linux 
========================================
Micetro can be used with the following databases on Linux:
 
* :ref:`SQLite<central-sqlite-linux>`
* :ref:`PostgreSQL<central-psql-unix>`

.. note::
    * High Availability for the database is only available for PostgreSQL.

    * Deploying Micetro using the Azure Marketplace configures the environment automatically for Azure SQL. Refer to :ref:`installation-azure` for details.

.. _central-sqlite-linux:

SQLite
------
Micetro Central comes with a built-in SQLite database, which is used if there is no configuration for an external database. There are no customization options for SQLite. Micetro Central will use the default configuration.
 
.. _central-psql-unix:

PostgreSQL
----------
For Micetro Central running on Linux, edit the configuration file for Micetro Central:
 
.. code-block:: bash
    
    nano /var/mmsuite/mmcentral/preferences.cfg
 
Find (or add) the following entries and configure them accordingly:
 
.. code-block::

    <database value="postgresql"/>
    <databaseserver value="HOSTNAME@DATABASE"/>
    <databaseusername value="USERNAME" />
    <databasepassword value="plaintext:PASSWORD" />

 
Definitions:
 
* ``HOSTNAME`` and ``DATABASE``: The hostname of the server running the PostgreSQL service and the system user on the server.
* ``USERNAME``: The user with read and write permissions for the PostgreSQL database.
* ``PASSWORD``: The password for the database user.
 
.. note::
    After Micetro Central starts and processes the configuration file, it automatically converts the plaintext password into a hashed format to increase security.
 
To restart Micetro Central and check its status:
 
.. code-block:: bash
    
    systemctl restart mmcentral
    systemctl status mmcentral
 
If the database connection fails, the service will not start and an error message is displayed.
 
Setting Up a PostgreSQL database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Micetro requires the creation of a new database on the database server with the UTF-8 encoding.
