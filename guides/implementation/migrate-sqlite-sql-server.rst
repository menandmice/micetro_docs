.. meta::
   :description: Migrating the Micetro database from SQLite to Microsoft SQL Server
   :keywords: database, migrate, SQLite, SQL

.. _migrate-sqlite-sql-server:

Migrating the Micetro database from SQLite to Microsoft SQL Server
==================================================================
The knowledge base contains an article that describes the process of creating the database and configuring it: `Using Microsoft SQL Server as a database server for the Micetro Suite <https://cdocs.menandmice.com/pages/viewpage.action?pageId=6360964>`_

The remaining instructions below assume the creation of the Micetro database in MS SQL and that a ``preferences.cfg`` file with information on connecting to the MS SQL Server has been created. When Micetro Central connects to the MS SQL server for the first time, it will create the necessary tables.

Preparation
-----------
Before you migrate the database to MS SQL:

* Create a directory on the Micetro Central server or, if possible, directly on the SQL server (for better performance) and call it "Migrate".

* If SQL Server is not running on the Micetro Central server, download and install the SQL Server Native Client from `Microsoft <https://www.microsoft.com/en-us/download>`_.

* Extract the attached `ConvertDatabase2.10.zip <https://cdocs.menandmice.com/download/attachments/6361086/ConvertDatabase2.10.zip?version=1&modificationDate=1446546538346&api=v2>`_ file and copy the extracted files to the "Migrate" directory. The "Migrate" directory should now contain a PowerShell script used to migrate the database from SQLite to MS SQL, as well as two SQLite DLLs (redistributed from `system.data.sqlite.org <http://system.data.sqlite.org/>`_) under the folders x32 and x64.

* Stop the Central service on the server.

* Copy the mmsuite.db file into the "Migrate" directory. The location of the mmsuite.db file depends on the version of Windows on the Central server (refer to `Location of Central data directory <https://cdocs.menandmice.com/display/MM/Location+of+Men+and+Mice+Central+data+directory/>`_), but it is typically in either of these locations:

    Windows 2003 - C:\Documents and Settings\All Users\Application Data\Men and Mice\Central\
    
    Windows 2008 and above - C:\ProgramData\Men and Mice\Central\
    
Migrate the database to MS SQL
------------------------------
To migrate the database to MS SQL:

 In the PowerShell window type the following command:

 .. code-block::

  > cd C:\Migrate
  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database mmsuite -ServerInstance [DATABASE_SERVER] -username [USER NAME]
 

 OR, if your account has access to SQL server, you should use the ``-useWindowsAuthentication`` switch:

 .. code-block::

  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database mmsuite -ServerInstance [DATABASE_SERVER] -useWindowsAuthentication


 If the script complains about not being able to connect to the database, try adding ``\[Instance_Name]`` to the ``-ServerInstance`` variable:

 .. code-block::

  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database mmsuite -ServerInstance 192.168.2.12\INSTANCENAME -useWindowsAuthentication

 AND/OR a custom TCP port to connect to:

 .. code-block::

  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database mmsuite -ServerInstance 192.168.2.12\INSTANCENAME,12345 -useWindowsAuthentication


The script may take a few minutes to run, depending on the size of the database.
 
.. Note::
  If the script returns an error that it can't load the SQLite DLL, please check whether the DLL located in the x32 or x64 sub-directory is "Unblocked." Right-click on the DLL and select :guilabel:`Properties`. Select :guilabel:`Unblock`.
  
  Please note that Windows might silently refuse the Unblock action. You can check this by reopening the **Properties** to check whether it still shows the :guilabel:`Unblock` button as blocked. In this case, make a copy of the DLL, delete the original DLL, and Unblock the copy.
  
Start Micetro Central service
-----------------------------
To start the Micetro Central service:

1. Make sure the ``preferences.cfg`` file is using the MS SQL Server.

2. Go to **Services** and start Central.

Central should now connect to the SQL Server and use it as a data store.
