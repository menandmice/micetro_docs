.. _webapp-user-management:

User Management
***************

User Management involves both creating groups as well as creating :ref:`users` to associate with :ref:`groups`. For more information refer to :ref:`access-control`.

.. image:: ../../images/admin-user-management.png
  :width: 80%
  :align: center

.. _users:

Users
=====

Each user defined in Micetro can be a part of one or more groups. Before creating a user, it is recommended to define different groups so you can assign users directly to the desired group as you create their accounts.

.. note::
  "administrator" is the user already configured for the application. In order to manage users, you have to be logged in as a user who has user management privileges.

Adding User Accounts
--------------------

Through this function, you add new users who can then be assigned to groups.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Users` in the filtering sidebar. The default administrator account displays here, as well as any other users you have already added.

2. Click the :guilabel:`Create` button. The *Create user* dialog box displays.

  Name
    Type the **username** that you want to as assign to this person.

  .. warning::
    Once you have created the user name, it is not possible to change it.

  Full Name and Description
    (Optional) Type the user's first and last name and a description of their duties (i.e., job title, department, etc.), respectively.

  Authentication type
    Click the drop-down list and specify whether the user's login will be authenticated by Micetro or by an external authentication service (such as existing Active Directory account on the network).

  Email address
    The user's email address. Used for sending notifications such as scheduled reports, subnet monitoring updates, etc.

  Password/Confirm Password
    If the **Authentication type** selected is *Men&Mice internal*, you need to provide a password for the user in the Password field. Passwords must be at least four characters in length and no longer than 20 characters. Passwords can contain any combination of letters and numbers, but cannot include spaces or special characters. In the Confirm Password field, re-enter the password exactly as you did in the Password field above.

  In the :guilabel:`Groups` and :guilabel:`Roles` tabs, select the user group(s) and role(s) to which you want to assign this user.
    Each user can be assigned to none or to multiple groups and roles. There are five default groups defined in Men&Mice Suite:

      * **Administrators**. Full access to everything.
      * **DNS Administrators**. Full access to all DNS related objects, such as zones, DNS servers, etc.
      * **DHCP Administrators**. Full access to DHCP related objects, including DHCP scopes, DHCP servers, etc.
      * **IPAM Administrators**. Full access to IPAM related objects, including IPAM ranges, etc.
      * **Users Administrators**. Full access to User and Group objects.

  .. note::
    If you have not created your groups, you can always come back and edit the user accounts anytime and change the group assignments.

3. When all selections/entries are made, click :guilabel:`Create`. The new user is added to the *Users* list and can now use Micetro.

Editing User Accounts
---------------------

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Users` in the filtering sidebar.

2. To select a single user, click on the user's name. To select multiple users, press/hold the Ctrl (Cmd on Mac) key and then click on each user name.

3. From the ellipsis menu, select :guilabel:`Edit user properties` or use :menuselection:`Actions --> Edit user properties`.

4. Make the desired changes to the user's information.

5. Click :guilabel:`Save` to save the changes.

Removing User Accounts
----------------------

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Users` in the filtering sidebar.

2. To remove a single user, click on the user's name. To remove multiple users, press/hold the Ctrl (Cmd on Mac) key and then click on each user name.

3. From the ellipsis menu, select :guilabel:`Remove user` or use :menuselection:`Actions --> Remove user`.

4. To remove the user, click the :guilabel:`Yes` button. The user is removed.

User Inspector
--------------

Selecting an user displays a list of information in the Inspector, including the user name, authentication type, roles, etc. Only users with user administrative privileges can see this information.

.. _groups:

Groups
======

Through this function, you create and manage groups. Groups allow you to manage multiple individual users who have the same access and/or permissions across the system.

Adding a New Group
------------------

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
---------------

Through this function, you can edit the group name and/or description, and indicate whether this group is Active Directory integrated.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the filtering sidebar.

2. To select a single group, click on the group's name. To select multiple groups, press/hold the Ctrl (Cmd on Mac) key and then click on each group's name.

3. From the ellipsis menu, select :guilabel:`Edit group properties` or use :menuselection:`Actions --> Edit group properties`.

4. Make the desired changes to the group's information. In the :guilabel:`Users` tab you can remove users from the group.

5. Click :guilabel:`Save` to save the changes.

Deleting a Group
----------------

Through this function, you delete a group.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Groups` in the filtering sidebar.

2. To remove a single group, click on the group's name. To remove multiple groups, press/hold the Ctrl (Cmd on Mac) key and then click on each group's name.

3. From the ellipsis menu, select :guilabel:`Remove user` or use :menuselection:`Actions --> Remove user`.

4. To remove the group, click the :guilabel:`Yes` button. The group is removed.

Roles
=====

Through this function, you create and manage roles. Roles allow you to manage access controls for users and groups.

Adding a New Role
-----------------

Through this function, you add new users who can then be assigned to groups.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Roles` in the filtering sidebar. The built-in roles are displayed here, as well as all other roles that have been added to Micetro already.

2. Click the :guilabel:`Create` button. The *Create role* dialog box displays.

.. image:: ../../images/admin-new-role.png
  :width: 60%
  :align: center

Role name
  Give the new role a name.

Description
  Brief description for the role.

.. note::
  To edit a role's permissions, see :ref:`access-control`.

3. When all necessary information is filled in, click :guilabel:`Save`.

Editing a Role
---------------

Through this function, you can edit the role's name and/or description.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Roles` in the filtering sidebar.

2. To select a single role, click on the role's name. To select multiple roles, press/hold the Ctrl (Cmd on Mac) key and then click on each role's name.

3. From the ellipsis menu, select :guilabel:`Edit role properties` or use :menuselection:`Actions --> Edit role properties`.

4. Make the desired changes to the role's information. In the :guilabel:`Users` tab you can remove users from the role(s).

5. Click :guilabel:`Save` to save the changes.

Deleting a Role
---------------

Through this function, you remove a role from Micetro.

.. note::
  Built-in roles cannot be removed.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Roles` in the filtering sidebar.

2. To remove a single role, click on the role's name. To remove multiple roles, press/hold the Ctrl (Cmd on Mac) key and then click on each role's name.

3. From the ellipsis menu, select :guilabel:`Remove role` or use :menuselection:`Actions --> Remove role`.

4. To remove the role, click the :guilabel:`Yes` button. The role is removed.

Access control
==============

See :ref:`access-control`.
