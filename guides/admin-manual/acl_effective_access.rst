.. meta::
   :description: Effective access in Micetro
   :keywords: Micetro access model

.. _acl-effective-access:

Effective access
----------------
An administrator with access permissions to manage users and groups in Micetro can check the effective access of a user or group based on the role(s) they have been assigned. Checking effective access can be useful when troubleshooting access control issues.

**To check a user or group's effective access**:

1. Navigate to :menuselection:`Admin --> Configuration`.

2. In the leftmost sidebar, select either :guilabel:`Users` or :guilabel:`Groups`, depending on whose access you want to check.

3. Select the user/group in the grid, and then use either the :guilabel:`Action` or Row :guilabel:`...` menu to select :guilabel:`View effective access`.

4. The **View Effective Access** dialog displays two tabs:

   Micetro Access
      Shows all **enabled** permissions for the user/group.

   .. image:: ../../images/effective-access-micetro.png
      :width: 80%
      :align: center

   Object Access
      Shows all objects the user/group has access to. You can select an object type and search for a specific object to check the user/group's access, as well as where the access comes from.

      .. tip::
         By hovering over the :guilabel:`i` icon in the permissions list, the role(s) where the permission was set is displayed.

   .. image:: ../../images/effective-access-object.png
      :width: 80%
      :align: center

.. note::
   The **View Effective Access** dialog box displays detailed warnings if permissions to the selected object are set but a parent permission is not.

   Example: Examining effective access on a DNS zone might reveal that the user is assigned to a role with permission to view DNS zones, but not to use the DNS module.
