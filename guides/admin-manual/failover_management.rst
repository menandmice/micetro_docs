.. meta::
   :description: Managing failover configurations for Windows, ISC, and KEA DHCP servers in Micetro
   :keywords: failover management, Windows, ISC, Kea, DHCP

.. _failover-management:

Failover Management
====================

**Permissions:**

**To manage failover relationships**

* Permission - DHCP administrator
* Built-in role - ``DHCP Administrators (built-in)``

**To add/remove a scope to a failover relationship**

* Permission bit - add a scope. 
* Built-in role - DHCP Administrators (built-in)

**To Replicate Scopes**

* Access bits - one or more of the following:

  * "Read/write scope options"
  * "Edit reservations"
  * "Edit address pools"
  * "Edit exclusions"

* Built-in roles - IPAM Administrators (built-in) and DHCP Administrators (built-in)

**To Replicate all scopes on a server or in a relationship**

* Access bits - "Administer DHCP servers" 
* Built-in role - DHCP Administrators (built-in)

.. note::
   The permissions to replicate scopes are on scope level. This is not to be confused with the "Edit reservation" permission bit on server level that does not apply in this case.

-----------------------------------

Micetro can be used to manage failover configurations for Windows, ISC and Kea DHCP servers. To help with consistency, the term Failover is used interchangeably with High Availability when referring to Kea DHCP.

DHCP failover synchronizses IP Address lease information between two DHCP servers. 

Depending upon the type of server being used, servers can be put into Hot Standby, Load Balancing, or High Availability modes.

You can configure failover for a single scope or for multiple scopes on the same server.

.. note::
  Both servers must be in Micetro for the functionality to work.
  
As an overlay solution, Micetro is also able to add some additional functionality that is not available natively.

Failover relationships for Windows DHCP servers are created without adding scopes to the relationship on creation. The scopes that should be part of the relationship are added later on with the "Add scope to failover" action.

.. note:: 
  Windows DHCP Failover Configurations can be managed from the Micetro Web Application . 
  
  ISC DHCP and Kea DHCP Failover Configurations can only be managed from the Management Console.


Managing Failover Configurations for ISC DHCP
----------------------------------------------
.. note::
   When adding a server’s first failover peer, all other address pools on the server will be updated to refer to this failover peer.

1. On the **Object** menu, select the DHCP Server that contains the scope for which you want to setup failover configuration.

2. In the list of scopes, double-click on the applicable one.

3. In the list of IP Addresses, right-click the applicable one, and then select :guilabel:`Create Address Pool` on the shortcut menu. The DHCP Address Pool dialog box displays.

4. Move to the **Failover Peer** field, and click the drop-down list arrow.

5. Select :guilabel:`Add new failover peer`.

6. Click :guilabel:`OK`. The New Failover Peer dialog box displays.

   * **Name**: Specifies the name of the failover peer.

   * **Role**: Specifies the role of the failover peer. The available roles are Primary and Secondary.

   * **Address**: Specifies the IP Address or DNS name on which the server should listen for connections from its failover peer.

   * **Port**: Specifies the port number on which the server should listen for connections from its failover peer.

   * **Peer Address**: Specifies the IP Address or DNS name to which the server should connect to reach its failover peer for failover messages.

   * **Peer Port**: Specifies the port number to which the server should connect to reach its failover peer for failover messages.

   * **Max Response Delay**: Specifies the number of seconds that may pass without the server receiving a message from its failover peer before it assumes that the connection has failed.

   * **Max Unacked Updates**: Specifies the number of messages the server can send before receiving an acknowledgement from its failover peer. According to ISC documentation, 10 seems to be a good value.

   * **Max Client Lead Time**: Specifies the number of seconds for which a lease can be renewed by either server without contacting the other. Only specified on the primary failover peer.

   * **Split Index**: Specifies the split between the primary and secondary failover peer for the purposes of load balancing. According to ISC documentation, 128 is really the only meaningful value. Only specified on the primary failover peer.

   * **Load Balance Max Seconds**: Specifies the cutoff in seconds after which load balancing is disabled. According to ISC documentation, a value of 3 or 5 is recommended.

