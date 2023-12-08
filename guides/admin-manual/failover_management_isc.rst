.. meta::
   :description: Managing failover configurations for ISC in Micetro
   :keywords: failover management, ISC

.. _failover-management-isc:

Managing Failover Configurations for ISC DHCP
=============================================
  
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
