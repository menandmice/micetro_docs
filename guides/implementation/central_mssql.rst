.. meta::
   :description: Configuring Microsoft SQL Server as the database backend for Micetro
   :keywords: Microsoft SQL Server, Micetro, database, DDI database

.. _central-mssql:

Microsoft SQL Server
--------------------

.. important::
  It is recommended to keep the network latency between the SQL Server and Micetro Central **below 5 milliseconds**. Latency above this level can lead to performance issues.

  It is recommended to have a dedicated database administrator (DBA) to manage and maintain the SQL Server database.

Setting up the Database
^^^^^^^^^^^^^^^^^^^^^^^

Micetro requires the creation of a new database on your server with the ``Latin1_General_100_CS_AS_KS_WS_SC_UTF8`` collation. Make sure there is a login (either Windows or SQL server authenticated) with ``db_owner`` privileges for this database and set the default schema set to ``mmCentral``.

The `CreateDatabase.sql <https://github.com/menandmice/micetro_docs/blob/latest/scripts/CreateDatabase.sql>`_ is recommended for setting up the database and server. However, it also includes configurations for the SQL server that may not be needed for desired. Work with your DBA to review the script and execute only the necessary sections. Adjust the path strings (default is ``C:/Data``) and update the default password from ``1234``  as specified in the script.

.. warning::
  The script is configured for an 8-core processor. It's advisable to have one temp file per processor core. For a 2-core processor, omit the commands to create the last 6 temp files.

.. danger::
  Running the script will remove any existing "mmsuite" database without warning. To prevent data loss, perform a manual backup.

Running the script will result in:

* The creation of a user named ``mmSuiteDBUser`` with a given password.
* The establishment of an empty database named ``mmsuite`` with the ``COLLATE SQL_Latin1_General_CP1_CS_AS`` collation.


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

Restarting Micetro Central
^^^^^^^^^^^^^^^^^^^^^^^^^^
Verify the service is running smoothly:

.. code-block:: bash

  systemctl restart mmcentral
  systemctl status mmcentral

If there are any database connection issues, the service will fail to start. Check the Central startup log for errors, located in the Central data directory at either ``/var/mmsuite/mmcentral/logs`` or ``C:\ProgramData\Men and Mice\Central\logs``.
