.. meta::
   :description: Configuring Microsoft SQL Server as the database backend for Micetro
   :keywords: Microsoft SQL Server, Micetro, database, DDI database

.. _central-mssql:

Microsoft SQL Server
--------------------

.. important::
  It is recommended to keep the network latency between the SQL Server and Micetro Central **below 5 milliseconds**. Latency above this level can lead to performance issues.

  Micetro does not automatically perform index maintentance or database backups. It is recommended to have a database administrator set up a scheduled task to maintain indexes and regularly back up the database and transaction logs, (when using the Full recovery model).

Setting up the Database
^^^^^^^^^^^^^^^^^^^^^^^

Micetro requires the creation of a new database on your server with a case-sensitive and accent-sensitive collation. For SQL Server 2019 or later, it is recommended to use a UTF8 collation such as ``Latin1_General_100_CS_AS_KS_WS_SC_UTF8``. For earlier SQL Server versions or Micetro versions 11.0 and below, the recommended collation is ``SQL_Latin1_General_CP1_CS_AS``.

The `CreateDatabase.sql <https://github.com/menandmice/micetro_docs/blob/latest/scripts/CreateDatabase.sql>`_  script can be used to create a blank database for Micetro with the recommended configurations. The script also creates a user account called ``micetroDBUser``, but you must change the password before running the script. 

Running the script will result in:

* The creation of a user named ``micetroDBUser`` with a given password.
* The establishment of an empty database named ``micetro`` with the ``Latin1_General_100_CS_AS_KS_WS_SC_UTF8`` collation.

.. note::
  The default recovery model for the created database is Simple. If you want to use a Full recovery model, it is necessary to set up a transaction log backup job.


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
