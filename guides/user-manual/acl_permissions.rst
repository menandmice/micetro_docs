.. meta::
   :description: Access control flags in Micetro by Men&Mice 10.1
   :keywords: Micetro access model

.. _acl-permissions:

Permissions
-----------

Permissions are **access flags**, configured on roles and pertaining to types of objects.

Permissions determine what type of objects the role has access to, and what kind of access it has to them.

For a full list of available permissions see :ref:`permissions-reference`.

Setting permissions
^^^^^^^^^^^^^^^^^^^

.. note::
   Permissions for :ref:`built-in-roles` cannot be modified.

1. Navigate to :menuselection:`Admin --> Configuration --> Roles` in the web application.

2. Select the role you want to edit, and double click it. (Or use the :guilabel:`Edit role properties` action from the top bar or ellipsis menu.)

   .. note::
      Permissions can only be edited on individual roles.

3. Switch to the :guilabel:`Access` tab.

4. Edit the permissions as needed.

5. Click :guilabel:`Save`.

.. note::
  When setting access on a role, adding a permission will automatically enable all dependent permissions as well to prevent access problems.

  An information button will appear on the top right of the dialog box, providing a summary of dependent permissions enables if hovered over.

  Turning off the permission(s) will **not** disable the automatically enabled dependent permissions. Turning off the dependent permission(s) will still allow the role to be saved.

.. _block-permission:

Block permission
----------------

When a permission is enabled, it'll set the access flag to ``allow``. When you **block** a permission on a role, it is set as ``deny`` and *prevent any other role* to overwrite that permission.

*Example:* The role *Worfklow Blocked* has the "Access to Workflow module" permission blocked. The built-in role "DNS approvers" has this permission enabled. Attaching user ``janedoe`` to both roles will result in the user **not** being able to access the Workflow module. Even though the *DNS approvers* role would allow it, the permission block set in *Workflow Blocked* will prevent it to take effect.
