.. meta::
    :description: Setting up the database backend for Micetro on Linux
    :keywords: database, Micetro, SQLite, Microsoft SQL Server, PostgreSQL, Linux

.. _central-database-linux:
 
Setting up the database backend on Linux 
========================================
Micetro can be used with the following databases:
 
* :ref:`SQLite<central-sqlite-linux>`
* :ref:`Microsoft SQL Server<central-mssql-linux>`
* :ref:`PostgreSQL<central-psql-unix>`

.. note::
    * High Availability for the database is only available for MS SQL and PostgreSQL.

    * Deploying Micetro using the Azure Marketplace configures the environment automatically for Azure SQL. Refer to :ref:`installation-azure` for details.

.. _central-sqlite-linux:

SQLite
------
Micetro Central comes with a built-in SQLite database, which is used if there is no configuration for an external database. There are no customization options for SQLite. Micetro Central will use the default configuration.
 
If you want to migrate the Micetro database from SQLite to Microsoft SQL Server, refer to :ref:`migrate-sqlite-sql-server`.
 
.. _central-mssql-linux:
 
Microsoft SQL Server
--------------------

.. important::
   It is recommended to keep the network latency between the SQL Server and Micetro Central **below 5 milliseconds**. Latency above this level can lead to performance issues.
 
   Micetro does not automatically perform index maintentance or database backups. It's recommended to have a database administrator set up a scheduled task to maintain indexes and regularly back up the database and transaction logs, (when using the Full recovery model).
 
Micetro requires the creation of a new database on your server with a case-sensitive and accent-sensitive collation. For SQL Server 2019 or later, it is recommended to use a UTF-8 collation, such as ``Latin1_General_100_CS_AS_KS_WS_SC_UTF8``. For earlier SQL Server versions or Micetro versions 11.0 and below, the recommended collation is ``SQL_Latin1_General_CP1_CS_AS``.
 
The `CreateDatabase.sql <https://github.com/menandmice/micetro_docs/blob/latest/scripts/CreateDatabase.sql>`_ script can be used to create a blank database for Micetro with the recommended configurations. The script also creates a user account called ``micetroDBUser``, but you must change the password before running the script. 
 
Running the script will result in:
 
* The creation of a user named ``micetroDBUser`` with a given password.
* The establishment of an empty database named ``micetro`` with the ``Latin1_General_100_CS_AS_KS_WS_SC_UTF8`` collation.
 
.. note::
    The default recovery model for the created database is Simple. If you want to use a Full recovery model, it is necessary to set up a transaction log backup job.

Configuring connection parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
.. note::
    To improve your compatibility with Microsoft SQL Server, you need to `install ODBC driver on the Central server <https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver15>`_.
 
Navigate to the data directory (usually located at ``/var/mmsuite/mmcentral``) and edit the ``preferences.cfg`` file as follows:
 
.. code-block::
    
    DatabaseType = MSSQL
    DatabaseServer = "<ip/dns name of SQL server><,port>\<Instance name>@<Database name>"
    DatabaseUsername = mmSuiteDBUser
    DatabasePassword = "plaintext:<your password here>"
 
 
If the ``DatabasePassword`` value is prefixed by ``plaintext:``, Micetro Central will replace it with a password hash during startup.
 
Connecting to the MS SQL database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
After configuring the preferences, restart the Micetro Central service. This connects Micetro Central to your newly created database. The database schema is created during the first connection.

Restarting Micetro Central
^^^^^^^^^^^^^^^^^^^^^^^^^^
Verify the service is running smoothly:
 
.. code-block:: bash
    
    systemctl restart mmcentral
    systemctl status mmcentral
 
If there are any database connection issues, the service will fail to start. Check the Micetro Central startup log for errors. The log is located in the Micetro Central data directory at ``/var/mmsuite/mmcentral/logs``.
 
.. _central-psql-unix:

PostgreSQL
----------
For Micetro Central running on Linux, edit the configuration file for Micetro Central:
 
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
    After Micetro Central starts and processes the configuration file, it automatically converts the plaintext password into a hashed format to increase security.
 
To restart Micetro Central and check its status:
 
.. code-block:: bash
    
    systemctl restart mmcentral
    systemctl status mmcentral
 
If the database connection fails, the service will not start and an error message is displayed.
 
Setting Up a PostgreSQL database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Micetro requires the creation of a new database on the database server with the UTF-8 encoding.
