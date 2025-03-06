.. meta::
   :description: Instructions for managing DNS zones in Micetro
   :keywords: DNS zones, DNS servers

Managing DNS Zones 
==================
In Micetro, you can manage all your DNS zones on the **DNS** page. This is the hub for everything from creating new zones to editing zone options to deleting zones.

.. note::
   This information applies to the Micetro web application. For information about DNS zone management in the M&M Management Console, see :ref:`console-dns-zones`.

Creating Zones
--------------
To create a new DNS zone:

1. Click :guilabel:`Create` on the **DNS** page task bar.

2. Select the zone type. For more information about zone types, refer to :ref:`dns-zone-types`.

   .. image:: ../../images/dns-zone-create.png
      :width: 65%
   
3. Follow the steps of the wizard. The number of steps will vary based on the zone type and the configuration of Micetro. Refer to the following sections for instructions for each individual zone type:

    * :ref:`primary-zone`
    * :ref:`secondary-zone`
    * :ref:`stub-zone`
    * :ref:`static-stub-zone`
    * :ref:`forward-zone`
    * :ref:`options-template-zone`

.. tip::
   You can specify the network address in CIDR format, such as 192.168.1.0/24. Micetro automatically converts this CIDR format into a reverse zone name (0.168.192.in-addr.arpa.). 

.. _primary-zone:

Primary zone
""""""""""""
1. Enter a :guilabel:`Zone name` and use the :guilabel:`Primary server`dropdown to select the DNS server where the zone should be created. If xDNS profiles have been created on the instance, you can add the zone directly to an xDNS profile.

    .. image:: ../../images/zone-primary-windows.png
      :width: 65%

   * When creating a DNS zone on a Windows Server, you'll encounter two checkboxes: 

      * **AD Integrated**: Selecting this option creates an Active Directory-integrated zone, which stores the zone data in Active Directory (AD) and benefits from AD's replication and security features.
      * **Dynamic Update**: Selecting this box enables dynamic updates, allowing DNS records to be automatically updated by authorized devices.

     If neither checkbox is selected, the DNS zone will be a standard static zone.

2. Optional. You can select secondary server(s) to host an identical copy of the zone. The zone files from the primary DNS zone are synced to the secondary zone through a zone transfer.

    .. image:: ../../images/zone-flow-redundancy.png
      :width: 65%

3. If **Custom Properties** have been defined for zones, they can be edited in a separate step. Custom properties provide additional attributes that enhance the ability to understand, search, and sort zone data in Micetro. 

    .. image:: ../../images/zone-flow-custom-properties.png
      :width: 65%

   Custom properties appear as individual columns on the **DNS** data grid for each zone.

4. In the **Zone Options** step, you can specify which DNS servers will be notified of changes to the zone and to which servers it is allowed to perform zone transfers. 

    .. image:: ../../images/zone-flow-options.png
      :width: 65%

5. If DNS **Folders** have been configured in Micetro, you add the new zone directly to a folder. DNS folders are a neat way to organize zones in Micetro for better management. For more information about folders, refer to :ref:`folder-management`.

    .. image:: ../../images/zone-flow-folder.png
      :width: 65%   
      
6. The **Summary** step summarizes the new zone's configuration before it is created. To edit the configuration, go to the respective step(s) of the wizard and make the desired changes.

7. Select :guilabel:`Create`.

.. _secondary-zone:

Secondary Zone
"""""""""""""""
When creating a secondary zone, you must provide the zone name and either the IP address or hostname of the primary servers that hold the zone of which you are creating a secondary copy.

.. _stub-zone:

Stub Zone
"""""""""""
When creating a stub zone, you must provide the zone name and one or more primary servers for the zone being copied.

.. _static-stub-zone:

Static-stub Zone
""""""""""""""""
When creating a static-stub zone, you must provide the zone name and a target DNS server. To configure how the zone should be resolved, specify either hostnames or IP addresses in the :guilabel:`Zone Options` step.

.. _forward-zone:

Forward zone
""""""""""""
Forward zones are similar to stub zones. You must provide a zone name and a list of forward servers, as well as at least one target server where the zone is created.

.. _options-template-zone:

Options Template Zone
"""""""""""""""""""""""
.. note::
    The options template zone type is only available if an AuthServe DNS server is connected to Micetro.

Migrating Zones
---------------
You can migrate one or more zones from one server to another. Migrating a zone also migrates all data in that zone.

**To migrate a zone**:

1. In the **DNS** data grid, select the zone you want to migrate.

2. Using either the :guilabel:`Action` or the Row :guilabel:`...` menu, select :guilabel:`Migrate zone`.  
   
3. In the **Migrate Zone(s)** dialog box, select the DNS service to which you want to migrate the zone(s). 

4. If you want to remove the zone from the current service, select the :guilabel:`Remove original zone` checkbox. If the checkbox is left unselected, a copy of the zone is left on the current service.

5. Select :guilabel:`Migrate`.

Deleting Zones
--------------
To delete a zone from one or more servers:

1. In the **DNS** data grid, select the zone(s) you want to delete.

2. Using either the :guilabel:`Action` or the Row :guilabel:`...` menu, select :guilabel:`Delete zone`.    
      
3. In the **Delete Zone** dialog box, review the zones you selected and the list of servers that currently serve the zone(s). The zone(s) you selected will be deleted from every server selected from this list. To keep the zone on a particular server, uncheck the checkbox for that server.

