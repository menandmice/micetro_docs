.. meta::
   :description: Access control for users in Micetro
   :keywords: Micetro access model

.. _acl-users:

Users
-----

Users represent the individual people working with Micetro.

.. note::
  To manage users, you must be logged in as a user who has user management privileges (attached to a role with the ``access_adminUser``/"*Administer users/groups/roles*" permission enabled).

The **Users** grid displays a list of all the users you have added to Micetro, including the ``administrator`` user, which is always configured for Micetro. Refer to :ref:`administrator`.

Selecting a user populates the Inspector with information about that user, including their username, authentication type, groups, roles, etc. Only users with user administrative privileges can view this information.

Adding User Accounts
^^^^^^^^^^^^^^^^^^^^
You can add new users to Micetro, who you can then assign to groups and roles.

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Users` in the leftmost sidebar. The default administrator account is displayed here, as well as any other users you have already added.

2. Click the :guilabel:`Create` button.

3. In the **Create User** dialog, enter the following information:

   .. image:: ../../images/admin-add-user.png
      :width: 70%
      :align: center

* **Username** --- The username you want to assign to this user.

  .. warning::
    Once you have created the user name, it is not possible to change it.

* **Full name** --- The user's first ane last names.

* **Description** --- A description of the user's duties, i.e., job title, department, etc., respectively.

* **Authentication type** --- Use the dropdown menu to specify whether the user's login will be authenticated by Micetro or an external authentication service, e.g., an existing Active Directory account on the network. Refer to :ref:`webapp-external-auth`.

* **Email address** --- The user's email address, which Micetro uses to send notifications such as scheduled reports, subnet monitoring updates, etc. Disabled with external authentication.

* **Password/Confirm password** --- If the selected **Authentication type** is *Micetro*, you must provide a password for the user to use. Passwords must be at least four characters and at most 20 characters in length, and can contain any combination of letters, numbers, and special characters, including spaces. In the **Confirm password** field, re-enter the password exactly as it appears in the **Password** field. Disabled with external authentication.

4. On the :guilabel:`Roles` and :guilabel:`Groups` tabs, select the role(s) and user group(s) to which you want to assign this user. Each user can be assigned to none or to multiple groups and roles.

   .. note::
      If you have not created your groups, you can return to edit the user accounts and change the group assignments at any time.

5. When completed, click :guilabel:`Create`. The new user is added to the **Users** list and can now use Micetro.

Editing User Accounts
^^^^^^^^^^^^^^^^^^^^^

1. Navigate to :menuselection:`Admin --> Configuration`, and select :guilabel:`Users` in the leftmost sidebar.

2. To select a single user, click on the user's name. To select multiple users, press/hold the **Ctrl** (**Cmd** on Mac) key and then click on each username.

3. On either the :guilabel:`Action` or Row :guilabel:`...` menu, select :guilabel:`Edit user properties`.

4. Make the desired changes to the user's information.

5. Click :guilabel:`Save` to save the changes.

Removing User Accounts
^^^^^^^^^^^^^^^^^^^^^^

1. Navigate to :menuselection:`Admin --> Configuration`, and select :guilabel:`Users` in the leftmost sidebar.

2. To remove a single user, click on the user's name. To remove multiple users, press/hold the **Ctrl** (**Cmd** on Mac) key and then click on each username.

3. On either the :guilabel:`Action` or Row :guilabel:`...` menu, select :guilabel:`Remove user`.

4. To remove the user, click the :guilabel:`Yes` button. The user is removed.
