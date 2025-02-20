.. meta::
   :description: Access control for groups in Micetro 
   :keywords: Micetro access model

.. _acl-groups:

Groups
------

Groups allow you to manage multiple individual users, based on needs for the same access across the system. You can add users to a group to provide those selected users access to the same objects.

To view and manage existing groups, navigate to :menuselection:`Admin --> Configuration --> Access Management` and select :guilabel:`Groups`. A list of groups and related information is displayed. By selecting a group from the grid, the Inpsector populates with an overview of that group's properties, such as a description and included roles.

External Groups
^^^^^^^^^^^^^^^
For external groups, such as those managed in Active Directory, use the :guilabel:`Add --> AD group` or :guilabel:`Add --> LDAP group`. The **group name** field must match the name in the external authentication. See :ref:`webapp-external-auth`.

.. note::
  When adding a group to Micetro, external groups do not have a dedicated :guilabel:`Users` tab.  After the external group is added to Micetro, it will not contain users. Users are only added to the external group after their first login.

For more information, see :ref:`active-directory` and :ref:`webapp-external-auth`.

Adding a New Group
^^^^^^^^^^^^^^^^^^
You can create add new groups at any time. With Micetro, you have the option to add either:

* A Micetro group --- authenticated and managed through Micetro only
* An AD group --- authenticated and managed through an external source, e.g., Active Directory

**To add a new Micetro group**:

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the leftmost sidebar. The default groups are displayed here, as well as any other groups you have already created.

2. Click the :guilabel:`Add` button and select :guilabel:`Micetro group`.

3. Enter the following information in the dialog box:

      .. image:: ../../images/create-micetro-group.png
         :width: 60%

  * **Group name** --- The name for the group you are creating.

  * **Description** --- (Optional) A description of the group's function.

  * **External ID** --- Enter an external ID string to associate with the group. When provided this group name will be matched against groups defined in the external authentication source. For more information how on this works, refer to :ref:`webapp-external-auth`.

  * **Roles** --- Select any roles that members of this group will automatically assume.

  * **Users** --- Select users that you want to add to this group. (Users can be added/removed at any time.)

3. When all selections and entries are made, click :guilabel:`Create`.

**To add a new AD group**:

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the leftmost sidebar. The default groups are displayed here, as well as any other groups you have already created.

2. Click the :guilabel:`Add` button and select :guilabel:`AD group`.

3. Enter the following information in the dialog box:

      .. image:: ../../images/create-ad-group.png
         :width: 60%

  * **AD group name** --- The name for the Active Directory group you are creating.

  * **Description** --- (Optional) A description of the group's function.

  * **External ID** --- Enter an external ID string to associate with the group. When provided this group name will be matched against groups defined in the external authentication source. For more information how on this works, refer to :ref:`webapp-external-auth`.

  * **Roles** --- Select any roles that members of this group will automatically assume.

4. When all selections and entries are made, click :guilabel:`Add`.

Editing a Group
^^^^^^^^^^^^^^^
If you need to make changes to a group, you can edit the group name and/or description, and indicate whether this group is Active Directory-integrated.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the leftmost sidebar.

2. To select a single group, click on the group's name. To select multiple groups, press/hold the **Ctrl** (**Cmd** on Mac) key and then click on each group's name.

3. On either the :guilabel:`Action` or Row :guilabel:`...` menu, select :guilabel:`Edit group properties`.

4. Make the desired changes to the group's information. On the :guilabel:`Users` tab, you can remove users from the group.

5. Click :guilabel:`Save` to save the changes.

Removing a Group
^^^^^^^^^^^^^^^^
When necessary, you can remove a group from Micetro.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the leftmost sidebar.

2. To remove a single group, click on the group's name. To remove multiple groups, press/hold the **Ctrl** (**Cmd** on Mac) key and then click on each group's name.

3. On either the :guilabel:`Action` or Row :guilabel:`...` menu, select, select :guilabel:`Remove group`.

4. To remove the group, click the :guilabel:`Yes` button. The group is removed.

