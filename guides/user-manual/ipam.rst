.. meta::
   :description: IP address management (IPAM) in Micetro
   :keywords: IPAM, IP address management, network, container, dhcp scope

.. _ipam:

IPAM
=====

.. note::

  * To access IP Address Management (IPAM) in Micetro, you must enter the license key for the IPAM module.

  * This information applies to the Micetro Web Interface. For information about IP address management in the Management Console, see :ref:`console-ipam`.

IP Address Management (IPAM) is where you manage all aspects of your network infrastructure. This section explains how to manage IP adresses within your address spaces, including how to configure networks, view, monitor, and edit the properties of individual IP addresses, as well as how to integrate with Active Directory (AD) sites.

Viewing Networks
----------------
The **Networks** tab on the **IPAM** page provides a comprehensive overview of the IP address space accessible to you. By default, all networks are displayed, but you can use the filtering sidebar on the left to filter by IP ranges, DHCP scopes, and containers. The network list displays how the IP addresses are organized into named subnets and provides important details such as how much of the address space is used and backup plans for subnet failures. You can also view details for the selected network in the inspector on the right.

.. image:: ../../images/Networks-Micetro-10.5.png
  :width: 90%

* Use the buttons in the upper-right corner of the table to switch between a flat and a tree view.

* The star button adds the selected network to a list of favorites. You can access the favorites list on the filtering sidebar.

* When a network has no subranges, its utilization is displayed in the network list.

To narrow down the results shown when viewing networks, use the :ref:`webapp-quick-filter`. When using the tree view with an active filter, parent networks that do not match the search criteria will appear dimmed, while the matching results are highlighted. For example, in the image below, we searched for the string ``3.1``.

.. image:: ../../images/ipam-tree-filter-Micetro.png
  :width: 90%

.. _ipam-range-config:

Creating Networks
------------------
When creating a network, Micetro automatically places it in the proper location within the network tree. You can create three types of networks: 

* **Network (IP Ranges)**: A network is a block of IP addresses defined for partitioning the address space. Networks can include reserved addresses for network and broadcast functions, and they can be assigned to Active Directory (AD) sites for integration with directory services.

* **DHCP Scope**: This type is a block of valid IP addresses available for lease or assignment to client computers on a subnet. DHCP scopes automatically configure network and broadcast addresses, managing the dynamic assignment of IP addresses within the specified range.

* **Container**: Unlike networks and DHCP scopes, containers do not have network or broadcast addresses. They are used to organize and group other networks and scopes, providing a hierarchical structure for easier management and visualization.

**To create a network**:

1. On the **IPAM** page, click the :guilabel:`Create` button.

2. Select the type of network you want to create (network, :ref:`new-dhcp-scope`, container).

3. Fill in the necessary details. The **Create** wizard varies depending on the type you selected:

   * For a **network**, you can reserve network and broadcast address, and lock the range if needed. You can also assign it to an AD site, see :ref:`active-directory`.

   * A **DHCP scope** can be created with the network and broadcast addresses automatically configured, see :ref:`new-dhcp-scope`.

   * A **container** doesn't have a network or broadcast address. Within a container, you can define address ranges and scopes, and you can set privileges that apply to the enclosed ranges and scopes through access inheritance. You cannot allocate IP addresses from a container unless you have enabled this functionality in the **IPAM** section of the :ref:`admin-system-settings`. 
    
     You can also create a container by converting a network existing on a subnet into a container, or vice versa. Select the range(s) you wish to convert and select :guilabel:`Convert to container` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

4. Complete the Properties page in the final step, using the properties defined in :ref:`admin-custom-properties`.

5. When you're done, click :guilabel:`Finish`.

Editing Network Properties
^^^^^^^^^^^^^^^^^^^^^^^^^^^
You can edit the properties of a network. Note, that if the network has :ref:`admin-event-hooks` configured, these hooks will be triggered when changes are made.You can edit the properties of a network. Note, that if the network has event hooks configured, these hooks will be triggered when changes are made.

