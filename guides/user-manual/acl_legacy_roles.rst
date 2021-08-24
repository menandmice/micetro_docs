.. meta:: 
   :description: Legacy roles in Micetro by Men&Mice 10.1
   :keywords: Micetro access model

.. _acl-legacy-roles:

Legacy roles 
------------

*Legacy role*s were created to maintain backwards compatibility with older Micetro versions and facilitate migration to the new access management model.

Roles in existing Micetro installations (before 10.1) are automatically converted to a legacy role during updating Men&Mice Central to 10.1 or later. They will be configured with the same permissions as before.

Legacy roles are treated as a **specific role**. All existing objects will have their respective legacy roles associated with them, but no newly added objects will be automatically assigned to a legacy role. See :ref:`acl-specific-roles`.

After familiarizing yourself with the new access model, you can create either a :ref:`acl-general-roles` or :ref:`acl-specific-roles` by duplicating the legacy role. (See :ref:`duplicate-role`.)

.. note::
   Permissions for legacy roles **can** be edited.

   Legacy roles **can** be removed from Micetro.