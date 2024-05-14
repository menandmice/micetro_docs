.. meta::
   :description: IP address management (IPAM) in Micetro
   :keywords: IPAM, IP address management

.. _ipam:

IPAM
=====

.. note::

  * To access the IP Address Management (IPAM) features in Micetro, you must enter the license key for the IPAM module.

  * This information applies to the Micetro Web Interface. For information about how to manage IP addresses in the Management Console, see :ref:`console-ipam`.

Managing IP addresses involves creating assignable ranges within the available address space and determining which users and groups are authorized to use that space. These ranges can be configured with specific properties that also determine the properties of the IP addresses inside them.


Switching Between address Spaces
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

|
Working with Address (A) Records in DNS Zone Windows
-----------------------------------------------------

When the IPAM module is enabled, you may notice some differences when working with Address (A) records in DNS zone windows, such as:

   * **Restriction on allowed IP Addresses**: With IPAM enabled, the system administrator can control which IP addresses users are permitted to use. The administrator can set a range of IP addresses that users are allowed to work with. Additionally, administrators can decide whether users can use IP addresses already assigned in DNS.

   * **Automatic assignment of IP Addresses**: The system administrator can configure Micetro so that you can create address (A) records without entering IP addresses. When the zone is saved, the system automatically assigns free IP addresses from your IP address range. If you want to enter an IP address manually, you can type it in the designated field. If you leave the field unchanged, the IP address will be automatically assigned when you save the zone. If you have access to multiple IP address ranges, you'll be prompted to select the preferred range for your new address records when saving.

.. _ipam-containers:

Containers
----------

A Container is a section of the address space reserved but not yet allocated. Within a container, you can define address ranges and scopes, and you can set privileges that apply to the enclosed ranges and scopes through access inheritance. You cannot allocate IP addresses from within a container unless you have enabled this functionality in the **IPAM** section of the :ref:`admin-system-settings`. 

.. _new-container:

Creating a New Container
^^^^^^^^^^^^^^^^^^^^^^^^^

You can convert a range existing on network boundaries (a subnet) into a Container, or vice versa.

1. On the :guilabel:`IPAM` page, select the range(s) you wish to convert.

2. Select :guilabel:`Convert to container` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

3. Confirm your selection to convert the chosen range(s) and provide a save comment if necessary.

Viewing IP Address Ranges
-------------------------
The **IPAM** page provides a comprehensive view of the IP address space accessible to the current user within the system. Micetro allows administrators to manage the IP address space by dividing it into named sub ranges, which can be allocated to specific groups for use by their members.

In the filtering sidebar, select  :guilabel:`IP Ranges`.

.. image:: ../../images/Networks-Micetro-10.5.png
  :width: 90%

* Use the buttons located at the upper-right of the table to choose between a flat and a hierarchical view for the address ranges scopes.

* When an address range contains no subranges, the utilization for the range is shown in the range list.

* On the :guilabel:`Action` menu you can use the :guilabel:`Find next free address` option to select the next available IP address within the range. Alternatively, selecting :guilabel:`Find random free address` will randomly select an available IP address.

To narrow down the results shown when viewing IP ranges, you can use the :ref:`webapp-quick-filter`. When using the tree view with an active filter, any parent ranges that do not match the search criteria will appear dimmed while the matching results are highlighted. For example, in the image below, we searched for the string ``3.1``.

.. image:: ../../images/ipam-tree-filter-Micetro.png
  :width: 90%
  
|
.. _ipam-range-config:

Creating New Networks
----------------------

**To create a new network**:

1. On the **IPAM** page, click the :guilabel:`Create` button.

2. Select the type of network you want to create (new network, :ref:`new-dhcp-scope`, :ref:`new-container`).

3. Fill in the necessary details. The *Create* wizard varies depending on the type you selected:

   * For a **network**, you can reserve network and broadcast address, and lock the range if needed. You can also assign it to an AD site, see :ref:`active-directory`.

   * A **DHCP scope** can be created with the network and broadcast addresses automatically configured, see :ref:`new-dhcp-scope`.

   * A **container** doesn't have a network or broadcast address, see :ref:`ipam-containers`.

4. Network configuration. Complete the Properties page in the final step, using the properties defined in :ref:`admin-custom-properties`.

5. Click :guilabel:`Finish`.

Once a non-reserved IP address range is created, it becomes managed by the **Networks** component and users with appropriate privileges can work with addresses from the range.

You can also create subranges of existing ranges and DHCP scopes.

.. note::
  When you create a new IP address range, Micetro checks to see if it can logically group the new range with other address ranges and adds the new range in the appropriate address range group.

Editing Network Properties
^^^^^^^^^^^^^^^^^^^^^^^^^^^

**To edit a network**:

1. Select the range in the list.

2. Select :guilabel:`Edit network properties` on either the :guilabel:`Action` or the row :guilabel:`...` menu. 

3. Make the desired changes to the network.

4. Click :guilabel:`Save`.

Deleting Networks
^^^^^^^^^^^^^^^^^^