**To edit a network**:

1. Select the network(s) in the list.

2. Select :guilabel:`Properties` on the taskbar or :guilabel:`Edit network properties` on the row :guilabel:`...` menu. 

3. Make the desired changes to the network.

  .. image:: ../../images/ipam-network-properties.png
    :width: 65%

  * When multiple networks are selected, the fields will show combined values from all the networks: 
   
    * If all the selected networks have the same value for a property, that value will be displayed in the corresponding field. 
    * If the networks have different values for a property, the fields will display "<multiple values>". 
  
  * You can replace a "<multiple values>" placeholder with a specific value if you want to apply that value to all selected networks.
  
4. Click :guilabel:`Save`.

Duplicating Networks
^^^^^^^^^^^^^^^^^^^^
When you need to set up similar environments or scale existing configurations, you can duplicate networks along with their subranges, DHCP scopes and configurations under a new network address. This process helps standardize network layout by replicating the structure of the original network. Any modifications or overrides applied during duplication will be reflected across all duplicated ranges and their subranges.

**To duplicate a network**:

1. Select the network you wish to duplicate.

2. Select :guilabel:`Duplicate` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

3. In the Duplicate Networks dialog box, enter a new network address and title for the network you are creating. 

4. Click :guilabel:`Duplicate`. The new network is added to the networks list.


Deleting Networks
^^^^^^^^^^^^^^^^^^

When a network is deleted, its IP addresses will not be deleted. Instead, they are assigned to the parent network and will be listed when that network is opened. If the network being deleted contains subranges, those subranges will become children of the parent network of the unassigned networks.

When a DHCP scope is deleted, the IP addresses within that scope will no longer be managed dynamically. 
Associated DHCP objects such as Leases, Address Pools, Exclusions, Reservations, and their options are automatically removed from the DHCP server. Devices that were assigned IP addresses from the deleted scope will keep their addresses until they are no longer needed, but no new IP addresses will be allocated from the deleted scope. Be sure to reconfigure any devices or services that relied on the deleted DHCP scope to ensure they continue to function properly.

.. warning:: 
  Deleting a DHCP scope is permanent and cannot be undone. Make sure to double-check your configuration and confirm that you want to proceed with the deletion.

**To delete a network**:

1. Select network(s) you wish to remove.

2. Select :guilabel:`Delete network` on either the :guilabel:`Action` or the row :guilabel:`...` menu. 

3. You are prompted to confirm your decision to delete the(se) network(s). Click :guilabel:`Yes` to delete the range, or :guilabel:`No` to cancel.

Viewing IP Addresses within Networks
-------------------------------------

To view a list of IP addresses within a specific network, double-click the network. This opens a list where you can view and edit the properties of individual IP addresses. You can filter the IP address list, so it displays only the IP addressees you need. 

.. image:: ../../images/view-Networks-Micetro-10.5.png
  :width: 85%
  
* The :guilabel:`PTR Status` column shows the status of the Address (A) record and Pointer (PTR) record mappings. This column can have three values:

  * **Empty**: The status is empty if there are no DNS records for the host. It is also empty if a PTR record exists where the domain in the data section of the PTR record is not managed by the system.

  * **OK**: If there is a match between the A and the corresponding PTR record(s) the status is listed as OK.

  * **Verify**: There isn't a match between the A and the PTR records for the host. Common reasons for this include:

    * An A record exists, but the PTR record is missing.

    * A PTR record exists, but the A record is missing.

    * The data section in the PTR record does not correspond to the name of the A record.
  
  * On the :guilabel:`Action` menu you can use the :guilabel:`Find next free address` option to select the next available IP address within the range. Alternatively, selecting :guilabel:`Find random free address` will randomly select an available IP address.

