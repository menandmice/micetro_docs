.. meta::
   :description: Migrating existing environments to the new access control model in Micetro 10.1
   :keywords: access control, access control management, role-based access, security, Micetro

.. _acl-migrate:

Migrating access control for existing Micetro deployments in 10.1
=================================================================

In Micetro 10.1, access control changed from an object-based to a role-based model.

Environments using a version of Micetro prior to 10.1 will be automatically converted to the new model, but this page collects all relevant information about the conversion and migration for reference and assistance.

Upgrading to Micetro 10.1
-------------------------

.. note::
  Men&Mice recommends performing a database backup before updating to 10.1.

When you upgrade your Micetro components (see :ref:`updates`), the database will be migrated automatically. *All existing* access control configuration is preserved, but will use the new model:

* built-in roles are converted into their new :ref:`acl-general-roles` equivalents

* custom roles previously used for access control are converted into :ref:`acl-legacy-roles`

* access settings for legacy roles on objects are preserved, using the :ref:`acl-specific-roles` mechanism

Migrating :ref:`acl-legacy-roles`
---------------------------------

Legacy roles are a transitional role type to help migration and preserve backward compatibility. Men&Mice recommends converting legacy roles as soon as possible.

Eythor:
  A (legacy) role is generated for any user or group previously in Initial access, which has general access for that object type, with the same permissions as the initial access had. the generated role will be called e.g. "Greg (User)" or "Dev (Group)"

Converting to :ref:`acl-general-roles`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Converting a legacy role into a general role removes all object-specific access, and makes it applicable to all objects in the system. If the legacy role had an exclusion for specific object types, it'll also be applied system-wide.

Eythor:
  Legacy -> General: Wipes out all object specific access, including legacy overrides or exclusions from general access on specific objects, and any access defined for the role will apply to every object in the system.

Converting to :ref:`acl-specific-roles`
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Converting the legacy role into a specific role

Eythor:
  Legacy -> Specific (the hard one). If the legacy role was general for some object type, after converting to Specific it will not have access to any of the objects of that type. For other object types, we cleanup the access, such that any object specific overrides will instead inherit the access from the role. Example: if you had initial access on DNS servers before (e.g. list/view) but not on Zones, but had granted the role access to select zones, then after converting to Specific, the role will not have access to any servers (even if some servers had overridden/different permissions or were excluded) but it will have access to the same zones as before, with consistent permissions across these zones
