.. meta::
   :description: Managing failover configurations for Windows Servers in Micetro
   :keywords: failover management, Microsoft, DHCP

.. _failover-management-windows:


Managing Failover Relationships for Microsoft DHCP Servers
==========================================================

When creating failover relationships for Microsoft DHCP servers, scopes are not added to the relationship at the time of creation. Instead, the scopes are added later on by using the "Add scope to failover" action.

.. note::
   To manage failover between two Microsoft Servers, the DHCP Server Controller must be running as a service account with enough privileges to manage the DHCP service. For more information, see :ref:`install-dhcp-controllers`.

Setting up a Failover Relationship
----------------------------------
1. On the **Admin** page, select :guilabel:`Service Management` in the upper-left corner.

2. In the left sidebar, under :guilabel:`DHCP Services`, select :guilabel:`Microsoft DHCP`.

3. Select the Windows Server that you want as the primary server in the relationship, and then select :guilabel:`Failover management` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)**.

4. Click :guilabel:`Add Relationship`, and configure the desired relationship parameters.

   * **Failover Name**: The name for the relationship.

   * **Failover Mode**: Select the failover mode you want to use. You can choose between Hot standby and Load balance.
   
   * **Partner Server**: Select the partner server for the failover configuration.
   
   * **Addresses reserved for standby server**: If you chose the Hot standby mode, you must set the percentage of addresses reserved for the standby server.
   
   * **Local Server Load Balance Percentage**: If you chose the Load Balance mode, you must specify the load balance percentage for the local server. The remaining percentage will be used on the partner server.
   
   * **Maximum Client Lead Time**: Enter values in seconds if different from default.

   * **State Switchover Interval**: Specify an interval in seconds for Automatic State Switchover; zero means it's disabled.

   * **Shared Secret for Message Authentication**: If you want to use message authentication between the DHCP servers, you must provide a shared secret for the message authentication.

5. After confirming the details on the Summary tab, click :guilabel:`Add`.

Removing a Failover Relationship 
--------------------------------

1. On the **Admin** page, select the Windows server containing the relationship.

2. Select :guilabel:`Failover management` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)**.

3. Select the relevant relationship, and then select :guilabel:`Remove` on the **Row menu (...)**.

4. If associated relationships exist, you will be prompted to select the server where the scopes should persist and decide whether to delete or disable scopes on the other server.


Replicating Failover Scopes
----------------------------
When configuring a failover relationship, you can replicate scope information between servers. This is possible for individual scopes, all scopes that share a failover relationship, or all scopes on a particular DHCP server. 

During the scope replication process, the scopes on the selected DHCP are considered the source scopes, and the entire content of these scopes is subsequently replaced on the destination server.

Individual Scopes
^^^^^^^^^^^^^^^^^^
1. On the **IPAM** page, select a scope in a failover relationship.

2. On the :guilabel:`Action` menu, select :guilabel:`Replicate failover scope`. You can also select this option on the **Row menu (...)**.

3. Select the destination server, and then click :guilabel:`Confirm`.

All Scopes in a Failover Relationship
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. On the **Admin** page, select on of the Microsoft DHCP servers that you want in the relationship.

2. On the :guilabel:`Action` menu, select :guilabel:`Failover management`. You can also select this option on the **Row menu (..)**.

3. Select the failover relationship, and then select :guilabel:`Replicate failover relationship` on the **Row menu (...)**.

4. Click :guilabel:`Confirm`.

All Failover Scopes on a DHCP Server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. On the **Admin** page, select one of the Microsoft DHCP servers that you want in the relationship.

2. On the :guilabel:`Action` menu, select :guilabel:`Recplicate failover relationships`. You can also select this option on the **Row menu (..)**.

3. Click :guilabel:`Confirm`.