IP Address State
^^^^^^^^^^^^^^^^^
The **State** column in the IP Address list displays the current state of each address, allowing you to quickly see whether an address is free, assigned, or in another state. You can use the :guilabel:`State` section in the left-hand filtering sidebar to filter the list.

The following states indicate the IP address usage:

   * **Free**: IP addresses that are unassigned and available for use.

   * **Assigned**: IP addresses with a DHCP reservation or lease. Additionally, addresses are also considered assigned if they have a corresponding DNS record, a set custom property, or are currently undergoing discovery and ping tests. These settings can be configured in the **General** section of the :ref:`admin-system-settings`. 
    
    It's important to note that the rules defined in system settings do not apply to DHCP pools. In these pools an IP address is considered free if it is neither leased and not reserved, meaning the DHCP server is authorized to allocate it to clients or reserve it as needed.

   * **Claimed**: IP addresses that have been explicitly claimed using Micetro. 

   * **Held**: a free IP address that has been temporarily reserved (for up to 10 minutes) for a user who requested it. During this period, the user can complete the necessary information, such as adding a DNS record. This reservation ensures that no other user can be assigned the same IP address within this timeframe, preventing duplicate allocations.

   * **Reserved**: IP addresses with a DHCP reservation configured on them.

   * **Leased**: IP addresses currently leased through DHCP but not specifically claimed.

   * **Pending**: This is specific to the Workflow module. It indicates that there is a pending Change Request for an A record associated with this IP address. Although the address is otherwise available, it is marked as **Pending**  to avoid it from being assigned to another user while the change request awaits approval.

.. _ip-address-dialog:

Adding and Modifying Related DNS Data
--------------------------------------

The inspector located on the right side of the IP address list displays the properties associated with the selected IP address. The information included in the inspector may vary, depending on the custom properties defined in Micetro, as well as the presence of DNS or DHCP related data. 

In the **Related DNS Data** section, you can find all DNS records associated with the address. You can create new records or edit/delete the existing ones.

.. image:: ../../images/ip-inspector-Micetro.png
  :width: 30%
  :align: center
|

.. _ipam-add-dns-host:

Adding a DNS Record
^^^^^^^^^^^^^^^^^^^

1. Select the desired IP address in the IP address list.

2. In the :guilabel:`Related DNS data` section of the inspector, click the create :guilabel:`+` button.

3. Fill in the **Create DNS Record** dialog box. :guilabel:`Address` is automatically filled with the selected IP address.

   .. image:: ../../images/ip-create-dns-Micetro.png
     :width: 50%

2. Click :guilabel:`Create now` or :guilabel:`Add to request`. See :ref:`webapp-workflows` for further details.

Editing a DNS Record
^^^^^^^^^^^^^^^^^^^^

1. In the :guilabel:`Related DNS data` section of the inspector, select :guilabel:`Edit` on the row :guilabel:`...` menu for the relevant DNS record.

2. Make the desired changes and click :guilabel:`Save now` or :guilabel:`Add to request`. See :ref:`webapp-workflows` for further details.

Removing a DNS Record
^^^^^^^^^^^^^^^^^^^^^

1. In the :guilabel:`Related DNS data` section of the inspector, select :guilabel:`Delete` on the row :guilabel:`...` menu for the relevant DNS record.

2. Select :guilabel:`Delete now` or :guilabel:`Add to request`. See :ref:`webapp-workflows` for further details.

3. The host details are deleted and removed from the inspector.

.. _split-range-wizard:

Allocating Subranges
----------------------

You can create multiple subnets from an existing network that resides on subnet boundaries and currently has no subnets configured.

**To allocate subranges**:

1. On the **IPAM** page, select the network you want to allocate from.

2. Select :guilabel:`Allocate subranges` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

3. Configure the new subranges. If you select fewer subnets than fit within the network, you can set the offset from where to start the allocation. Click :guilabel:`Next` when you finish configuring.

   .. image:: ../../images/subranges-wizard.png
     :width: 65%

