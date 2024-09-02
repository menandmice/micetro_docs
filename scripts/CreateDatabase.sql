/* 
Micetro requires a case-sensitive and accent-sensitive collation, i.e. CS_AS. 
A UTF8 collation (ends with _UTF8) is recommended for SQL Server 2019 or later, which supports UTF8 collations
for older SQL Server versions and  Micetro 11.0 and below, SQL_Latin1_General_CP1_CS_AS is the recommended collation
*/

CREATE DATABASE [micetro]
COLLATE Latin1_General_100_CS_AS_KS_WS_SC_UTF8	-- change Latin1_General to a more appropriate CS_AS UTF8 collation as needed
-- COLLATE SQL_Latin1_General_CP1_CS_AS -- recommended collation for SQL server 2017 and older without UTF8 support, or Micetro 11.0 and below
GO

USE [micetro]
GO

/*
	Create a login for the Central service, using SQL Server Authentication.
	Change the passsword 'welcome' to a password the fulfills company password policies
	NOTE: verify the SQL Server is setup to allow SQL Server Authentication if this method is used - it is turned off by default in new installs
*/
CREATE LOGIN [micetroDBUser] WITH PASSWORD=N'welcome', 
 	DEFAULT_DATABASE=[micetro], 
 	CHECK_EXPIRATION=OFF, 
	CHECK_POLICY=OFF
 GO
/*
	It's also possible to use an AD authenticated user if the Central service runs as that user. The SQL above changes to 
		CREATE LOGIN [DOMAIN\username] FROM WINDOWS WITH DEFAULT_DATABASE=[micetro];
*/

 /*
Create a user on the new database. Change [micetroDBUser] to [DOMAIN\username] if an using AD Authenticated user
*/

CREATE USER [micetroUser] FOR LOGIN [micetroDBUser] 
GO

/*
Create a role for Micetro, and add micetroUser to it
*/
CREATE ROLE MicetroRole
GO
EXEC sp_addrolemember MicetroRole, micetroUser
GO

/*
Grant minimum recommended access to the role
*/
EXEC sp_addrolemember db_datawriter, MicetroRole
EXEC sp_addrolemember db_datareader, MicetroRole
ALTER AUTHORIZATION ON SCHEMA::[db_ddladmin] TO MicetroRole
GO

GRANT CREATE TABLE TO MicetroRole
GO

/*
Create the default schema for the new user. It is important that the user Micetro connects to the database with has the schema as default schema.
NOTE: granting the micetro user a server role such as sysadmin should be avoided, because that means the default schema will always be dbo instead of mmCentral
*/
CREATE SCHEMA mmCentral AUTHORIZATION micetroUser
GO
ALTER user micetroUser with default_schema = mmCentral
GO

/*
	Database settings
*/

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
	EXEC [micetro].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO

ALTER DATABASE [micetro] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [micetro] SET ANSI_NULLS OFF
GO

ALTER DATABASE [micetro] SET ANSI_PADDING OFF
GO

ALTER DATABASE [micetro] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [micetro] SET ARITHABORT OFF
GO

ALTER DATABASE [micetro] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [micetro] SET AUTO_CREATE_STATISTICS ON
GO

ALTER DATABASE [micetro] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [micetro] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [micetro] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [micetro] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [micetro] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [micetro] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [micetro] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [micetro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [micetro] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [micetro] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [micetro] SET READ_WRITE
GO

ALTER DATABASE [micetro] SET READ_COMMITTED_SNAPSHOT ON
GO

/* 
   Recovery model is set to SIMPLE initially, which is also sufficient for Micetro.  Periodic full backups recommended.
   Recovery model should only be changed to FULL when a transaction log backup job is properly configured
*/
ALTER DATABASE [micetro] SET RECOVERY SIMPLE 
-- ALTER DATABASE [micetro] SET RECOVERY FULL -- Requires a log backup job configuration. 
GO

ALTER DATABASE [micetro] SET MULTI_USER
GO

ALTER DATABASE [micetro] SET PAGE_VERIFY CHECKSUM 
GO

/**
Now you can start Central. It will create the tables as necessary
**/
