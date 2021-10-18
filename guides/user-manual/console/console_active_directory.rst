.. _active-directory-console:

AD Sites and Subnets (Management Console, deprecated)
=====================================================

Overview
--------

With this feature, it is possible to integrate Active Directory (AD) sites in Micetro, view subnets within these sites and add, remove and move subnets between the sites.

Once Sites and Subnets integration has been enabled, an AD Sites object displays in the object list on the left hand side of the Manager window and a new column, AD Site displays in the range list in the Manager window.

A few things to note:

* This feature is only available if Men&Mice Central is running on a Windows machine.

* You can configure the system to view sites and subnets from multiple AD forests.

* If you are using multiple address spaces, you will only be able to view AD Sites in the Default address space.

* To add/remove a subnet to/from a site, the user must have the Can edit range properties flag set for the subnet.

Adding an AD Forest
-------------------

To manage sites and subnets, you must first add the AD forest.

.. note::
  You can manage sites and subnets from multiple forests.

1. In the Object Browser, right-click on the :guilabel:`AD Sites` object category.

2. From the shortcut menu, select :guilabel:`Add AD Forest`. A dialog box displays.

.. image:: ../../../images/console-ad-add-forest.png
  :width: 60%
  :align: center

Use same Global Catalog as the Men&Mice Central server.
  If checked, Micetro will use the same Global Catalog server as the Men&Mice Central server is using. If you unselect this checkbox, you must specify the Global Catalog server in the Global Catalog Server field.

Global Catalog Server.
  If you want to specify a non-default Global Catalog server, enter the server name in this field. To enable this field, you must first unselect the :guilabel:`Use same Global Catalog as the Men&Mice Central server` checkbox.

Use the same credentials as the Men&Mice Central server.
  If checked, Micetro uses the same credentials as the Men&Mice Central server when accessing the site information.

User and Password.
  If you don't want to use the default credentials for the machine running Men&Mice Central, enter the desired user name and password in these fields. To enable these fields, you must first unselect the :guilabel:`Use the same credentials as the Men&Mice Central server` checkbox.

Set as read only.
  If checked, Micetro will only read from the Active Directory but not make any modifications.

3. Click :guilabel:`OK` to save the changes. The forest is added and the sites belonging to the forest are displayed.

Changing AD Forest Properties
-----------------------------

To change the properties for an AD Forest, do the following:

1. In the Object Browser, expand the :guilabel:`AD Sites` object category.

2. Right-click the Forest you want to change, and select :guilabel:`Properties`.

3. Enter the required information in the dialog box.

4. Click :guilabel:`OK` to save your changes.

Removing an AD Forest
---------------------

To remove an AD Forest from Micetro:

1. In the Object Browser, expand the :guilabel:`AD Sites` object category.

2. Right-click the Forest you want to change, and select :guilabel:`Remove AD Forest(s)``.

3. Click :guilabel:`OK` in the confirmation box to remove the Forest.

Reloading the Sites in an AD Forest
-----------------------------------

The list of sites in an AD Forest is reloaded on a regular basis. To manually reload the list of sites:

1. In the Object Browser, expand the :guilabel:`AD Sites` object category.

2. Right-click the Forest you want to reload, and select :guilabel:`Reload AD Sites`.

Managing Subnets in a Site
--------------------------

* To view subnets in a specific site, click the site in the object list. A list of the subnets is shown in the Manager window.

* To add a subnet to a site, just drag the subnet from the list of subnets in the Manager window to the site. The subnet is added to the site in AD. When a subnet is placed in a site, all subnets contained within that subnet are placed in the site as well. It is not possible to assign these subnets to a different site.

* To remove a subnet from a site, right-click the subnet and choose :guilabel:`Remove from AD Site`. The subnet is removed from the site in AD. When a subnet is removed from a site, all subnets contained within that subnet are removed from the site as well.

* To move a subnet to a different site, drag the subnet to the new site. The subnet is moved to the site in AD.

.. note::
  Child subnets cannot be moved to a different site than the parent subnet unless the Enforce site inheritance checkbox is unchecked in the System Settings dialog box. It is also possible to move a subnet to a different site by selecting the site from a drop-down list in the Range or Scope Properties dialog box.

* To view subnets that don't belong to a site, sort the IP Address ranges by the AD Site column in ascending order. You may want to use the flat view for the IP Address ranges when performing this action.
