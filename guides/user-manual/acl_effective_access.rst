.. meta::
   :description: Effective access in Micetro by Men&Mice 10.1
   :keywords: Micetro access model

.. _acl-effective-access:

Effective access
----------------

The *Effective access* dialog is useful for checking access for a user/group, and to troubleshoot access control problems.


Administrator with access to managing users/groups in Micetro can check the effective access of a user or group based on the role(s) the user/group is assigned to.

1. Navigate to :menuselection:`Admin --> Configuration` in the web application.

2. Select :guilabel:`Users` or :guilabel:`Groups`, depending on whose access you want to check.

3. Select the user/group in the grid, and use the :guilabel:`Effective access` action from the top bar or the ellipsis menu.

Micetro access
   It shows all *enabled* permissions for the user/group.

   .. image:: ../../images/effective-access-micetro.png
      :width: 80%
      :align: center

Object access
   Here you can select an object type and search for a specific object to check the access the selected user/group has, as well as where the access comes from.

   .. image:: ../../images/effective-access-object.png
      :width: 80%
      :align: center

.. information::
   The *Effective access* dialog will display detailed warnings if permissions to the selected object are set, but a parent permission is not.

   *Example:* examining effective access on a DNS zone might reveal that the user is attached to a role that has permission to view DNS zones, but no permission to use the DNS module.

.. tip::
   By hovering over the :guilabel:`i` icon in the permissions list, the role(s) where the permission was set is displayed.