7. Click :guilabel:`OK`. The DHCP Address Pool dialog box displays and shows the updated information.

8. Click :guilabel:`OK`.

If you need to EDIT or DELETE an existing failover peer, do the following:

1. Locate the relevant ISC DHCP server.

2. Right-click and, in the shortcut menu, select :guilabel:`Manage Failover Peers`. The Failover Peers for... dialog box displays. All failover peers are shown.

3. To EDIT a failover peer, select it and click the :guilabel:`Edit` button. Then modify the Failover Peers … properties dialog box, as needed.

4. To DELETE a failover peer, select it and click the :guilabel:`Delete` button.

.. note::
   In order to finalize the setup of the failover relationship, the scope needs to be migrated to the failover peer.

.. note:: 
   When deleting a failover peer through this dialog, if it is the last failover peer defined on the server, any references to it will be removed from existing address pools on the server. If there is one other failover peer left on the server, references to the failover peer being deleted will be changed to refer to the remaining failover peer. If, however, there are two or more other failover peers left on the server, the user will be prompted with a list of the remaining failover peers where he will have to choose which failover peer should be referenced by address pools currently referring to the failover peer being deleted.

.. note::
   When changing from one failover peer to another for some specific address pool, if the address pool is the last one referring to the (old) failover peer, the user will be warned that performing the action will result in the deletion of the failover peer.

Managing Failover Relationships for Windows DHCP Servers
--------------------------------------------------------

.. note::
   To manage failover between two Microsoft Servers, the DHCP Server Controller must be running as a service account with enough privileges to manage the DHCP service. For more information, see :ref:`install-dhcp-controllers`.
   
Setting up a Failover Relationship
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. On the **Admin** page, select :guilabel:`Service Management`in the upper-left corner.

2. In the left sidebar, under :guilabel:`DHCP Services`, select :guilabel:`Microsoft DHCP`.

3. Select one of the Windows Servers that you want in the relationship, and then select :guilabel:`Failover management` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)**.

4. Click :guilabel:`Add Relationship`, and set up the relationship as desired. For more information, see :ref:`failover-relationship-parameters`.

5. After confirming the details on the summary tab, click :guilabel:`Add`.

Removing a Failover Relationship 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. On the **Admin** page, select the Windows server that you want to remove from the relationship, then select :guilabel:`Failover management` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)**.

2. Select the relevant relationship, and then select :guilabel:`Remove` on the **Row menu (...)**.

3. If there are scopes associated with the relationship, you will be prompted to select which server you want the scopes to survive on and whether you want the scopes on the other server to be deleted or disabled.

Setting up a Failover Relationship on Management Console (obsolete)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. On the object menu, select the DHCP Server that contains the scope(s) for which you want to setup failover configuration.

2. You have two ways to choose the scopes you want to configure.

   * On the list of scopes, select one or more scopes, right-click and select :guilabel:`Configure Failover`. Right-click the DHCP server, and then select :guilabel:`Configure Failover`. 

   * A dialog box listing all configurable scopes displays. Select the scopes you want to configure and click :guilabel:`Next`. The failover configuration dialog box displays.

Removing a Failover Relationship on Management Console (obsolete)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
1. On the object menu, select the DHCP Server that contains the scope(s) for which you want to remove the failover relationship.

2. Select one or more scopes, right-click the selection, and then select :guilabel:`Deconfigure Failover`. A confirmation dialog box displays.

3. Click :guilabel:`Yes` to confirm the action. The failover configuration for the selected scope(s) is removed.

.. _failover-relationship-parameters:

Failover Relationship Parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
* Relationship Name
   Select the relationship you want to use for the failover configuration or enter a name if you want to create a new relationship. If you choose an existing relationship, you will not be able to change any of the relationship properties and you can simply click OK to complete the failover configuration for the scope.

