.. meta::
   :description: Legacy roles in Micetro by Men&Mice 10.1
   :keywords: Micetro access model

.. _acl-legacy-roles:

Legacy roles
------------

*Legacy roles* were created to maintain backwards compatibility with older Micetro versions and facilitate migration to the new access management model.

Roles (and certain groups and users) in existing Micetro installations (before 10.1) are automatically converted to a legacy role during updating Micetro to 10.1 or later. They will be configured with the same permissions as before.

Legacy roles are treated as :ref:`acl-specific-roles`, in that all *existing* objects will have their respective legacy roles associated with them, but *no newly added objects will be automatically assigned to* a legacy role.

After familiarizing yourself with the new access model, you can convert legacy roles to either a :ref:`acl-general-roles` or :ref:`acl-specific-roles`.

.. note::
   Permissions for legacy roles **can** be edited.

   Legacy roles **can** be removed from Micetro.