When a network is deleted, the IP addresses associated with it inherit the attributes of the parent network. If the network being deleted contains subranges, those subranges will become children of the parent etwork of the unassigned networks.

**To delete a network definition**:

1. Select network(s) you wish to remove.

2. Select :guilabel:`Delete network` on either the :guilabel:`Action` or row :guilabel:`...` menu. 

3. You are prompted to confirm your decision to delete the(se) network(s). Click :guilabel:`Yes` to delete the range, or :guilabel:`No` to cancel.

IP Address List
---------------

To view a list of host entries within a specific network, double-click the network. This opens a list where you can view and edit the properties of individual IP address entries.

.. image:: ../../images/view-Networks-Micetro-10.5.png
  :width: 85%
  
* Use the :guilabel:`State` section in the filtering sidebar to filter the list by IP address state:

   * **Free**: addresses that are not actively in use, neither being pinged, assigned, nor claimed.

   * **Assigned**: addresses with a corresponding DNS record, a set custom property, or undergoing discovery and ping tests.

   * **Claimed**: addresses explicitly claimed using Micetro. Only the individual who claimed it or the administrator can remove the claim.

   * **Held**: 

   * **Reserved**: addresses with a DHCP reservation configured on them.

   * **Leased**: addresses currently leased through DHCP but not specifically assigned.

* The :guilabel:`PTR Status` column shows the status of the Address (A) record and Pointer (PTR) record mappings. This column can have three values:

    * **Empty**: The status is empty if there are no DNS records for the host. It is also empty if a PTR record exists where the domain in the data section of the PTR record is not managed by the system.

    * **OK**: If there is a match between the A and the corresponding PTR record(s) the status is listed as OK.

    * **Verify**: There isn't a match between the A and the PTR records for the host. Common reasons for this include:

         * An A record exists, but the PTR record is missing.

         * A PTR record exists, but the A record is missing.

         * The data section in the PTR record does not correspond to the name of the A record.

   When the PTR Status for a host entry shows as **Verify**, you can open the IP Address dialog box for the host to see more detailed information regarding which DNS host entry is generating this status message.

.. _ip-address-dialog:

Adding and Modifying Existing IP Address Entries
------------------------------------------------

The inspector located on the right side of the IP address list displays the properties associated with the selected IP address. The information included in the inspector may vary, depending on the custom properties defined in Micetro, as well as the presence of DNS or DHCP related data. In the **Related DNS Data** section, you can find all DNS records that are associated with the address. You have the option to create new records or edit/delete the existing ones.

.. image:: ../../images/ip-inspector-Micetro.png
  :width: 30%
  :align: center
|

.. _ipam-add-dns-host:

Adding a DNS Host
^^^^^^^^^^^^^^^^^

1. Select the desired IP address in the IP address list.

2. In the :guilabel:`Related DNS data` section of the inspector, click the create :guilabel:`+` button.

3. Fill in the **Create DNS Record** dialog box. :guilabel:`Address` is automatically filled with the selected IP address.

   .. image:: ../../images/ip-create-dns-Micetro.png
     :width: 50%
     :align: center

2. Click :guilabel:`Create now` or :guilabel:`Add to request`. See :ref:`webapp-workflows` for further details.

Editing a DNS Host
^^^^^^^^^^^^^^^^^^

1. In the :guilabel:`Related DNS data` section of the inspector, select :guilabel:`Edit` on the ellipsis menu for the relevant DNS record.

2. Make the desired changes and click :guilabel:`Save now` or :guilabel:`Add to request`. See :ref:`webapp-workflows` for further details.

Removing a DNS Host
^^^^^^^^^^^^^^^^^^^

1. In the :guilabel:`Related DNS data` section of the inspector, select :guilabel:`Delete` on the ellipsis menu for the relevant DNS record.

2. Select :guilabel:`Create now` or :guilabel:`Add to request`. See :ref:`webapp-workflows` for further details.

3. The host details are deleted and removed from the inspector.


.. _split-range-wizard:

Splitting/Allocating Subranges
-------------------------------

You can create multiple subranges from an existing range that resides on subnet boundaries and currently has no subranges configured.

1. On the **IPAM** page, select the range you wish to split.

2. Select :guilabel:`Allocate subranges` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

3. Configure the new subranges. If you opt for fewer subnets than can fit within the parent range, you can also set the offset from where you want to start allocating. Click :guilabel:`Next` when you finish configuring.

   .. image:: ../../images/subranges-wizard.png
     :width: 65%

4. Define the title and custom properties for the new subranges. Click :guilabel:`Next` when you're done.

5. On the summary page, verify the new subranges and click :guilabel:`Finish`.

.. note::
  In the Micetro web interface, the Split Range and Allocate Range wizards are combined. For information on these wizards in the Management Console, see :ref:`console-split-range` and :ref:`console-allocate-ranges`.


Joining Ranges
--------------
With this feature, you can select and merge multiple ranges. The Join Ranges command becomes available if the selected ranges can be joined.


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
--------------

