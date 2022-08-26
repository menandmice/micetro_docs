.. meta::
   :description: Migrating the Micetro database from SQLite to Microsoft SQL Server
   :keywords: database, migrate, SQLite, SQL

.. _migrate-sqlite-sql-server:

Migrating the Micetro database from SQLite to Microsoft SQL Server
******************************************************************

Create the database
-------------------

The knowledge base contains an article that describes the process of creating the database and configuring it: `Using Microsoft SQL Server as a database server for the Micetro Suite <https://cdocs.menandmice.com/pages/viewpage.action?pageId=6360964>`_

The remaining instructions below assume the creation of the Micetro database in MS SQL and that a preferences.cfg file with information on connecting to the MS SQL Server has been created. When Micetro Central connects to the MS SQL server for the first time, it will create the necessary tables.

Preparation
-----------

* Create a directory on the Micetro Central server, or if possible, directly on the SQL server (for better performance) and call it "Migrate"

* If SQL Server is not running on the Micetro Central server, download and install the SQL Server Native Client from `Microsoft <http://www.microsoft.com/en-us/download/details.aspx?id=16978>`_

* Extract the attached `ConvertDatabase2.10.zip <https://cdocs.menandmice.com/download/attachments/6361086/ConvertDatabase2.10.zip?version=1&modificationDate=1446546538346&api=v2>`_ file and copy the extracted files to the "Migrate" directory. The "Migrate" directory should now contain a PowerShell script used to migrate the database from SQLite to MS SQL as well as two SQLite DLLs (redistributed from `system.data.sqlite.org <http://system.data.sqlite.org/>`_) under the folders x32 and x64

* Stop the Central service on the server

* Copy the mmsuite.db file into the "Migrate" directory. Location of the mmsuite.db file depends on the version of Windows on the Central server (see this  `Location of Central data directory <https://cdocs.menandmice.com/display/MM/Location+of+Men+and+Mice+Central+data+directory/>`_), but it is typically in either of these locations:

    Windows 2003 - C:\Documents and Settings\All Users\Application Data\Men and Mice\Central\
    
    Windows 2008 and above - C:\ProgramData\Men and Mice\Central\
    
Migrate the database to MS SQL
------------------------------
 
 * In the PowerShell window type the following command:
 
```
  > cd C:\Migrate
  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database mmsuite -ServerInstance [DATABASE_SERVER] -username [USER NAME]
```

or if your account has access to SQL server, you should use the -useWindowsAuthentication switch:

```
  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database mmsuite -ServerInstance [DATABASE_SERVER] -useWindowsAuthentication
```

If the script complains about not being able to connect to the database then try adding \[Instance_Name] to the -ServerInstance variable like:

```
  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database mmsuite -ServerInstance 192.168.2.12\INSTANCENAME -useWindowsAuthentication
```

and/or a custom TCP port to connect to:

```
  > .\ConvertDatabase2.ps1 -sourceDbFile .\mmsuite.db -database mmsuite -ServerInstance 192.168.2.12\INSTANCENAME,12345 -useWindowsAuthentication
```

The script may take a few minutes to run, depending on the size of the database.
 
.. Note::
  If the script returns an error that it can't load the SQLite DLL please check if the DLL is located in the x32 or x64 sub-directory is "Unblocked." Right-click on     the DLL and select Properties and press the Unblock button. Please note that Windows might silently refuse the Unblock action. You can check this by re-openeing the   Properties and checking to see if it still shows the Unblock buton is blocked. In this case just make a copy of the DLL and delete the original DLL and Unblock the     copy.
  
Start Micetro Central Service
-----------------------------

* Ensure the **preferences.cfg** file is using the MS SQL Server

* Go to "Services" and start Central

Central should not connect to the SQL Server and use it as a data store.