4. Define the title and custom properties for the new subranges. Click :guilabel:`Next` when you're done.

5. On the summary page, verify the new subranges and click :guilabel:`Finish`.

Joining Networks (Ranges)
-------------------------
With this feature, you can select and merge multiple networks. The :guilabel:`Join ranges` command becomes available if the selected networks can be joined.

**To join networks**:

1. On the **IPAM** page, select the ranges you want to join.

2. Select :guilabel:`Join ranges` on either the :guilabel:`Action` or the row :guilabel:`...` menu. 

   .. image:: ../../images/join-ranges.png
      :width: 90%
   
3. Configure the properties for the joined range:

   * **Use access from**: Select the range from which you want to inherit access permissions.

   * **Use properties from**: Select the range from which you want to inherit properties.

   * **Title**: Enter a title for the new range.

   * **Description**: Add a description if needed.

4. Click :guilabel:`Join`.

Host Discovery
---------------

With this feature, you can monitor the presence of hosts on your network and track when they were last detected. Host discovery can be accomplished through two methods: using ping or querying routers for host information.

Configuring Host Discovery Using Ping
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. On the **IPAM** page, select one or more networks.

2. Select :guilabel:`Set discovery schedule` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

3. Select the :guilabel:`Enable` checkbox.

4. Enter the :guilabel:`Frequency` and select the frequency unit on the :guilabel:`Every` dropdown list.

5. Set the date and time for the :guilabel:`Next run`.  

6. Click :guilabel:`Save`.

Once the schedule options have been configured, two columns - **Last Seen** and **Last Known MAC Address** - are added to the IP address list. The **Last Seen** column identifies the timestamp of when a host was last detected on the network.

   * **Green**: Host responded to the last PING request, displaying the date and time.

   * **Orange**: Host has responded in the past but did not respond to the last PING request. The date and time of the last response is shown.

   * **Red**: Host has never responded to a PING request, and the text **Never** is displayed.

Disabling Host Discovery
""""""""""""""""""""""""
At any time if you wish to disable host discovery, do the following:

1. Select the network(s) for which you want to disable discovery.

2. On the row :guilabel:`...` menu, select :guilabel:`Set discovery schedule`.

3. Clear the :guilabel:`Enable` checkbox.

4. Click :guilabel:`Save`.

Configuring Host Discovery by Querying Routers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

See :ref:`snmp-profiles`.

Subnet Discovery
----------------

The subnet discovery feature enables Micetro to obtain information about the subnets on the network through routers using SNMP. To activate the subnet discovery feature, ensure that :guilabel:`Synchronize subnets ...` is selected in the SNMP profile. For more information about SNMP profiles, see :ref:`snmp-profiles`.


Setting Subnet Monitoring
-------------------------

**To adjust monitoring settings for a subnet**:

1. Select the subnet(s) for which you want to change the monitoring setting.

2. Select :guilabel:`Set subnet monitoring` on either the :guilabel:`Action` or the row :guilabel:`...` menu. 

3. Complete the required details in the Subnet Monitoring dialog box.

   * **Enabled**: When selected, the subnet will be monitored.

   * **Script to invoke**: Enter the path of the script to run when the number of free addresses falls below the defined threshold. For information on the script interface and formatting, see :ref:`admin-change-events`.

   * **Email addresses**: Enter one or more email addresses separated by commas (for example, email@example.com,email@example.net) to receive notifications when the number of free addresses drops below the set threshold.

   * **Dynamic Threshold**: Define the threshold for the number of free addresses in a DHCP scope address pool.  NOTE:  For split scopes and scopes in a superscope (on MS DHCP servers) and address pools using the shared-network feature on ISC DHCP servers, the total number of free addresses in all of the scope instances is used when calculating the number of free addresses.

   * **Static Threshold**: Enter the threshold for the number of free addresses in a subnet.

   * **Only perform action once (until fixed)**: Select this option to execute the action only once when the number of free addresses falls below the threshold.

   * **Perform action when fixed**: Choose this option to execute the action when the number of free addresses is no longer below the threshold.

