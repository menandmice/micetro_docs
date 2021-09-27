.. _access-control-example:

Role-based access example
-------------------------

.. note::
  Access management has changed in Micetro 10.1. To view the access management example used in previous versions, switch to the appropriate version number using the version selector.

Introduction
^^^^^^^^^^^^

**[TO-DO: Add screenshots.]**

This article aims to provide practical information on :ref:`acl-roles` and detailed, step-by-step breakdowns for two scenarios: creating a new, read-only role for DHCP scopes, and using the built-in *DNS viewers* role to set up a DNS read-write role.

The information on this page, and the how-tos presented, will provide a blueprint to customize Micetro to your requirements.

Built-in roles
^^^^^^^^^^^^^^

The seven :ref:`built-in-roles` have been designed to cover most use cases for access control in Micetro. The access settings for the built-in roles can't be modified.

.. tip::
  Built-in roles are all :ref:`acl-general-roles` and applied to all objects in Micetro, existing or future.

**Example:** adding a user or group to the *Administrators (built-in)* role, the user (or group members) automatically gain administrative access to all objects in Micetro.

User defined roles
^^^^^^^^^^^^^^^^^^

As all DDI environments are different, Micetro allows creating flexible user-defined roles.

.. tip::
  Creating new roles requires the *Administer users/groups* permission.

There are two ways of creating new roles in Micetro:

1. (Preferred) Duplicate an existing role and edit the permissions. See :ref:`duplicate-role`.

2. Create a completely new role. See :ref:`new-role`.

.. tip::
  Men&Mice recommends using the built-in roles as templates and modifying the permission set for the duplicate roles.

----

.. _duplicate-role-example:

Example role configuration: DNS zone read-write
"""""""""""""""""""""""""""""""""""""""""""""""

The following steps illustrate how to create a read-write role in Micetro for DNS zones, using a built-in role as a template.

.. tip::
  Using existing roles as templates makes refining access controls easier, as you can both copy over permissions and users / groups.

1. Log in to the Web Application.

2. Navigate to :menuselection:`Admin --> Configuration --> Access Management` and select :guilabel:`Roles`.

3. Press the :guilabel:`Create` button and select :guilabel:`From existing role`.

4. From the dropdown **Select an existing role**, click on ``DNS Viewers (built-in)``.

.. tip::
  If you have the role selected in the grid, *From existing role* will automatically fill in the value for convenience.

5. Edit the **Role name**.

.. note::
  When duplicating a role, editing the **Description** is not available until the new role is created.

6. Select what to copy from the existing role: **Permissions** (default), *Groups*, and/or *Users*.

.. information::
  Duplicating roles will automatically set the role type to *General*.

7. Click :guilabel:`Create` to save the new role.

After saving the new role, Micetro will automatically display the *Edit role properties* dialog for it.

8. Switch over to the :guilabel:`Access` tab and enable the following permission:

.. csv-table::
  :header: "Group", "Permission"
  :widths: 30, 70

  "DNS servers", "**Add master zones**"
  "DNS servers", "**Add non-master zones**"
  "DNS zones", "**Edit zone access**"
  "DNS zones", "**List (or view) zone**"
  "DNS zones", "**View zone history**"
  "DNS zones", "**Enable/disable zone**"
  "DNS zones", "**Edit zone options**"
  "DNS zones", "**Delete zone**"
  "DNS zones", "**Enable/disable apex records**"
  "DNS zones", "**Edit apex records**"
  "DNS zones", "**Enable/disable wildcard records**"
  "DNS zones", "**Edit wildcard records**"
  "DNS zones", "**Enable/disable other records**"
  "DNS zones", "**Edit other records**"
  "DNS zones", "**Edit zone properties**"

.. tip::
  Clicking the checkbox next to the **DNS zones** group will automatically select all permissions within the group.

.. tip::
  For a handy reference for available permissions, see :ref:`permissions-reference`.

9. (Optional) Switch to the :guilabel:`Groups` tab and select the group(s) you'd like to assign to the role.

10. (Optional) Switch to the :guilabel:`Users` tab and select the user(s) you'd like to assign to the role.

.. tip::
  Users and groups can be assigned to and removed from roles at any time.

11. Click :guilabel:`Save` to update the role settings.

----

.. _new-role-example:

Example role configuration: DHCP read-only
""""""""""""""""""""""""""""""""""""""""""

The following steps illustrate how to create a new, read-only role in Micetro for DHCP scopes only, without using the built-in role templates.

1. Log in to the Web Application.

2. Navigate to :menuselection:`Admin --> Configuration --> Access Management` and select :guilabel:`Roles`.

3. Press the :guilabel:`Create` button and select :guilabel:`New role`

4. Specify the **Role name**, e.g. ``DHCP Read-Only`` and add a **Description**.

.. tip::
  Using descriptive names and clear text for the description makes access management easier.

5. Choose between the *General* or *Specific* role types.

.. information::
  The preferred role type in Micetro is the :ref:`acl-general-roles`. Specific roles exist to preserve backwards compatibility and added flexibility to edge use cases.

6. Switch over to the :guilabel:`Access` tab and enable the following permission:

.. csv-table::
  :header: "Group", "Permission"
  :widths: 30, 70

  "Ranges and DHCP scopes", "**Read scope options**"

7. Notice that a blue :guilabel:`(i)` indicator appears on the top right. Hovering over will show that in order for the selected permissions to take effect, additional permissions will be set:

.. csv-table::
  :header: "Group", "Permission"
  :widths: 30, 70

  "Micetro", "Access to the web interface"
  "Micetro", "Access IPAM module"
  "Micetro", "Access to IPAM view in web interface"
  "DHCP servers", "List (or view) DHCP server"
  "Ranges and DHCP scopes", "List (or view) range"
  "Address spaces", "List (or view) address space"

.. tip::
  Micetro will automatically enable these permissions upon saving the new role. You can check the permissions granted to the role by switching to :guilabel:`View defined` using the radio button.

.. tip::
  For a handy reference for available permissions, see :ref:`permissions-reference`.

8. (Optional) Switch to the :guilabel:`Groups` tab and select the group(s) you'd like to assign to the role.

9. (Optional) Switch to the :guilabel:`Users` tab and select the user(s) you'd like to assign to the role.

.. tip::
  Users and groups can be assigned to and removed from roles any time.

10. Click :guilabel:`Create` to create the role.