* Partner Server
   Enter the name or IP Address of the partner DHCP server with which failover should be configured. You can select from the list of Windows Server 2012 machines or you can type the host name or IP Address of the partner server.

* Mode
   Select the failover mode you want to use. You can choose between Hot standby and Load balance.

* Role of Partner Server (Management Console only)
   If you chose the Hot standby mode, you must choose the role of the partner server. You can choose between Standby and Active. If you choose Standby the current server will be Active and vice versa.

* Maximum Client Lead Time
   If you don’t want to use the default values, enter the new values in the hours and minutes edit fields.

* Addresses reserved for standby server
   If you chose the Hot standby mode, you must enter the percentage of addresses that should be reserved to the standby server.

* Local server load balance percentage
   If you chose the Load balance mode, you need to specify the load balance percentage to use on the local server. The remaining percentage will be used on the partner server.

* State Switchover Interval
   Select this checkbox if you want to use Automatic State Switchover and specify the interval to use.

* Enable Message Authentication
   Select this checkbox if you want to use message authentication between the DHCP servers. If the message authentication is enabled, you must provide a shared secret for the message authentication.

Replicating Failover Scopes
^^^^^^^^^^^^^^^^^^^^^^^^^^^
When using a failover relationship, it is possible to replicate scope information between servers. This is possible for individual scopes, all scopes that share a failover relationship, or all scopes on a particular DHCP server. 

When a scope replication takes place, the scopes on the selected DHCP are considered the source scopes and the entire scope contents are replaced on the destination server.

Replicating Individual Scopes
"""""""""""""""""""""""""""""
1. On the **IPAM** page, select a scope which is in a failover relationship.

2. On the :guilabel:`Action` menu, select :guilabel:`Replicate failover scope`. You can also select this option on the **Row menu (...)**.

3. Select the destination server, and then click :guilabel:`Confirm`.

Replicating All Scopes that Share a Failover Relationship
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
1. On the **Admin** page, select the Microsoft DHCP server that you want in the relationship.

2. On the :guilabel:`Action` menu, select :guilabel:`Failover management`. You can also select this option on the **Row menu (..)**.

3. Select the relevant failover relationship, and then select :guilabel:`Replicate failover relationship` on the **Row menu (...)**.

4. Click :guilabel:`Confirm`.

Replicating All Failover Scopes on a DHCP Server
"""""""""""""""""""""""""""""""""""""""""""""""""
.. note::
   When replication takes place, the scopes on the selected DHCP server are considered the source scopes and the entire scope contents for each scope is replaced on the destination server.

1. On the **Admin** page, select one of the Microsoft DHCP servers that you want in the relationship.

2. On the :guilabel:`Action` menu, select :guilabel:`Recplicate failover relationships`. You can also select this option on the **Row menu (..)**.

3. Click :guilabel:`Confirm`.

Replicating Individual Scopes on Management Console (obsolete)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
1. On the Object menu, select the DHCP Server that contains the scope(s) you want to replicate.

2. Select one or more scopes, right-click the selection, and then select :guilabel:`Replicate Scope`. 

3. A confirmation dialog box displays. Click :guilabel:`OK` to confirm the action. The selected scope is replicated.

Replicating All Scopes that share a Failover Relationship on Management Console (obsolete)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
1. On the Object menu, select the DHCP Server that contains the scopes you want to replicate.

2. Right-click a scope using the desired relationship, and then select :guilabel:`Replicate Relationship`. 

3. A confirmation dialog box displays. Click :guilabel:`OK` to confirm the action. The scopes that use the same relationship as the selected scope are replicated. 

.. note::
   This action may take some time if multiple scopes use the relationship.

Replicating All Failover Scopes on a DHCP Server on Management Console (obsolete)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
1. On the Object menu, right-click the DHCP Server that contains the scopes you want to replicate, and then select :guilabel:`Replicate Failover Scopes` from the menu. 

2. A confirmation dialog box displays Click :guilabel:`OK` to confirm the action. All failover scopes on the selected server are replicated. 

.. note::
   This action may take some time if the server contains multiple failover scopes.



