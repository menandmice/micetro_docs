.. meta:: 
   :description: Access control to Micetro by Men&Mice for users, groups and roles
   :keywords: Micetro access model

.. _access-control:

Access control
==============

.. important::
  Micetro 10.1 (released in September 2021) brought changes to the access management in order to make it more streamlined and easier to use, while keeping the flexibility. This page describes the new access control. IF you're using an older version, or would like information on the legacy access control model, see :ref:`access-control-legacy`.

Overview
--------

Access control in Micetro is **role-based**. 

:ref:`acl-roles` are configured with :ref:`acl-permissions`. A set of :ref:`built-in-roles` are available that should cover most use cases. These are :ref:`general-roles`, applied to all objects (present and future) in Micetro. :ref:`specific-roles` exist for use cases where per-object permissions are required.

Groups, users, and roles 
------------------------

The relationship between :ref:`acl-groups`, :ref:`acl-users`, and :ref:`acl-roles` is as follows:

* Users and groups can be assigned to roles.

* Groups can contain users

* Groups cannot contain groups

* Users and groups can be assigned to any number of groups and roles

The ``administrator`` user
----------------------

The built-in, local ``administrator`` user exists outside of regular access controls. All permissions are enabled for this user (even if not attached to any role) and its permissions cannot be edited or overriden (see :ref:`block-permission`) by any role.

The password for the ``administrator`` user is configured during the :ref:`first-run-wizard`.

The ``administrator`` user cannot be removed from Micetro, and cannot be authenticated by SSO.

New objects
-----------

When a user imports or creates a new object (such as DNS zone, record, DHCP scope, IPAM range, etc.) in Micetro, the object is configured for a certain default access based on the permissions for the object type. General roles configured with permissions for the object type will have automatic access to the object.

Access control management
-------------------------

Because Micetro's access controls are role-based, permissions are configured *on the role*, and propagated to any user or group attached to the role.

To grant restricted access on a per-object basis, see :ref:`acl-specific-roles`.

To check access to a specific object in Micetro, see :ref:`acl-effective-access`.

----

.. toctree::
  :maxdepth: 1

  acl_permissions
  acl_roles
  acl_effective_access
  acl_users
  acl_groups