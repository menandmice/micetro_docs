.. meta::
   :description: Migrating the Micetro database from SQLite to Microsoft SQL Server
   :keywords: database, migrate, sqLite, sqLite3, SQL, odbc

.. _migrate-sqlite-sql-server:

Migrating the Micetro Database from SQLite3 to Microsoft SQL Server
******************************************************************
This page provides instructions on how to migrate your Micetro database from SQLite3 to a Microsoft SQL Server.

Create the database
-------------------
Before you can migrate the Micetro database to a Microsoft SQL (MS SQL) Server, you need to create and configure an MS SQL database server.

#. Connect Micetro Central to the MS SQL Server. This will create the new Micetro database.

#. Follow the instructions for `setting up Microsoft SQL Server as a database server for the Micetro <https://docs.menandmice.com/en/latest/guides/implementation/central_mssql/#microsoft-sql-server>`_.

The following instructions assume you have created the Micetro database in MS SQL, as well as a ``preferences.cfg`` file with information about connecting to the MS SQL Server. When Micetro Central connects to the MS SQL server for the first time, it will create the necessary tables.

Before migrating
----------------

1. Create a directory on the Micetro Central server or, if possible, directly on the SQL server (for better performance) and call it "Migrate".

2. If the SQL Server is not running on the Micetro Central server, download and install the `SQL Server OBDC Driver <https://learn.microsoft.com/en-us/sql/connect/odbc/download-odbc-driver-for-sql-server?view=sql-server-ver16>`_ from Microsoft.

3. Download and extract the `ConvertDatabase2.10.zip <https://download.menandmice.com/misc/ConvertDatabase2.10.zip>`_ file and copy the extracted files to the "Migrate" directory. The "Migrate" directory should contain the following:

  * A PowerShell script used to migrate the database from SQLite3 to MS SQL
  * Two SQLite3 DLLs (redistributed from `system.data.sqlite.org <http://system.data.sqlite.org/>`_) under the folders x32 and x64

4. Confirm whether the DLLs/PowerShell script are blocked. Refer to the :ref:`Note <db-migration-note>` below and, if necessary, unblock the files.

5. Stop the Micetro Central service on the Central server, i.e., with the services.msc.

6. Copy the ``mmsuite.db`` file into the "Migrate" directory. By default, the ``mmsuite.db`` file is located in a hidden directory ``ProgramData`` on the C drive of the machine running the Micetro Central service:

    ``C:\ProgramData\Men and Mice\Central\mmsuite.db``

    
Migrate the database to MS SQL
------------------------------
 
In the Administrator PowerShell window, enter the following command (assuming the SQLite3 file has the name ``mmsuite.db`` and the MS SQL Server database has been created as ``micetro``):

.. code-block::

  > cd C:\Migrate
  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database micetro -ServerInstance [DATABASE_SERVER] -username [USER NAME]


-OR- if your account has access to SQL server, you should use the ``-useWindowsAuthentication`` switch:

.. code-block::

  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database micetro -ServerInstance [DATABASE_SERVER] -useWindowsAuthentication


If the script complains about being unable to connect to the database, try adding ``\[Instance_Name]`` to the ``-ServerInstance`` variable:

.. code-block::

  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database micetro -ServerInstance 192.168.2.12\INSTANCENAME -useWindowsAuthentication


-AND/OR- a custom TCP port to connect to, e.g., port ``12345`` instead of the default MS SQL Server port ``1433``:

.. code-block::

  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database micetro -ServerInstance 192.168.2.12\INSTANCENAME,12345 -useWindowsAuthentication


The script may take a few minutes to run, depending on the size of the database.

First, the script checks the SQLite3 database for inconsistencies or issues. It will also fix issues, e.g., data exceeded the defined varchar length or foreign key constrain violations.

Then, the script purges the MS SQL Server database and migrates the checked ``mmsuite.db`` file data table-by-table.

.. _db-migration-note:

.. Note::
  If the script returns an error that it can't load the SQLite3 DLL, check whether the DLL located in the x32 or x64 sub-directory is "Unblocked." Right-click on the DLL and select **Properties**. Then, select :guilabel:`Unblock`. 
  
  Windows might silently refuse the Unblock action. You can check whether Windows has refused the Unblock by reopening the **Properties** to see if the Unblock button is "Blocked". If so, make a copy of the DLL, delete the original DLL, and Unblock the copy.
  
Start the Micetro Central Service
---------------------------------

1. Make sure the ``preferences.cfg`` file is using the MS SQL Server.

2. Go to **Services** and start Micetro Central.

Micetro Central should now connect to the SQL Server and use it as a data store.