4. Click :guilabel:`OK` to confirm your settings.

.. _active-directory:

AD Sites and Subnets
--------------------

Micetro offers administrators the capability to integrate Active Directory (AD) sites into the IPAM context, view subnets within these sites, and add, remove, and move subnets between the sites.

.. note::
  Integration of AD sites and subnets is only available when Micetro Central is running on a Windows server. The integration is enabled by default. See :ref:`admin-general`.

  AD sites are only assigned to and visible in the ``Default`` address space.

  To add/remove a subnet to/from a site, the user must be assigned to a role with the *Edit range properties* permission set, and the role must be applied to the object. For more information about roles, see :ref:`access-control`.

AD sites and subnets are displayed on the :guilabel:`IPAM` page:

* Subnets in the main :menuselection:`IPAM --> Networks` table, along with all other subnets in Micetro (if any). The **AD Site** column displays the site to which the the subnet belongs.

* Sites in a separate :menuselection:`IPAM --> AD sites` table, grouped by Forests. The Inspector on the right-hand side displays the subnets (if any) belonging to the selected AD site.


AD Forests
^^^^^^^^^^^^

To manage sites and subnets, Micetro needs to be configured with AD Forest(s).

.. note::
  You can manage sites and subnets from multiple forests.

Adding an AD Forest
"""""""""""""""""""

1. On the **IPAM** page, select :guilabel:`AD sites` in the upper-left corner.

2. Select :guilabel:`Add Forest`.

3. Enter the necessary details in the Add Active Directory Forest dialog box.

   .. image:: ../../images/add-ad-forest.png
     :width: 60%


   * **Use same Global Catalog as the Micetro Central server**: If selected, Micetro will use the same Global Catalog server as the Micetro Central server is using. If you clear this checkbox, you must specify the Global Catalog server's FQDN or IP address in the **Global Catalog Server** field.

   * **Global Catalog Server**: If you want to specify a Global Catalog server, enter the server's FQDN or IP address in this field. (To unlock this field, the :guilabel:`Use same Global Catalog as the Micetro Central server` checkbox needs to be cleared.)

   * **Use the same credentials as the Micetro Central server**: If selected, Micetro uses the same credentials as the Micetro Central server when accessing the site information.

   * **User and Password**: If you don't want to use the default credentials for the machine running Micetro Central, enter the desired username and password in these fields. (To unlock these fields, the :guilabel:`Use the same credentials as the Micetro Central server` checkbox needs to be cleared.)

   * **Set as read-only**: If selected, users will be able to display data from Active Directory, but unable to make any modifications.

4. Click :guilabel:`OK` to save the changes. The forest is added and the sites belonging to the forest are displayed.

Editing AD Forests
""""""""""""""""""

**To edit an existing AD Forest (to, for example, change the read-only status)**:

1. On the **IPAM** page, select :guilabel:`AD sites` in the upper-left corner.

2. Select the AD forest you want to edit.

3. Select :guilabel:`Edit AD Forest` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

4. Update the settings in the dialog box.

5. Click :guilabel:`Save` to save your changes.

Removing an AD Forest
""""""""""""""""""""""""

**To remove an AD Forest**:

1. On the **IPAM** page, select :guilabel:`AD sites` in the upper-left corner.

2. Select the AD Forest(s) you want to remove.

3. Select :guilabel:`Remove AD Forest` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

4. Click :guilabel:`OK` in the confirmation box to remove the Forest(s).

Reloading the Sites in an AD Forest
"""""""""""""""""""""""""""""""""""""

Micetro Central regularly synchronizes data from AD Forests.

**To manually synchronize forests and reload the data for sites and subnets**:

