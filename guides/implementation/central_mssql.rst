.. meta::
   :description: Configuring Microsoft SQL Server as the database backend for Micetro by Men&Mice
   :keywords: Microsoft SQL Server, Micetro, database, DDI database

.. _central-mssql:

Microsoft SQL Server
--------------------

.. important::
  We recommend that the network latency between the SQL Server and Men&Mice Central remains **below 5 milliseconds**. Exceeding this threshold might lead to performance issues.

  We recommend to have a dedicated database administrator (DBA) in charge of managing and maintaining the SQL Server database.

Setting up the Database
^^^^^^^^^^^^^^^^^^^^^^^

Micetro requires that you create a new database the database server. The database should use the ``SQL_Latin1_General_CP1_CS_AS`` collation. Also, make sure to have a login (either Windows or SQL server authenticated) with db_owner access to this database and an effective default schema of mmCentral.

`CreateDatabase.sql <https://github.com/menandmice/micetro_docs/blob/latest/scripts/CreateDatabase.sql>`_ is a suggested script for the database and database server setup. This script also configures the SQL server itself, which is unnecessary and undesirable in most cases. Therefore, review the script with your database administrator and only execute the necessary parts. Be sure to adjust path strings (default C:/Data) and, very importantly, the default password, which is set to "1234" in the script.

.. warning::
  The script is preconfigured for an 8-core processor machine. As a best practice, it's recommended to create one temp file for each processor core. If you have a 2-core machine, comment out the last 6 temp file creation commands in the script.

.. danger::
  Running the script will drop the existing database using the name "mmsuite" without confrimation, so consider making a manual backup to prevent data loss.

After running the script, it will create:

* a user "mmSuiteDBUser" with the specified password.
* an empty database named "mmsuite" with the ``COLLATE SQL_Latin1_General_CP1_CS_AS`` collation.


Configuring Connection Parameters
"""""""""""""""""""""""""""""""""

If you're configuring MS SQL on a dedicated server, make sure to `enable the TCP/IP protocol with the SQL Configuration Manager <https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/enable-or-disable-a-server-network-protocol?redirectedfrom=MSDN&view=sql-server-ver15>`_.

.. _central-mssql-windows:

Additionally, you'll need to `install an ODBC driver on the Central server to be able to use Microsoft SQL Server <https://docs.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver15>`_.
  
For Men&Mice Central on Windows
********************************

To use Windows Authentication with Micetro and Microsoft SQL Server, ensure that Men&Mice Central runs under an Active Directory service account that is a member of the local administrators group.

The ``preferences.cfg`` file in the data directory contains four XML tags beside the "password" XML-tag for Central: ``database``, ``databaseserver``, ``databaseusername`` and ``databasepassword``.

Here's how the file should look for normal user/password authentication:

.. code-block::

  <password value="plaintext:PASSWORD"/>
  <database value="MSSQL"/>
  <databaseserver value="<name or IP of the SQL server>\<instance name, e.g., SQLEXPRESS>@<database name, e.g., micetro"/>
  <databaseusername value="mmSuiteDBUser"/>
  <databasepassword value="plaintext:DBPASSWORD"/>

The ``plaintext:`` prefix in the password inputs allows you to enter the passwords in plaintext. Men&Mice Central will automatically encrypt and replace them with the hash during the initial startup.

Here's an example of how the ``preferences.cfg`` file should look like for the Windows Authentication method. Note that the "databaseusername" tag must be present and the "value" attribute must be set to an empty string.
.. code-block::

  <password value="the fingerprint hash"/>
  <database value="MSSQL"/>
  <databaseserver value="<name or ip of the SQL server>\<name of instance, e.g., SQLEXPRESS>@<name of database, e.g., mmsuite"/>
  <databaseusername value=""/>


For Men&Mice Central on Linux
******************************
To configure Men&Mice Central on Linux, navigate to the data directory (usually located at ``/var/mmsuite/mmcentral``) and edit the ``preferences.cfg`` file with in that directory as follows:

.. code-block::

  <Database value="MSSQL" />
  <DatabaseServer value="ip/dns name of SQL server><,port>\<Instance name>@<Database name>" />
  <DatabaseUsername value="mmSuiteDBUser" />
  <DatabasePassword value="plaintext:<your password here>" />

.. note::
  If the ``DatabasePassword`` value is prefixed by ``plaintext:``, Men&Mice Central will replace it with a password hash during startup.

Connecting to the MS SQL Database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

After configuring your preferences, restart the Men&Mice Central service. This should connect the Men&Mice Central to your freshly created database. The database schema (tables, etc.) will be created during the first connection.

Once your database is set up, you can proceed with the normal installation procedure. Be sure to restart Men&Mice Central and verify it’s running smoothly:

.. code-block:: bash

  systemctl restart mmcentral
  systemctl status mmcentral

If there are any database connection issues, the service will fail to start and display the relevant error message.
