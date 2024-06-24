.. meta::
   :description: Active Directory integration in Micetro
   :keywords: AD Sites, active directory, ad forest, IPAM


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