1. On the **IPAM** page, select :guilabel:`AD Sites` in the upper-left corner.

2. Select the AD Forest(s) you want to synchronize.

3. Select :guilabel:`Synchronize` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

4. Click :guilabel:`OK` in the confirmation box to synchronize the Forests.


AD Subnets
^^^^^^^^^^^
Viewing Subnets in a Site
""""""""""""""""""""""""""

**To view subnets within a specific site**:

1. On the **IPAM** page, select :guilabel:`AD Sites` in the upper-left corner.

2. Select the AD Forest the site is in, or use the :ref:`webapp-quick-filter` to find it by name.

3. Select :guilabel:`View networks` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

This will open the :menuselection:`IPAM --> Networks` list with a filter applied to show all subnets that belong to the site.

.. note::
  You can also use the :guilabel:`-> View` button in the Inspector of the selected AD site to open the subnet view.

Moving Subnets Between AD Sites
""""""""""""""""""""""""""""""""

**To add subnet(s) to a site, or move between sites**:

1. On the **IPAM** page, select the subnet(s) in the list.

2. Select :guilabel:`Set AD Site` on either the :guilabel:`Action` menu or the row :guilabel:`...` menu.

3. Set the (new) AD Site in the dropdown and click :guilabel:`Save`.

.. note::
  Child subnets cannot be moved to a different site from their parent subnet unless the :guilabel:`Enforce site inheritance` checkbox is cleared in the System Settings.

  Subnets whose AD site settings are inherited from a parent range will have a ``<AD Site Name> (inherited)`` notation added.

  For more information, see System Settings, :ref:`admin-general`.

Removing Subnet from AD Site
"""""""""""""""""""""""""""""

1. Select the subnet(s) in the :menuselection:`IPAM --> Networks` list.

2. Select :guilabel:`Remove from AD Site` on either the :guilabel:`Action` menu or the row :guilabel:`...` menu.

3. Click :guilabel:`Yes` to confirm the removal.

Subnets Outside of Sites
"""""""""""""""""""""""""

**To view subnets that don't belong to any AD site**:

1. On the **IPAM** page, select :guilabel:`AD sites` in the upper-left corner.

2. Click the ``Flat view`` button (see :ref:`webapp-quick-filter`) next to the Quick Filter to change the view.

3. Sort the IP address ranges by the **AD Site** column in **ascending** order:

   .. image:: ../../images/subnets-outside-sites.png
     :width: 90%

Switching Between Address Spaces
---------------------------------

.. note::
  For information about managing address spaces, see :ref:`address-spaces`.

Micetro supports multiple address spaces, each containing its unique set of network components, such DNS servers, DNS zones, DHCP servers, DHCP scopes, IP address ranges (including both IPv4 and IPv6 root ranges), IP address entries, and folders.

Shared elements across all address spaces include:

* Users, groups, and roles.

* Custom property definitions (for more information about custom properties, see :ref:`admin-custom-properties`).

You can only work in one address space at a time. The current address space is visibly indicated in the lower-right corner of the :guilabel:`Networks` table on the :guilabel:`IPAM` page. Any changes made to data in one address space will not affect data in any other address space.

**To switch to a different address space**:

1. Click the **User** icon in the upper-right corner.

2. Hover over the current address space, then select your desired address space.

   .. image:: ../../images/address-space-Micetro.png
     :width: 50%
     
Working with Address (A) Records in DNS Zone Windows
-----------------------------------------------------

When the IPAM module is enabled, you may notice some differences when working with Address (A) records in DNS zones. One key change is the restriction on allowed IP addresses. 

The system administrator can control which IP addresses users are permitted to use and set a range of IP addresses they are allowed to work with. Additionally, administrators can decide whether users are allowed to use IP addresses already assigned in DNS. This means that there could be a predefined range of IP addresses that you're permitted to work with, and the system may prevent you from using IP addresses outside of this range.
