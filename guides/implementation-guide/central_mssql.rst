.. _central-mssql:

Microsoft SQL Server
--------------------

.. warning::
  We recommend that the network latency between the SQL server and M&M Central is **no more than 5 ms**. Otherwise, the performance of M&M in conjunction with SQL Server can't be guaranteed to be acceptable.
  We recommend that the SQL Server database is managed and maintained by a database administrator (DBA).

Setting up the Database
^^^^^^^^^^^^^^^^^^^^^^^

Men & Mice requires that a blank database is created on the database server, with the collation SQL_Latin1_General_CP1_CS_AS, and a login (Windows or SQL server authenticated) that has db_owner access to that database and an effective default schema of mmCentral.

The attached CreateDatabase.sql is a suggestion for the database and database server setup.  Please note that this script also configures the SQL server itself, which is unnecessary and undesirable in most cases. Therefore, review the script with your database administrator and only run appropriate parts of it.

Before you run the script please go through the script and change the necessary entries accordingly. This includes path strings (default C:/Data) and very important also the password, which is set by default to "1234" in the script!

.. warning::
  The script is preconfigured for an 8 core processor machine, i.e. as a best practice we recommend to create for each processor core one temp file. If you have only a two core machine please comment out the last 6 temp file creation commands in the script.

.. danger::
  The script will, without confirmation, drop the existing database using the name "mmsuite"! Make a manual backup to avoid possible data loss.

Subsequently the script will create:

* a user "mmSuiteDBUser" with the password that you have inserted in the script.
* an empty database with the name "mmsuite" and the following collation:
  ``COLLATE SQL_Latin1_General_CP1_CS_AS``

.. information::
  For further details take a look at the CreateDatabase.sql script.

Configuring the connection parameters

.. warning::
  If it's a dedicated server please don't forget to `enable the TCP/IP protocol with the SQL Configuration Manager <https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/enable-or-disable-a-server-network-protocol?redirectedfrom=MSDN&view=sql-server-ver15>`_.

.. _central-mssql-windows:

Men&Mice Central running on Windows
"""""""""""""""""""""""""""""""""""

.. note::
  Please note that the following needs to be run from the data directory, i.e. the same directory that contains the preferences file for Central. Otherwise the connection information for SQL Server will not be appended to the preferences file.

1. Download the `Men&Mice mmdbprefs.exe tool <ftp://ftp.menandmice.com/pub/mmsuite/misc/dbprefstool/mmdbprefs.exe>`_.

2. Copy the mmdbprefs.exe into the data directory of the Men&Mice Central.

  Usually located in one of these locations:
  * C:\Program Files\Men and Mice\Central\Data
  * C:\Program Files(x86)\Men and Mice\Central\Data
  * C:\ProgramData\Men and Mice\Central (Windows Server 2008 R2 and later)

Start the mmdbprefs.exe tool with a double-click, and proceed with the configuration wizard:

.. code-block::

  Choose database provider to use:

        1. SQLite
        2. MSSQL

Select **2** for MS SQL, and press *Enter*.

.. code-block::

  Enter database server:
  >

Type in the database server in the following format:

.. code-block::
  :linenos:

  <ip/dns name of SQL server><,port>\<Instance name>@<Database name>

  For example:
  192.168.2.12\INSTANCENAME@databasename
  or
  192.168.2.12,1433@databasename

Press *Enter* to continue.

.. code-block::

  Enter database user name:
  >

Type in the username ("mmSuiteDBUser" in the example script) that will be used to connect to your database instance on the specified SQL server, and press Enter.

..note::
  If the database user name is left empty, Windows Authentication will be used instead of a user-based connection. (This requires to run the Central service under credentials that have access by Windows Authentication to the database).

.. code-block::

  Enter database password:
  >

Type in the password (it will not be displayed in the shell) and press *Enter*.

The preferences.cfg file in the data directory contains (beside the fingerprint of Central, i.e. the "password" XML-tag) four additional XML tags: database, databaseserver, databaseusername and databasepassword

The preferences.cfg file for normal user/password authentication should look like:

.. code-block::
  :linenos:

  <password value="the fingerprint hash"/>
  <database value="MSSQL"/>
  <databaseserver value="<name or ip of the SQL server>\<name of instance, e.g. SQLEXPRESS>@,<name of database, e.g. mmsuite"/>
  <databaseusername value="mmSuiteDBUser"/>
  <databasepassword value="password hash"/>

An example preferences.cfg file for the Windows Authentication method should look like (databaseusername tag must be present and the value attribute must be set to empty string):

.. code-block::
  :linenos:

  <password value="the fingerprint hash"/>
  <database value="MSSQL"/>
  <databaseserver value="<name or ip of the SQL server>\<name of instance, e.g. SQLEXPRESS>@,<name of database, e.g. mmsuite"/>
  <databaseusername value=""/>

Restart Central and verify it’s running. If the database connection fails, the service will fail to start with the appropriate error message.

Proceed to :ref:`setting up high availability <central-ha>` or :ref:`installing the DNS and DHCP server controllers <install_controllers>`.

Men&Mice Central running on Linux
"""""""""""""""""""""""""""""""""""

.. warning::
  A ODBC driver will need to be `installed on the Linux machine to be able to use Microsoft SQL Server <https://docs.microsoft.com/en-us/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15>`_.

Navigate to the data directory of the Men&Mice Central, usually located in /var/mmsuite/mmcentral.

Edit the preferences.cfg file with in that directory with the following:

.. code-block::
  :linenos:

  <Database value="MSSQL" />
  <DatabaseServer value="ip/dns name of SQL server><,port>\<Instance name>@<Database name>" />
  <DatabaseUsername value="mmSuiteDBUser" />
  <DatabasePassword value="plaintext:<your password here>" />

.. note::
  If the DatabasePassword value is prefixed by "plaintext:", it will be swapped out by the Men&Mice Central for a password hash during start up.

Connecting to the MS SQL database
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Restarting the Men&Mice Central service with the new preferences file should connect the Men&Mice Central to your freshly created database. The Men&Mice Central creates the database schema (tables...) during the first connection.

Since the database was freshly created you can now follow the normal installation procedure.

Restart Central and verify it’s running:

.. code-block:: bash

  systemctl restart mmcentral
  systemctl status mmcentral

If the database connection fails, the service will fail to start with the appropriate error message.

Proceed to :ref:`setting up high availability <central-ha>` or :ref:`installing the DNS and DHCP server controllers <install_controllers>`.

Always On Availability Groups
"""""""""""""""""""""""""""""

.. note::
  Please note that Always On Availability Groups are only supported for Men&Mice Central running on Linux.

Men&Mice Central supports the use of Always On Availability Groups (v9.3.0 and above), In case of a failover the Men&Mice Central will refresh its database connections to the new primary replica.

To use Always On Availability Groups, change the DatabaseServer value in the preferences.cfg to the virtual IP address or the FQDN of the availability group listener:

.. code-block::
  :linenos:

  <DatabaseServer value="virtual ip/fqdn of availability group listener><,port>\<Instance name>@<Database name>" />

  Proceed to :ref:`setting up high availability <central-ha>` or :ref:`installing the DNS and DHCP server controllers <install_controllers>`.
