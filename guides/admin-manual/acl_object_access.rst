.. meta::
   :description: Access control on objects in Micetro
   :keywords: Micetro access model

.. _acl-object-access:

Object access
-------------

You can select single objects on the **DNS**, **IPAM**, and **Admin** pages to examine and, if needed, adjust their access.

**To manage object access**:

1. On the **DNS**, **IPAM**, or **Admin** page, select the object whose access you want to view.

2. Use either the :guilabel:`Action` or Row :guilabel:`...` menu to select :guilabel:`Manage access`.

In the **Manage Access** dialog, you can view and manage the object's access, as well as add :ref:`acl-specific-roles` to the object using the dropdown menu.

  .. image:: ../../images/manage-object-access.png
    :width: 90%
    :align: center

3. If you make any changes, remember to select :guilabel:`Save`.

.. note::
  Only specific roles with the necessary access enabled are displayed in the list.

Exclude roles from object access
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If needed, :ref:`acl-general-roles` can be excluded from access to a single object.

**To exclude a role from accessing an specific object**:

1. On the **DNS**, **IPAM**, or **Admin** page, select the object.

2. Use either the :guilabel:`Action` or Row :guilabel:`...` menu to select :guilabel:`Manage access`.

3. In the **Manage Access** dialog, select the general role you want to exclude and use the Row :guilabel:`...` menu to select :guilabel:`Exclude`.

  .. image:: ../../images/object-access-exclude.png
    :width: 90%
    :align: center

4. Select :guilabel:`Save`.

The excluded role will still be shown in the list, but will be grayed out and struck through.

.. note::
  Specific roles cannot be excluded, as they're set on single objects. The 'exclude role' function is available for managing (restricting) object access on a case-by-case basis for general roles.

Access inheritance
^^^^^^^^^^^^^^^^^^
Users with IPAM administration permissions can configure access inheritance for containers, scopes, and ranges on the **IPAM** page. Access for objects that are set to inherit access from their parents cannot be edited. When you edit access to a parent object, the changes are applied to all child objects.

.. note::
  Access inheritance is enabled for all applicable IPAM objects by default. You can change this in the Advanced :ref:`admin-system-settings`.

You can manage access inheritance individually by either enabling access inheritance on a parent object OR on a child.

.. important::
  Existing access settings are **not** modified by disabling inheritance, but **it is overwritten** when enabling inheritance.

**To enable access inheritance**:

1. On the **IPAM** page, select the object.

2. Use the :guilabel:`Action` or Row :guilabel:`...` menu to select :guilabel:`Set access inheritance`.

3. In the dialog, select :guilabel:`Yes` to enable access inheritance.

3. In the **Manage Access** dialog, check the :guilabel:`Inherit access from parent network` to enable access inheritance.

  .. image:: ../../images/inherit-access-action.png
    :width: 60%
    :align: center

This will enable access inheritance to all *existing and new* child objects.

**To enable access inheritance from the parent**:

1. On the **IPAM** page, select the object.

2. Use the :guilabel:`Action` or Row :guilabel:`...` menu to select :guilabel:`Manage access`

3. In the dialog, check the :guilabel:`Inherit access from parent network` to enable access inheritance.

  .. image:: ../../images/inherit-access-parent.png
    :width: 80%
    :align: center

4. Select :guilabel:`Save`.

.. note::
  Access inheritance honors *all* roles added to the parent object, including legacy and specific roles. Adding a specific role to a parent object will apply the change to all child objects that have access inheritance enabled.
