.. _createdatabase_sql:

CreateDatabase.sql
""""""""""""""""""

.. code-block:: SQL

  /*

  This section is the Men and Mice recommended setup of the database instance. If your organization has different
  policies then we recommend having your DBA setup the instance according to your polices and skipping to
  the create database part below.

  */
  -- check NOCOUNT on at session level, perf increase in procedural execs esp
  SET NOCOUNT ON;

  EXEC sys.sp_configure N'show advanced options', N'1'  RECONFIGURE WITH OVERRIDE
  GO

  EXEC sys.sp_configure N'min server memory (MB)', N'64'
  GO

  RECONFIGURE WITH OVERRIDE
  GO

  EXEC sys.sp_configure N'show advanced options', N'0'  RECONFIGURE WITH OVERRIDE
  GO

  USE [master]
  GO

  --set default locations for logs and data (in the example we are using C:\Data change to your setup)

  --EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultData', REG_SZ, N'<datafilepath>'   ---put path here for example 'D:\Data for the data
  EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultData', REG_SZ, N'C:\Data'   ---put path here for example 'D:\Data for the data
  GO

  --EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultLog', REG_SZ, N'<logfilepath>'     ---put path here for example L:\Logs for the logs
  EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'DefaultLog', REG_SZ, N'C:\Data'     ---put path here for example L:\Logs for the logs
  GO

  --Temp: sett default locations for temp log and data (in the examle we use C:\Data)

  use master
  go

  --Alter database tempdb modify file (name = tempdev, filename = '<tempfilepath>\tempdb.mdf')
  Alter database tempdb modify file (name = tempdev, filename = 'C:\Data\tempdb.mdf')
  go

  --Alter database tempdb modify file (name = templog, filename = '<logfilepath>\templog.ldf')
  Alter database tempdb modify file (name = templog, filename = 'C:\Data\templog.ldf')
  go


  /************************************************************************************************/
  --Restart SQL Server....
  /************************************************************************************************/

  USE [master]
  GO

  /*
  add one tempfile per core upto eight cores at a fixed size per file turning off autogrow this depends
  on how much storage space and how busy the server is, shown below create eight tempfile all 500mb in size
  */
  ALTER DATABASE [tempdb] MODIFY FILE ( NAME = N'tempdev', SIZE = 512000KB , FILEGROWTH = 0)
  GO

  --ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_2', FILENAME = N'<tempfilepath>\tempdev_2.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_2', FILENAME = N'C:\Data\tempdev_2.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  GO

  --ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_3', FILENAME = N'<tempfilepath>\tempdev_3.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_3', FILENAME = N'C:\Data\tempdev_3.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  GO

  --ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_4', FILENAME = N'<tempfilepath>\tempdev_4.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_4', FILENAME = N'C:\Data\tempdev_4.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  GO

  --ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_5', FILENAME = N'<tempfilepath>\tempdev_5.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_5', FILENAME = N'C:\Data\tempdev_5.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  GO

  --ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_6', FILENAME = N'<tempfilepath>\tempdev_6.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_6', FILENAME = N'C:\Data\tempdev_6.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  GO

  --ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_7', FILENAME = N'<tempfilepath>\tempdev_7.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_7', FILENAME = N'C:\Data\tempdev_7.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  GO

  --ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_8', FILENAME = N'<tempfilepath>\tempdev_8.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  ALTER DATABASE [tempdb] ADD FILE ( NAME = N'tempdev_8', FILENAME = N'C:\Data\tempdev_8.ndf' , SIZE = 512000KB , FILEGROWTH = 0)
  GO

  ALTER DATABASE [tempdb] MODIFY FILE ( NAME = N'templog', SIZE = 5120000KB , MAXSIZE = 10240000KB , FILEGROWTH = 1024000KB )
  GO


  --------------------------------------- Instance level configuration ends --------------------------------------------


  /*
  Here starts the database creation and configuration for the Men and Mice database.
  */
  /*
  	After creating the database we recommend that these minimum database settings are completed:
  		-Configure the the backup settings according to your organizations backup policy.
  		-You create a sheduled job to reindex the database (e.g. every saturday at 4:00).
  		-
  */
  -- check instance default collation settings
  select convert(sysname, serverproperty('collation'))
  /*
  MM requires case sensitive and accent sensitive collation - We recomend case sensitive and accent sensitive wersion of default collation.
  select the correct collation name :select replace( replace(convert(sysname, serverproperty('collation')), '_CI_', '_CS_'), '_AI', '_AS')
  The collation can be set at database level later in this script (Se CREATE DATABASE command)
  */
  /*
  Create the database instance
  	If you have preference to where the data files should be then you can change this script
  	(you will have to make sure that the path entered exists)
  */
  /*	This deletes the database - please make absolutely certain that this is a database that
  	can be deleted.
  */
  IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'mmsuite')
  begin
  	USE [master]
  	ALTER DATABASE [mmsuite] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
  	DROP DATABASE [mmsuite]
  end
  GO
  /*
  	This create statement is intended for small scale database. For larger database setups (> tens of GBs) then you must
  	consult with your database administrators, and have them contact Men and Mice support team for additional information.
  */
  CREATE DATABASE [mmsuite] ON  PRIMARY
  (
  NAME = N'mmsuite', FILENAME = N'C:\Data\mmDatabase\mmsuite.mdf' , SIZE = 20480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ),
   FILEGROUP [mmsuiteData]  DEFAULT
  	( NAME = N'mmsuite_data', FILENAME = N'C:\Data\mmDatabase\mmsuite_data.ndf' , SIZE = 20480KB , MAXSIZE = 200GB, FILEGROWTH = 1024KB )
   LOG ON
  	( NAME = N'mmsuite_log', FILENAME = N'C:\Data\mmDatabase\mmsuiteLog.ldf' , SIZE = 20480KB , MAXSIZE = 20GB , FILEGROWTH = 1024KB)
   COLLATE SQL_Latin1_General_CP1_CS_AS	-- CI is required so chosing the default with CS_AS ending (case sensitive and Accent sensitive)
  GO
  EXEC dbo.sp_dbcmptlevel @dbname=N'mmsuite', @new_cmptlevel=100 /*ms*/
  GO
  IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
  begin
  	EXEC [mmsuite].[dbo].[sp_fulltext_database] @action = 'disable'
  end
  GO

  /*
  	Database setings
  */
  ALTER DATABASE [mmsuite] SET ANSI_NULL_DEFAULT OFF
  GO
  ALTER DATABASE [mmsuite] SET ANSI_NULLS OFF
  GO

  ALTER DATABASE [mmsuite] SET ANSI_PADDING OFF
  GO

  ALTER DATABASE [mmsuite] SET ANSI_WARNINGS OFF
  GO

  ALTER DATABASE [mmsuite] SET ARITHABORT OFF
  GO

  ALTER DATABASE [mmsuite] SET AUTO_CLOSE OFF
  GO

  ALTER DATABASE [mmsuite] SET AUTO_CREATE_STATISTICS ON
  GO

  ALTER DATABASE [mmsuite] SET AUTO_SHRINK OFF
  GO

  ALTER DATABASE [mmsuite] SET AUTO_UPDATE_STATISTICS ON
  GO

  ALTER DATABASE [mmsuite] SET CURSOR_CLOSE_ON_COMMIT OFF
  GO

  ALTER DATABASE [mmsuite] SET CURSOR_DEFAULT  GLOBAL
  GO

  ALTER DATABASE [mmsuite] SET CONCAT_NULL_YIELDS_NULL OFF
  GO

  ALTER DATABASE [mmsuite] SET NUMERIC_ROUNDABORT OFF
  GO

  ALTER DATABASE [mmsuite] SET QUOTED_IDENTIFIER OFF
  GO

  ALTER DATABASE [mmsuite] SET RECURSIVE_TRIGGERS OFF
  GO

  ALTER DATABASE [mmsuite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
  GO

  ALTER DATABASE [mmsuite] SET DATE_CORRELATION_OPTIMIZATION OFF
  GO

  ALTER DATABASE [mmsuite] SET PARAMETERIZATION SIMPLE
  GO

  ALTER DATABASE [mmsuite] SET  READ_WRITE
  GO

  /* Set the recovery mode - recommended FULL */
  ALTER DATABASE [mmsuite] SET RECOVERY FULL
  GO
  ALTER DATABASE [mmsuite] SET  MULTI_USER
  GO

  ALTER DATABASE [mmsuite] SET PAGE_VERIFY CHECKSUM
  GO

  /*
  	Creates the login for the mmCentral service - this is a MSSQL authenticated login so the server needs
  	to be set to allow such. You can either change the password in this segment or change the password for
  	this user in the database later. DO NOT use the default password given in this file. Experation
  	policy is set to off as this is a service not a user account.

  	If you are using Windows integrated authentication then you need to accociate the DBUser (on the mmsuite
  	(defined later))with the Windows user running mmCentral instead of the mmSuiteDBUser login.
  */
  IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'mmSuiteDBUser')
  DROP LOGIN [mmSuiteDBUser]
  GO

  USE [mmsuite]
  GO

  /* NOTE change the password according to your company policy */
  CREATE LOGIN [mmSuiteDBUser] WITH PASSWORD=N'1234',
   	DEFAULT_DATABASE=[mmsuite],
   	CHECK_EXPIRATION=OFF,
  	CHECK_POLICY=OFF
   GO
  /*
  Create a user on the new database. If you are using Windows login then the login needs to point to the Windows user,
  running the mmCentral service.
  */
  USE [mmsuite]
  GO
   CREATE USER [mmSuiteUser] FOR LOGIN [mmSuiteDBUser]
   GO
  /*
  Create a role for mm user.
  */
  CREATE ROLE mmSuiteRole
  /*
  Grant normal access
  */
  USE [mmsuite];
  EXEC sp_addrolemember db_datawriter, mmSuiteRole
  EXEC sp_addrolemember db_datareader, mmSuiteRole
  /*
  Authorization, the mmCentral service handles updates of the database when a new version of the system is started for the first time
  To make that possible the following needs to be granted. If youre database administration policy does not agree with granting these
  rights permanently, then please contact Men and Mice support for alternatives.

  The mmCentral service runs upgrade scripts on start up, - if needed. This only occurs when starting new version, so ddladmin only
  needs to be given to the role when the system is being run for the first time or is being upgrated. ddladmin can therfore be revoked
  when the system has been started and then given to the role only on upgrades.
  Another alternative is to remove ddladmin rights and get an upgrade script from Men and Mice that has to be run by the DBA.
  The same considerations apply to Grant Create Table.
  */
  ALTER AUTHORIZATION ON SCHEMA::[db_ddladmin] TO mmSuiteRole
  GO

  USE [mmsuite]
  GO
  GRANT CREATE TABLE TO mmSuiteRole
  GO

  /*Add our user to the mmCentral role*/
  USE [mmsuite]
  GO
  EXEC sp_addrolemember mmSuiteRole, mmSuiteUser
  GO

  /*
  Create the default schema for the new user. It is important that the user runing mmCentral has the schema as default schema.
  */
  CREATE SCHEMA mmCentral AUTHORIZATION mmSuiteUser
  GO
  ALTER user mmSuiteUser with default_schema = mmCentral
  GO
  /**
  Now you can start mmCentral, it starts by creating the tables needed.
  **/
