.. meta:: 
   :description: Access control for groups in Micetro by Men&Mice 10.1
   :keywords: Micetro access model

.. _acl-groups:

Groups
------

Groups allow you to manage multiple individual users who have the same access and/or permissions across the system.

Adding a New Group
^^^^^^^^^^^^^^^^^^

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the filtering sidebar. The default groups are displayed here, as well as any other groups you have already created.

2. Click the :guilabel:`Create` button. The *Create group* dialog box displays.

  Group name
    The name for the group you are creating.

  Description field
    (Optional) Some information that describes the function of this group.

  AD Integrated
    Check this box to define this group as an Active Directory Integrated group. When checked this group name will be matched against groups defined in Active Directory. For more information how on this works refer to External Authentication.

  Roles
    Any roles that members of this group will automatically assume.

.. image:: ../../images/admin-new-group.png
  :width: 60%
  :align: center

3. When all selections/entries are made, click :guilabel:`Save`.

Editing a Group
^^^^^^^^^^^^^^^

Through this function, you can edit the group name and/or description, and indicate whether this group is Active Directory integrated.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the filtering sidebar.

2. To select a single group, click on the group's name. To select multiple groups, press/hold the Ctrl (Cmd on Mac) key and then click on each group's name.

3. From the ellipsis menu, select :guilabel:`Edit group properties` or use :menuselection:`Actions --> Edit group properties`.

4. Make the desired changes to the group's information. In the :guilabel:`Users` tab you can remove users from the group.

5. Click :guilabel:`Save` to save the changes.

Deleting a Group
^^^^^^^^^^^^^^^^

Through this function, you delete a group.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the filtering sidebar.

2. To remove a single group, click on the group's name. To remove multiple groups, press/hold the Ctrl (Cmd on Mac) key and then click on each group's name.

3. From the ellipsis menu, select :guilabel:`Remove user` or use :menuselection:`Actions --> Remove user`.

4. To remove the group, click the :guilabel:`Yes` button. The group is removed.
