.. meta::
   :description: Managing failover configurations for ISC in Micetro
   :keywords: failover management, ISC

.. _failover-management-isc:

Managing Failover Relationships for ISC DHCP
=============================================
  
.. note::
   When adding a server’s first failover peer, all other address pools on the server will be updated to refer to this failover peer.

Setting Up a Failover Relationship
----------------------------------
API supports creation using halXMLCommandAddDHCPFailoverRelationship.

**To add a failover relationship**:

1. On the **Admin** page, select :guilabel:`Service Management` in the upper-left corner.

2. In the left sidebar, under :guilabel:`DHCP Services`, select :guilabel:`ISC DHCP`.

3. Select the ISC DHCP server housing the scope for which you want to establish failover configuration, and then select :guilabel:`Failover management` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)``.

4. Select :guilabel:`Add Relationship`.

5. Complete the **Add Relationship** dialog box:

   .. image:: ../../images/failover-isc-add-relationship.png
      :width: 65%

   * **Failover name**: Specify the name of the failover peer.

   * **Partner server**: Select the partner server for the failover configuration.

   * **Port**: Specify the port number on which the server should listen for connections from its failover peer.
   
   * **Maximum client lead time**: Specify the number of seconds for which a lease can be renewed by either server without contacting the other. Only specified on the primary failover peer.

   * **Max response delay**: Specify the number of seconds that may pass without the server receiving a message from its failover peer before it assumes that the connection has failed.

   * **Load balance max seconds**: Specify the cutoff in seconds after which load balancing is disabled. According to ISC documentation, a value of 3 or 5 is recommended.

   * **Max unacked updates**: Specify the number of messages the server can send before receiving an acknowledgment from its failover peer. According to ISC documentation, 10 seems to be a good value.

6. Click :guilabel:`Add`.


Editing Failover Relationships
---------------------------------
Modify through API using halXMLCommandModifyDHCPFailoverRelationship.

**To edit a failover relationship**:

1. Locate the DHCP server with the relationship.

2. Select :guilabel:`Failover management` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)``.

Removing a Failover Relationship
--------------------------------

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

Adding Scopes to Failover Relationships
---------------------------------------

Removing Scopes from Failover Relationships
-------------------------------------------



