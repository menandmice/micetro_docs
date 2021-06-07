.. meta::
   :description: Configuring Always On Availability for Microsoft SQL Server with Micetro by Men&Mice
   :keywords: high availability, Microsoft SQL Server, Micetro 

.. _mssql-ha:

Always On Availability Groups
"""""""""""""""""""""""""""""

.. note::
  Please note that Always On Availability Groups are only supported for Men&Mice Central running on Linux.

Men&Mice Central supports the use of Always On Availability Groups (v9.3.0 and above), In case of a failover the Men&Mice Central will refresh its database connections to the new primary replica.

To use Always On Availability Groups, change the DatabaseServer value in the preferences.cfg to the virtual IP address or the FQDN of the availability group listener:

.. code-block::
  :linenos:

  <DatabaseServer value="virtual ip/fqdn of availability group listener><,port>\<Instance name>@<Database name>" />
