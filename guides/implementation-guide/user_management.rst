.. _user-management:

Adding users / groups
*********************

.. note::
  Users, groups, and roles can be managed through the Web Application. Access management is done in the Management Console.

The access model for the Men&Mice Suite is object-based. Each object type (DNS server, zone, etc.) has an access flag, and restrictions are managed through “roles”, “users”, and “groups”.

* *Groups* **can** contain *Users*
* *Groups* **cannot** contain *Groups*
* *Users* can be a member of **any number** of *Groups*
* *Users* **and** *Groups* can be assigned to *Roles*

Roles are grouped access controls based on common restrictions across users and groups. The Men&Mice Suite is configured with five default roles: administrators, DNS administrators, DHCP administrators, IPAM administrators, and User administrators. These get full access to all access flags in their respective areas.

* *Administrators*: full access to all objects
* *DNS Administrators*: full access to DNS objects, including zones, DNS servers, etc.
* *DHCP Administrators*: full access to DHCP objects, including scopes, DHCP servers, etc.
* *IPAM Administrators*: full access to IPAM objects, including IPAM ranges, etc.
* *User Administrators*: full access to User and Group objects.

When new objects are created, the Built-in Role that presides over that object, as well as the user or group that created the object, receives full access to it.

It is recommended you use these roles as only they can receive default access to new items. User-defined Roles do not receive any access information for new objects and are considered to have "denied" access.

To allow a custom user or group full access to a new object, include them as a member in the corresponding default role.

More details on access controls can be found in the Men&Mice user documentation: https://docs.menandmice.com/current/Access

III/6.1. Managing users, groups, and roles
==========================================

You can manage users, groups, and roles in the Web Application’s :guilabel:`Admin --> Configuration --> User Management` section. (Alternatively, in the Management Console’s :guilabel:`Tools --> User Management` menu.)

.. image:: ../../user_p1.png
  :width: 30%
  :align: center

.. image:: ../../user_p2.png
  :width: 30%
  :align: center

.. image:: ../../roles.png
  :width: 60%
  :align: center