With this feature, you can monitor the presence of hosts on your network and track when they were last detected. Host discovery can be accomplished through two methods: using ping or querying routers for host information.

Configuring Host Discovery Using Ping
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1.  On the **IPAM** page, select one or more IP ranges.

2. Select :guilabel:`Set discovery schedule` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

3. Select the :guilabel:`Enable` checkbox.

4. Enter the :guilabel:`Frequency` and select the frequency unit on the :guilabel:`Every` dropdown list.

5. Set the date and time for the :guilabel:`Next run`.  

6. Click :guilabel:`Save`.

Once the schedule options have been configured, two columns - **Last Seen** and **Last Known MAC Address** - are added to the range list. The **Last Seen** column identifies the timestamp of when a host was last detected on the network.

   * **Green**: Host responded to the last PING request, displaying the date and time.

   * **Orange**: Host has responded in the past but did not respond to the last PING request. The date and time of the last response is shown.

   * **Red**: Host has never responded to a PING request, and the text **Never** is displayed.

Disabling Host Discovery
""""""""""""""""""""""""
At any time if you wish to disable host discovery, do the following:

1. Select the object(s) for which you want to disable discovery.

2. On the row :guilabel:`...` menu, select :guilabel:`Set discovery schedule`.

3. Clear the :guilabel:`Enable` checkbox.

4. Click :guilabel:`Save`.

Configuring Host Discovery by Querying Routers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

See :ref:`snmp-profiles`.

Subnet Discovery
----------------

The subnet discovery feature enables Micetro to obtain information about the subnets on the network through routers using SNMP. The configuration process for this feature is identical to that of host discovery. To activate the subnet discovery feature, ensure that the  :guilabel:`Synchronize subnets ...` is selected in the SNMP profile. For more information about SNMP profiles, see :ref:`snmp-profiles`.

Adding/Removing IP Address Ranges from Folders
-----------------------------------------------

.. danger::
  Removing a range from a folder cannot be undone.

You can add or remove the currently selected IP address Range from folders.

1. On the **IPAM** page, select the range you want to add or remove.

2. Select :guilabel:`Add to folder` or :guilabel:`Remove from folder` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

Setting Subnet Monitoring
^^^^^^^^^^^^^^^^^^^^^^^^^

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

* subnets in the main :menuselection:`IPAM --> Networks` table, along with all other subnets in Micetro (if any). The **AD Site** column displays the site to which the the subnet belongs.

* sites in a separate :menuselection:`IPAM --> AD sites` table, grouped by Forests. The Inspector on the right-hand side displays the subnets (if any) belonging to the selected AD site.

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
  
|
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

3. Update the settings in the dialog box.

4. Click :guilabel:`Save` to save your changes.

Removing an AD Forest
""""""""""""""""""""""""

**To remove an AD Forest from Micetro**:

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
----------

Viewing Subnets in a Site
^^^^^^^^^^^^^^^^^^^^^^^^^

**To view subnets within a specific site**:

1. On the **IPAM** page, select :guilabel:`AD Sites` in the upper-left corner.

2. Select the AD Forest the site is in, or use the :ref:`webapp-quick-filter` to find it by name.

3. Select :guilabel:`View networks` on either the :guilabel:`Action` or the row :guilabel:`...` menu.

This will open the :menuselection:`IPAM --> Networks` list with a filter applied to show all subnets that belong to the site.

.. note::
  You can also use the :guilabel:`-> View` button in the Inspector of the selected AD site to open the subnet view.

Moving Subnets Between AD Sites
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**To add subnet(s) to a site, or move between sites**:

1. On the **IPAM** page, select the subnet(s) in the list.

2. Select :guilabel:`Set AD Site` on either the :guilabel:`Action` menu or the row :guilabel:`...` menu.

3. Set the (new) AD Site in the dropdown and click :guilabel:`Save`.

.. note::
  Child subnets cannot be moved to a different site than the parent subnet unless the ``Enforce site inheritance`` checkbox is cleared in the System Settings dialog box.

  Subnets whose AD site settings are inherited from a parent range will have a ``<AD Site Name> (inherited)`` notation added.

  See :ref:`admin-general`.

Removing Subnet from AD Site
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Select the subnet(s) in the :menuselection:`IPAM --> Networks` list.

2. Select :guilabel:`Remove from AD Site` on either the :guilabel:`Action` menu or the row :guilabel:`...` menu.

3. Click :guilabel:`Yes` to confirm the removal.

Subnets Outside of Sites
^^^^^^^^^^^^^^^^^^^^^^^^

**To view subnets that don't belong to any AD site**:

1. On the **IPAM** page, select :guilabel:`AD sites` in the upper-left corner.

2. Click the ``Flat view`` button (see :ref:`webapp-quick-filter`) next to the Quick Filter to change the view.

3. Sort the IP address ranges by the **AD Site** column in *ascending* order:

   .. image:: ../../images/subnets-outside-sites.png
     :width: 90%
 
