.. meta::
   :description: Configuring anycast on appliances in Micetro
   :keywords: appliances, DNS/DHCP appliance, MDDS appliances, anycast

.. _anycast-appliances:

Configuring Anycast on Appliances
=================================
Micetro supports anycast network configuration, which allows DNS queries to be answered by the nearest optimal server from a group of servers sharing an IP address. Anycast not only provides redundancy, but also improves the reliability of DNS services by ensuring that queries are answered by the closest available server.

You can configure anycast through either of the following routing protocols: Border Gateway Protocol (BGP) or Open Shortest Path First (OSPF).

Select from the tabs below for instructions based on your desired routing protocol.

.. tabs::

    .. tab:: BGP

        **To configure anycast using BGP**:

        1. Locate the specific appliance for which you want to configure anycast.
        2. Select :guilabel:`Configure Anycast` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.
        3. In the :guilabel:`Configure Anycast` dialog, select the :guilabel:`Active` checkbox to enable BGP. Unselect it to disable the BGP anycast service.
        4. Enter the following information into the provided fields, depending on the needed configuration:

            .. image:: ../../images/anycast-bgp-dialog.png
                :width: 75%

          * **Addresses**: Enter the IP addresses the appliance will advertise through the routing protocol. The appliance also automatically configures a loopback adapter with this address and provides service.

            .. note::
                The IP addresses are synced between BGP and OSPF.
   
          * **ASN**: Enter a number for the Autonomous System to which the DNS server belongs.
          * **Keepalive time**: Enter the frequency, in seconds, (from 0--65535) that *keepalive* notifications are sent to the BGP peer.
          * **Hold time**: Enter the interval, in seconds, (from 0--65535) after which a *keepalive* notification has not been received and a BGP peer is declared dead.
          * **CLI**: If you want to use vtysh command line to configure the network setup, use the dropdown to select :guilabel:`On` and enter your password.
          * **Router ID**: Enter a unique ID for the appliance, in dotted-decimal notation (A.B.C.D). The ID can be any unique value, but it is recommended to use a number that represents the appliance, such as its eth0 IP address. 
          * **Neighbors**: Add the IP addresses of the routers with which the appliance forms a neighbor relationship. These routers must be capable of using BGP and be configured to form a relationship with the appliance.

            1. To add a neighbor address, click the :guilabel:`Add` button and enter the required information. 
            2. In the **Hop limit** field, enter the number of hops (1--255) permitted from the anycast DNS server and its closest peer via IPv4.
            3. Use the **Next-hop-self** dropdown to enable or disable the DNS server from advertising its IPv6 peering address to the BGP peer as the next hop for all IPv6 routes distributed by the DNS server. Select **Announce** to enable or **Don't announce** to disable.

          * **Prefix list**: Select filtering for the input and output of the routing information, if needed.

            1. **Name**: Select whether this filtering should be applied to input or output IPv4 or IPv6.
            2. **Action**: Select whether the filter allows or denies traffic.
            3. **Network**: Specify the network this filter should be applied to.

        5. Select :guilabel:`Save`.
    
    .. tab:: OSPF

        **To configure anycast using OSPF**:

        1. Locate the specific appliance for which you want to configure anycast.
        2. Select :guilabel:`Configure Anycast` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.
        3. In the :guilabel:`Configure Anycast` dialog box, select the :guilabel:`OSPF` tab.
        4. In the :guilabel:`Configure Anycast` dialog box, select the :guilabel:`Active` checkbox to enable OSPF. Unselect it to disable the OSPF anycast service.
        5. Enter the following information into the provided fields, depending on the needed configuration:

            .. image:: ../../images/anycast-ospf-dialog.png
              :width: 75%

          * **Addresses**: Enter the IP addresses the appliance will advertise through the routing protocol. The appliance also automatically configures a loopback adapter with this address and provides service.

            .. note::
              The IP addresses are synced between BGP and OSPF.

          * **Area**: Enter the OSPF Area that the appliance will participate in, in dotted-decimal notation (A.B.C.D). Each OSPF network must contain at least a backbone area (area 0 or 0.0.0.0), but can also contain other areas through Area Border Routers (ABRs). The Area ID is only configured once for all networks, since the appliance never acts as an ABR and never uses the same Area ID on all adapters.
          * **Hello interval**: Enter the length of time, in seconds, for which the primary router contacts its peer to indicate that it's still active.
          * **Dead interval**: Enter the length of time (in seconds) for which the peer router maintains a route to the primary router in the absence of hello messages.
          * **CLI**: If you want to use vtysh command line to configure the network setup, use the dropdown to select :guilabel:`On` and enter your password.
          * **Stub**: Check the checkbox to specify the use of an OSPF subnet.

        6. Select :guilabel:`Save`.
