.. meta::
    :description: Setting up the database backend for Micetro on Windows
    :keywords: database, Micetro, SQLite, Microsoft SQL Server, PostgreSQL, Windows
 
.. _central-database-windows:
 
Setting up the database backend on Windows
==========================================
 
Micetro can be used with the following databases on Windows:
 
* :ref:`SQLite<central-sqlite-windows>`
* :ref:`Microsoft SQL Server<central-mssql-windows>`
* :ref:`PostgreSQL<central-postgresql-windows>`
 
.. note::
    * High Availability for the database is only available for MS SQL and PostgreSQL.
 
    * Deploying Micetro using the Azure Marketplace configures the environment automatically for Azure SQL. Refer to :ref:`installation-azure` for details.
 
.. _central-sqlite-windows:

SQLite
------
The Micetro Central application comes with a built-in SQLite database, which is used if there is no configuration for an external database. There are no customization options for SQLite. Micetro Central will use the default configuration.
 
If you want to migrate the Micetro database from SQLite to Microsoft SQL Server, refer to :ref:`migrate-sqlite-sql-server`.
 
.. _central-mssql-windows:
 
Microsoft SQL Server
--------------------
 
.. important::
    It is recommended to keep the network latency between the SQL Server and Micetro Central **below 5 milliseconds**. Latency above this level can lead to performance issues.
 
    Micetro does not automatically perform index maintenance or database backups. It is recommended to have a database administrator set up a scheduled task to maintain indexes and regularly back up the database and transaction logs (when using the Full recovery model).
 
Micetro requires the creation of a new database on your server with a case-sensitive and accent-sensitive collation. For SQL Server 2019 or later, it is recommended to use a UTF-8 collation, such as ``Latin1_General_100_CS_AS_KS_WS_SC_UTF8``. For earlier SQL Server versions or Micetro versions 11.0 and below, the recommended collation is ``SQL_Latin1_General_CP1_CS_AS``. We recommend using the `Microsoft ODBC driver <https://learn.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server>`_ --- either version 17 or 18 --- for SQL Server. This is required when using UTF-8 encoded collations. Otherwise, Micetro will connect to a database using older drivers, which could result in issues such as degraded performance.

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
 
For Micetro Central on Windows, you can choose from two authentication methods:
 
1. **Windows Authentication**:
    
   Ensure that Micetro Central runs under an Active Directory service account that is a member of the local administrators group.
 
   Here's an example of how the ``preferences.cfg`` file should look for the Windows Authentication method. Note that the ``databaseusername`` tag must be present and the value must be set to an empty string.
 
   .. code-block::
            
    <database value="MSSQL"/>
    <databaseserver value="<name or ip of the SQL server>\<instance name, e.g., SQLEXPRESS>@<name of database, e.g., micetro/>
    <databaseusername value=""/>
 
2. **Normal User/Password Authentication**:
 
   For this method, configure the ``preferences.cfg`` file as follows:
 
   .. code-block::
    
    <database value="MSSQL"/>
    <databaseserver value="<name or IP of the SQL server>\<instance name, e.g., SQLEXPRESS>@<database name, e.g., micetro"/>
    <databaseusername value="mmSuiteDBUser"/>
    <databasepassword value="plaintext:DBPASSWORD"/>
 
   With this approach, you can use a dedicated SQL Server user for authentication. The ``plaintext:`` prefix in the database password input allows the password to be entered in plaintext, which Micetro Central will encrypt during the initial startup.
 
Connecting to the MS SQL database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
After configuring the preferences, restart the Micetro Central service. This connects Micetro Central to your newly created database. The database schema is created during the first connection.
 
Restarting Micetro Central
^^^^^^^^^^^^^^^^^^^^^^^^^^
Verify the service is running smoothly:
 
.. code-block:: bash
    
    systemctl restart mmcentral
    systemctl status mmcentral
 
If there are any database connection issues, the service will fail to start. Check the Micetro Central startup log for errors. The log is located in the Micetro Central data directory at ``C:\ProgramData\Men and Mice\Central\logs``.
 
.. _central-postgresql-windows:
 
PostgreSQL
----------
For Micetro Central running on Windows, the ``preferences.cfg`` file located in the data directory contains, in addition to the fingerprint of Central (the ``password`` preference), four other preferences: ``database``, ``databaseserver``, ``databaseusername`` and ``databasepassword``.
 
The ``preferences.cfg`` file for standard user/password authentication should look like this:
 
.. code-block::
    
    <database value="postgresql"/>
    <databaseserver value="<name or IP of the PostgreSQL server>\<instance name, for example, PSQLDB>@<database name, for example, mmsuite"/>
    <databaseusername value="mmSuiteDBUser"/>
    <databasepassword value="password hash"/>
 
For the Windows Authentication method, an example ``preferences.cfg`` file would look like this:
 
.. code-block::
    
    <database value="postgresql"/>
    <databaseserver value="<name or ip of the PostgreSQL server>\<instance name, for example, PSQLDB>@<database name, for example, mmsuite"/>
    <databaseusername value=""/>
 
.. note::
    The ``databaseusername`` preference must be included and its value attribute should be an empty string.
 
Setting Up a PostgreSQL database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Micetro requires the creation of a new database on the database server with the UTF-8 encoding.
