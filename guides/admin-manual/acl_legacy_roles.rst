.. meta::
   :description: Legacy roles in Micetro 10.1
   :keywords: Micetro access model

.. _acl-legacy-roles:

Legacy roles
------------
Legacy roles were created to maintain backwards compatibility with older Micetro versions and facilitate migration to the new access management model.

Roles, as well as certain users and groups, in Micetro installations before 10.1 are automatically converted to a legacy role when you update Micetro to versions 10.1 or newer. These roles will be configured with the same permissions as before.

Legacy roles are treated as :ref:`acl-specific-roles`, in that all existing objects are associated with their respective legacy roles, but no newly added objects will be automatically assigned to a legacy role.

After familiarizing yourself with the new access model, you can convert legacy roles to either :ref:`acl-general-roles` or :ref:`acl-specific-roles`.

.. note::
   Permissions for legacy roles **can** be edited.

   Legacy roles **can** be removed from Micetro.
