.. meta::
   :description: Access control management with the Management Console in Micetro by Men&Mice
   :keywords: access control, access control management, role-based access, security, Micetro

.. include:: ../user-manual/access_control.rst

.. _acl-console:

Managing access control in the Management Console 👣👣👣👣
-------------------------------------------------

Access control management in the Management Console uses the new access control model, but its features are slightly different than those available in the Web Application.

.. note::
  Men&Mice recommends configuring and managing access through the Web Application, as the preferred method. Functionality in the Management Console is mostly implemented in a transitional capacity.

Key differences between the Web Application and the Management Console
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Effective access
""""""""""""""""

In the Management Console's :menuselection:`Tools --> User Management`, the functionality for :ref:`acl-effective-access` is not available.

Users and groups
""""""""""""""""

In the Management Console's :menuselection:`Tools --> User Management`, users and groups cannot be edited to assign roles. Instead, roles need to be configured with users and groups.

Roles
"""""

In the Management Console's :menuselection:`Tools --> User Management`, adding a new role doesn't allow configuring access for it.

Configuring access in the Management Console
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Adding a new role
"""""""""""""""""

1. Open :menuselection:`Tools --> User Management` and switch to the **Roles** tab.

2. Click :guilabel:`Add`.

3. Fill in the name and description for the role. Optionally, you can add users and groups to the role.

4. Click :guilabel:`Ok`.

.. important::
  *Creating* the role doesn't set any access for the role in the Management Console. For configuring permissions, follow the steps in :ref:`console-role-perms`.

.. _console-role-perms:

Configuring access for a role
"""""""""""""""""""""""""""""



Removing a role
"""""""""""""""
