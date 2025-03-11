.. meta::
   :description: Configuring and managing xDNS profiles in Micetro
   :keywords: xDNS Redundancy, DNS, Micetro 

.. _xdns-redundancy:

Setting up xDNS Redundancy
--------------------------

xDNS (Cross-Domain Name System) redundancy helps ensure the availability and reliability of your DNS infrastructure. It allows you to create backup DNS configurations, so if one DNS server or service fails another can seamlessly take over, ensuring uninterrupted access to your websites or services. 

* **Creating Redundancy Groups**: With xDNS profiles, you can create groups that consist of multiple DNS servers and services. These groups are designed to manage the authority of a specific list of DNS zones.
* **Identical Zone Content**: Once you've set up an xDNS redundancy group, the system assists you in generating identical copies of the DNS zone content across multiple primary zones. This replication ensures that all zones within the group are the same in every aspect.
* **Flexibility**: You can add or remove zones from the xDNS profile as your needs evolve.

xDNS profiles 
^^^^^^^^^^^^^
xDNS Profiles group together two or more DNS services that share the authority of a list of zones. Any changes made to these zones, within or outside Micetro, are automatically synchronized across all DNS services within the profile. In case of conflicts, Micetro has a built-in conflict resolution strategy to handle them.

Each profile has the following properties: 

* **Name**: A unique identifier for the profile. 

* **Description**: An optional field to describe the purpose of the xDNS profile. 

* **Conflict Strategy**: Determines whether Micetro overwrites or merges record conflicts that may arise during synchronization. This also serves as the default when adding new zones to the profile. 

      * **Overwrite existing zones**: If a zone with the same name exists on any other DNS service included in the xDNS profile, its records will be overwritten with the record data from the zone instance being added to the xDNS profile.
      * **Merge records**: If a zone with the same name exists on any secondary service, its contents will be merged with the contents of the zone on the primary service.

* **Servers**: At least two DNS services must be added to the profile. Each service can also be configured to reject external changes. This means changes to record data made on one service outside Micetro will not be replicated by xDNS to other services. 

**To access xDNS profiles**:

1. On the **Admin** page, select the :guilabel:`Configuration` tab.
2. Select the :guilabel:`xDNS Profiles` tab in the leftmost sidebar.

   .. image:: ../../images/xdns-profiles.png
     :width: 90%

Creating and editing xDNS profiles 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::
  To create or edit an xDNS profile, you must have administrative access within Micetro to the DNS Services you want to include. 

* **To create a new profile**, select :guilabel:`+ Create Profile` in the bottom right corner of the xDNS Profiles list and enter the required information into the **Create xDNS Profile** dialog box.

    .. image:: ../../images/create-xdns-profile.png
      :width: 75%

* **To edit a profile**, select the relevant profile, and then select :guilabel:`Edit profile` on the Row :guilabel:`...` menu. You can also double-click the profile. Edit the information as needed and select **Save**.

.. note::
   The list of servers **cannot** be changed after the profile has been created.

Configuring TTL for DNS records in xDNS profiles
""""""""""""""""""""""""""""""""""""""""""""""""
You can specify the default Time-to-Live (TTL) for DNS records created within zones for all xDNS profiles. This setting determines how long DNS information remains cached by DNS resolvers before requesting updated data.

**To configure TTL for DNS records in xDNS profiles**:

1. On the **Admin** page, select the :guilabel:`Configuration` tab.
2. On the :guilabel:`System Settings` tab in the leftmost sidebar, select :guilabel:`Advanced`.
3. Enter your desired TTL value in the appropriate field.

Adding zones to xDNS profiles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
xDNS profiles initially do not include any zones. To add a DNS zone to an xDNS profile, you must have *create zone access* on all DNS services included in the xDNS profile. 

**To add zones to xDNS profiles**:

1. On **DNS** page, select :guilabel:`Primary Zones` on the leftmost sidebar, if not already selected.

  .. note::
    xDNS only supports primary zones.

2. Select the zone(s) you want to add to an xDNS profile.
2. Use the :guilabel:`Action` menu or Row :guilabel:`...` menu to select :guilabel:`Add to xDNS profile`.
3. On the :guilabel:`Actions` menu, select :guilabel:`Add to xDNS profile`. You can also select this option on the row :guilabel:`...` menu.

   .. image:: ../../images/add-to-xdns-profile.png
     :width: 60%
  
4. In the dialog box, use the dropdown to select the xDNS **Profile** you want to add the zone(s) to.
   
   When a profile is selected on the :guilabel:`Profile` menu, Micetro runs preflight checks and displays any warnings or potential errors that are detected. 

    .. image:: ../../images/xdns-preflight-errors.png
     :width: 90%

5. Select :guilabel:`Add`.

Adding a zone to xDNS will, if necessary, create zone instances on other DNS services included in the selected profile and add delegation records. Afterward, other record data from the source zone will be replicated to the newly created zone instances.

The **DNS** grid will only display one instance, with the **Authority** column showing the name of the profile to which the zone has been added.

  .. image:: ../../images/xdns-zone-authority.png
    :width: 90%
    :align: center

xDNS Status on zones
^^^^^^^^^^^^^^^^^^^^
You can monitor the status of xDNS zones in the Inspector. Each underlying zone instance is represented by the name of the DNS service and a traffic light indicator.

  .. image:: ../../images/xdns-status.png
    :width: 80%

It's possible to select multiple zones if all xDNS zones belong to the same profile, with each entry showing the aggregate state of the zone instances on each DNS service. If zones from multiple profiles are selected, the **xDNS Status** section will be hidden.

Removing zones from xDNS profiles 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Removing a zone stops all replication between zone instances on each DNS service. Delegation remains unchanged, and no zone instances are deleted.

**To remove a zone from an xDNS profile**:

1. On the **DNS** page, select the zone you want to remove from a profile.
2. Use the :guilabel:`Action` menu or Row :guilabel:`...` menu to select :guilabel:`Remove from xDNS profile`.
3. In the dialog box, confirm you want to stop syncing the zone with xDNS by selecting :guilabel:`Remove`.

Deleting xDNS profiles 
^^^^^^^^^^^^^^^^^^^^^^

.. note::
  To delete an xDNS profile, you must have administrative access to all DNS services within the profile in Micetro. 

When an xDNS profile is deleted, each service retains a copy of the zones from the profile, but replication between them is stopped. 

**To delete an xDNS profile**:

1. On the :guilabel:`Configuration` tab of the **Admin** page, select the :guilabel:`xDNS Profiles` tab in the leftmost sidebar.
2. Select the profile you want to delete.
3. Use the Row :guilabel:`...` menu, select :guilabel:`Delete profile`.

xDNS zones and API
^^^^^^^^^^^^^^^^^^^^^^
xDNS zones are represented as single instances in the API, with the Authority value denoting the profile to which they belong. Individual zone instances remain accessible, for example, by calling ``GetDNSZones`` and filtering for each DNS service via the ``dnsServerRef`` parameter. 
