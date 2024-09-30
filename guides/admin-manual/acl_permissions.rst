.. meta::
   :description: Access control flags in Micetro
   :keywords: Micetro access model

.. _acl-permissions:

Permissions
-----------

Permissions are **access flags**, configured on roles and pertaining to types of objects.

Permissions determine what type of objects the role has access to, and what kind of access it has to them.

For a full list of available permissions, see :ref:`permissions-reference`.

Setting Permissions
^^^^^^^^^^^^^^^^^^^

.. note::
   Permissions for :ref:`built-in-roles` cannot be modified.

1. Navigate to :menuselection:`Admin --> Configuration --> Roles`.

2. Select the role you want to edit and double-click, or select :guilabel:`Edit role properties` on the :guilabel:`Action` or Row :guilabel:`...` menu.

   .. note::
      Permissions can only be edited on individual roles.

3. Select the :guilabel:`Access` tab.

4. Edit the permissions as needed and click :guilabel:`Save` when you're done.

.. note::
  * When configuring access for a role, adding a permission will also automatically enable all related dependent permissions to avoid access issues.

  * An information icon appears in the upper right corner of the dialog box, and hovering over it provides a summary of the enabled dependent permissions.

  * Disabling permission(s) will **not** disable the dependent permissions that were automatically enabled. However, disabling the dependent permission(s) will not prevent the role from being saved.

.. _block-permission:

Blocking Permissions
--------------------

When a permission is enabled, it sets the access flag to ``allow``. Blocking a permission on a role, sets it to ``deny``, preventing any other role from overriding that permission.

Example:
   If the role "Worfklow Blocked" has the "Access to Workflow module" permission blocked, and the built-in role "DNS approvers" has this permission enabled, assigning the user ``janedoe`` to both roles will block access to the Workflow module. The permission granted by the "DNS approvers" role is overridden by the permission denied by the "Workflow Blocked" role.

.. note::
  Permissions not explicitly set are returned as ``null``. These undefined access flags are **not** the same as ``deny`` and **can** be overwridden by access flags set in other roles.
