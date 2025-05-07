.. meta::
   :description: Database backend options for Micetro
   :keywords: database, Micetro, SQLite, Microsoft SQL Server, PostgreSQL

.. _central-database:

Setting up the database backend
===============================

Micetro can be used with the following databases:

.. toctree::
  :maxdepth: 1

  central_sqlite
  central_mssql
  central_postgresql

.. note::
  * High Availability for the database is only available for MS SQL and PostgreSQL.

  * Deploying Micetro using the Azure Marketplace configures the environment automatically for Azure SQL. See :ref:`installation-azure` for details.

To migrate the database from SQLite to MS SQL, refer to :ref:`migrate-sqlite-sql-server`.
