.. meta::
   :description: General roles in Micetro
   :keywords: Micetro access model

.. _acl-general-roles:

General roles
-------------

**General roles** are the default role type, whose permissions are automatically applied (if applicable) to all objects in Micetro, present and future.

To create a General role, follow the instructions on :ref:`acl-roles`, and select the **General** type from the dropdown in the role creation dialog.

Example: The general role *DNS editor* has the ``Edit zone options`` permission enabled. Any 'DNS zone' type object in Micetro, whether existing or added in the future, will be accessible to users/groups attached to this role.

.. _acl-built-in-roles:

Built-in roles
^^^^^^^^^^^^^^

Micetro has nine built-in general roles that will likely cover most use cases for access control. These include the following:

Administrators
   Full access to all objects.

DNS Administrators
   Full access to DNS objects, including zones, DNS servers, etc.

DHCP Administrators
   Full access to DHCP objects, including scopes, DHCP servers, etc.

IPAM Administrators
   Full access to IPAM objects, including IPAM ranges, etc.

User Administrators
   Full access to User and Group objects.

DNS viewers
   Can view DNS objects and information, but cannot make changes.

IPAM viewers
   Can view IPAM and DHCP objects and information, but cannot make changes.

Requesters
   Able to make and queue DNS change requests. (Refer to :ref:`webapp-workflows`.)

Approvers
   Able to view and approve/deny submitted DNS change requests. (Refer to :ref:`webapp-workflows`.)

.. note::
   Built-in roles cannot be deleted.

   :ref:`acl-permissions` for built-in roles cannot be modified.

.. note::
  General roles can be restricted from accessing single objects. Refer to :ref:`acl-object-access`.
