.. meta::
   :description: Configuring Microsoft SQL Server as the database backend for Micetro by Men&Mice
   :keywords: Microsoft SQL Server, Micetro, database, DDI database

.. _central-mssql:

Microsoft SQL Server
--------------------

.. important::
  We recommend that the network latency between the SQL Server and Micetro Central remains **below 5 milliseconds**. Exceeding this threshold may cause performance issues.

  It is recommended to have a dedicated database administrator (DBA) to manage and maintain the SQL Server database.

Setting up the Database
^^^^^^^^^^^^^^^^^^^^^^^

Micetro requires that you create a new database on the database server with the ``SQL_Latin1_General_CP1_CS_AS`` collation. Also, ensure a login (either Windows or SQL server authenticated) with ``db_owner`` access to this database and the default schema set to ``mmCentral``.

`CreateDatabase.sql <https://github.com/menandmice/micetro_docs/blob/latest/scripts/CreateDatabase.sql>`_ is a suggested script for the database and database server setup. This script also configures the SQL server itself, which is unnecessary and undesirable in most cases. Therefore, review the script with your DBA and only execute the necessary parts. Adjust the path strings (default is ``C:/Data``) and change the default password, which is set to ``1234`` in the script.

.. warning::
  The script is configured for an 8-core processor machine. As a best practice, it's recommended to create one temp file for each processor core. If using a 2-core machine, comment out the last 6 temp file creation commands in the script.

.. danger::
  Running the script will drop the existing database named "mmsuite" without confirmation. Make a manual backup to avoid data loss.

Running the script will create:

* A user ``mmSuiteDBUser`` with the specified password.
* An empty database named ``mmsuite`` with the ``COLLATE SQL_Latin1_General_CP1_CS_AS`` collation.


Configuring Connection Parameters
"""""""""""""""""""""""""""""""""
.. _central-mssql-windows:

.. note::
   To improve your compatibility with Microsoft SQL Server, you need to `install ODBC driver on the Central server <https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver15>`_.

For Micetro Central on Windows
********************************

For Micetro Central on Windows, you have two authentication methods to choose from:

1. **Windows Authentication**:
   
   Ensure that Micetro Central runs under an Active Directory service account that is a member of the local administrators group.

   Here's an example of how the ``preferences.cfg`` file should look like for the Windows Authentication method. Note that the ``databaseusername`` tag must be present and the ``value`` attribute must be set to an empty string.

   .. code-block::

     <password value="the fingerprint hash"/>
     <database value="MSSQL"/>
     <databaseserver value="<name or ip of the SQL server>\<instance name, e.g., SQLEXPRESS>@<name of database, e.g., mmsuite"/>
     <databaseusername value=""/>

2. **Normal User/Password Authentication**:

   For this method, configure the ``preferences.cfg`` file as follows:

   .. code-block::

     <password value="the fingerprint hash"/>
     <database value="MSSQL"/>
     <databaseserver value="<name or IP of the SQL server>\<instance name, e.g., SQLEXPRESS>@<database name, e.g., micetro"/>
     <databaseusername value="mmSuiteDBUser"/>
     <databasepassword value="plaintext:DBPASSWORD"/>

   With this approach, you can use a dedicated SQL Server user for authentication. The ``plaintext:`` prefix in the database password input allows the password to be entered in plaintext, which Micetro Central will encrypt during the initial startup.


For Micetro Central on Linux
******************************
Navigate to the data directory (usually located at ``/var/mmsuite/mmcentral``) and edit the ``preferences.cfg`` file as follows:

.. code-block::

  <Database value="MSSQL" />
  <DatabaseServer value="ip/dns name of SQL server><,port>\<Instance name>@<Database name>" />
  <DatabaseUsername value="mmSuiteDBUser" />
  <DatabasePassword value="plaintext:<your password here>" />


If the ``DatabasePassword`` value is prefixed by ``plaintext:``, Micetro Central will replace it with a password hash during startup.

Connecting to the MS SQL Database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After configuring the preferences, restart the Micetro Central service. This will connect Micetro Central to your newly created database. The database schema will be created during the first connection.

Restarting Mictro Central
^^^^^^^^^^^^^^^^^^^^^^^^^
Verify the service is running smoothly:

.. code-block:: bash

  systemctl restart mmcentral
  systemctl status mmcentral

If there are any database connection issues, the service will fail to start. Check the Central startup log for errors, located in the Central data directory at either ``/var/mmsuite/mmcentral/logs`` or ``C:\ProgramData\Men and Mice\Central\logs``.
