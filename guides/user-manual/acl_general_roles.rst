.. meta::
   :description: General roles in Micetro by Men&Mice 10.1
   :keywords: Micetro access model

.. _acl-general-roles:

General roles
-------------

*General roles** are the default role type, whose permissions are automatically applied (if applicable) to all objects in Micetro, present and future.

To create a *General role*, follow the instructions on :ref:`acl-roles`, and **select** the *General* type from the dropdown in the role creation dialog. (The default type is *General*.)

*Example:* The general role *DNS editor* has the ``Edit zone options`` permission enabled. Any 'DNS zone' type object in Micetro, whether already existing or added in the future, will be accessible to users/groups attached to this role.

.. _acl-built-in-roles:

Built-in roles
^^^^^^^^^^^^^^

Micetro has seven built-in general roles that will likely cover most use cases for access control.

The built-in roles are the following:

Administrators
   Full access to all objects

DNS Administrators
   Full access to DNS objects, including zones, DNS servers, etc.

DHCP Administrators
   Full access to DHCP objects, including scopes, DHCP servers, etc.

IPAM Administrators
   Full access to IPAM objects, including IPAM ranges, etc.

User Administrators
   Full access to User and Group objects.

DNS viewers
   Can view DNS objects and information, but not make changes.

IPAM viewers
   Can view IPAM and DHCP objects and information, but not make changes.

Requesters
   Able to make and queue DNS change requests. (See :ref:`webapp-workflows`.)

Approvers
   Able to see and approve/deny submitted DNS change requests. (See :ref:`webapp-workflows`.)

.. note::
   Built-in roles cannot be deleted.

   :ref:`acl-permissions` for built-in roles cannot be modified.