4. Click :guilabel:`Delete`.

The selected zone(s) is removed from the selected servers.

Promoting Secondary Zones
-------------------------
In Micetro, it's possible to change a secondary zone into a primary zone. You might need to do this in an emergency situation, e.g., if the primary zone becomes unavailable for an extended period of time.

.. note::
    Only a DNS administrator can promote a secondary zone.

When a secondary zone is promoted, the following actions are performed:

* Micetro checks whether the most recent copy of the zone in in its internal database or on the server hosting the secondary zone, and uses the more recent copy.

* The server hosting the secondary zone is configured so that the zone is saved as a primary zone on the server.

* The zone history and access privileges from the old primary zone are applied to the new primary zone.

* The configurations of other instances of the secondary zone are modified so they will receive updates from the new primary zone.

**To promote a secondary zone to a primary zone**:

1. In the **DNS** data grid, select the secondary zone.

2. Using the :guilabel:`Action` or the Row :guilabel:`...` menu, select :guilabel:`Promote to primary`.  
   
3. Click :guilabel:`Save` to continue or :guilabel:`Cancel` to discontinue the process.

.. _ad-preferred-servers:

Editing Preferred Servers
-------------------------
DNS administrators can specify the server to use when opening an Active Directory (AD) integrated zone, as well as the order of servers to use if the first preferred server becomes unavailable.

.. note::
  This option is only available when working with AD-integrated zones. For more information, refer to :ref:`active-directory`.

**To edit the preferred server for a zone**:

1. In the leftmost sidebar, select :guilabel:`AD Integrated`.

2. In the data grid, select the zone(s) for which you want to set preferred servers.

3. Using either the :guilabel:`Action` or the Row :guilabel:`...` menu, select :guilabel:`Edit preferred servers`.
   
4. Arrange the order of your servers into the preferred order by dragging and dropping. The server at the top of the list is tried first, and then if that server is unavailable the second, and so on.

5. Click :guilabel:`Save`.

.. warning::
  If you select multiple zones, they might have different settings for preferred servers. Saving the configuration will overwrite the previous settings on all selected zones.

Editing Zone Properties
-----------------------
:ref:`admin-custom-properties` are flexible metadata associated with zones and other object types, allowing you to include details such as contact information for zones, ranges, and records. These properties can be edited.

**To edit zone properties**:

1. Select the zone you want to edit and click :guilabel:`Properties` on the task bar or the Row :guilabel:`...` menu.
2. Make the desired changes and click :guilabel:`Save` to apply them.

Editing Zone Options on Windows and BIND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
For Windows and BIND servers you can configure individual settings for a specific zone on each server.

**To edit zone options for Windows and BIND zones**:

1. Select the zone(s) for which you want to edit the options.

2. Select :guilabel:`Edit zone options` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.

3. In the configuration interface that appears, adjust the settings according to your requirements. Refer to the appropriate tab below for details specific to Windows and BIND:

.. tabs::

   .. tab:: Windows
      
         .. image:: ../../images/zone-options-windows.png
            :width: 65%

      * **Dynamic zone** (primary): Specify whether the zone accepts dynamic updates. If selected, clients can use dynamic DNS updates to update their resource records.
      * **Allow insecure updates** (Active Directory): Enable or disable insecure updates for the zone. When enabled, any client can update DNS records without authentication, potentially introducing security risks.
      * **Update notifications** (primary, secondary, Active Directory): Specify which servers should be notified when changes are made to the zone's DNS records.
      * **Zone transfers** (primary, secondary, Active Directory): Control which servers are allowed to receive zone transfers.
      * **Forward servers** (forward): Specify the servers to which queries should be forwarded.
      * **Primary servers** (stub): Specify the primary servers for the stub zone.
   
   .. tab:: BIND

         .. image:: ../../images/zone-options-bind.png
            :width: 75%

      * **Show inherited options**: By default, this option is selected and any inherited options applied to the selected zone are displayed. Inherited options are settings propagated from higher-level configurations, either the server or view. You can edit the inherited options by selecting :guilabel:`Override` or select the specific option you wish to modify from the dropdown list.

       To add another entry, click :guilabel:`Add` for the relevant option.

      * **Query restrictions** (primary, secondary, stub, static-stub): Specify which hosts or IP addresses are allowed to query the DNS zone.
      * **Transfer restrictions** (primary, secondary): Transfer restrictions can specify which IP addresses or hosts are permitted to request zone transfers.
      * **Update restrictions** (primary):  Control who is allowed to dynamically update the DNS records within the zone. 
      * **Update notifications** (primary, secondary): Specify which servers should receive notifications when changes are made to the zone's DNS records. When dynamic updates occur, servers specified in the update notifications field receive notifications to ensure they can synchronize their records accordingly.
      * **Response policy** (primary, secondary): Specify whether the zone is a response policy zone.
      * **Query forwarding** (forward): Determine how BIND behaves when forwarding queries for the forward zone.
      
         * **First - resolve if forwarding fails** provides a fallback to local resolution if forwarding fails.
         * **Only - fail if forwarding fails** strictly relies on forwarding and does not attempt local resolution if forwarding fails.

      **Raw Configuration of Zone Options (BIND)**
   
      The :guilabel:`Raw Configuration` tab is intended for experienced users who have a good understanding of DNS configurations. There, you can access and modify raw configuration files directly, granting you control over zone options not available through the GUI.
