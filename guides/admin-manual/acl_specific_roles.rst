.. meta::
   :description: Specific roles in Micetro
   :keywords: Micetro access model

.. _acl-specific-roles:

Specific roles
--------------

Specific roles are a role type whose permissions are **not** automatically applied to objects in Micetro. They're intended to allow access management on a per-object basis.

To create a Specific role, follow the instructions on :ref:`acl-roles` and use the :guilabel:`Role type` dropdown to select **Specific** in the **Create New Role** dialog. The default type for new roles is General.

Example: The specific role *example.com editor* has the ``Edit zone options`` permission enabled. No 'DNS zone' type object in Micetro, whether existing or added in the future, will be accessible to users/groups attached to this role **unless specifically added** to the object.

.. warning::
   Specific roles are only intended for edge use cases and should not be regarded as the preferred method of access control in Micetro.

Using specific roles
^^^^^^^^^^^^^^^^^^^^

Access defined through specific roles isn't applied until explicitly configured on an object.

To use a Specific role and control access to an object:

1. Open the relevant page in the Web Application (**DNS** or **IPAM**) and select the object to which you'd like to restrict access.

.. note::
   Using specific roles on an object is only possible individually, per object.

2. Use the :guilabel:`Action` option or Row :guilabel:`...` menu to select the :guilabel:`Manage access` action.

3. In the dialog, remove all unneeded General roles and/or users (legacy only) configured by selecting :guilabel:`Exclude` on the Row :guilabel:`...` menu.

.. note::
  General roles can be restricted from accessing single objects. See :ref:`acl-object-access`.

3. Use the dropdown to search for and select the Specific role and click :guilabel:`+ Add`.

4. Click :guilabel:`Save`.

This will restrict access to that particular object to the selected users/groups assigned to the Specific role.

.. note::
  Situations may arise that adding a specific role to an object would not take effect because of missing permissions on parent objects. Micetro will calculate the necessary permissions needed, and can automatically add them to the relevant objects.

  A notification will display on the **Save comment** dialog, detailing the additional changes. If the user doesn't have the necessary access to set permissions of these objects, an advisory message will be displayed.

