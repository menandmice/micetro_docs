.. _managing-server-groups:

Managing Server Groups
**********************

Main actions
============

The main actions/operations within the server group context are:

.. csv-table::
  :widths: 30, 70

  "Create server group", "Create a new server group in the system."
  "Edit server group properties", "Edit the properties associated with the specific server group (such as the name of the group)."
  "View members", "Display a list of all member servers in the group."
  "Roll-back", "Roll back the deployment to the last working configuration."
  "View history", "View the object history for the server group."
  "Migrate", "Migrate configuration to a different staging/live server."
  "Access", "Specify access to manage a server group."

Inspector
=========

The inspector for the server group shows various properties and metadata for the selected server group, and displays available actions.

Properties
----------

Shows the properties of the server group.

Prepare
-------

Information about when the staged configuration was last pushed to the member servers as well as which user performed the prepare operation.

Deploy
------

Information on the last reload time as well as which user performed the reload operation.

DNS Management
--------------

Links to the :guilabel:`DNS` context, with the authoritative server (of the selected Server Group) pre-selected. See II/7. Managing DNS zones for a server group.

:guilabel:`Create static stub zone` will display a modal dialog for creating a new static stub zone, with the authoritative server pre-selected. Manage static stub zones switches to the DNS context with the server group’s filter applied. See I/5. Managing static sub zones in the General AT&T Documentation.

.. sidebar::

  .. figure:: ../../images/server-group-inspector.png

  The Inspector panel for the Server Group

Creating a server group
=======================

New Server Groups need a Group Master Server and one Member Server defined on creation. To create a new server group:

1. Select Create Server Group.

2. Fill in the desired name for the Server Group (has to be unique within the system)

3. Specify the IP address or hostname of the Group Master Server

4. Specify the IP address or hostname for an initial Member Server

After the Server Group is created, it will show up in the list.

.. image:: ../../images/create-server-group.png
  :width: 70%
  :align: center

Viewing the list of Server Groups
=================================

A list of all Server Groups in the system can be viewed in the Web Application’s :guilabel:`AT&T --> Server Groups` context. The list displays the following properties for each group:

+--------------+-------------------------------------------------------------+
| Name         | The name of the server group                                |
+--------------+-------------------------------------------------------------+
| Sync state   | The status of the server group:                             |
|              | * In-sync (green)                                           |
|              | * Out-of-sync (red)                                         |
+--------------+-------------------------------------------------------------+
| Group master | The name of the designated Group Master Server of the group |
+--------------+-------------------------------------------------------------+

Viewing history for Server Groups
=================================

The history for a server group is accessible from :guilabel:`Action --> View history`:

.. image:: ../../images/server-group-history.png
  :width: 80%
  :align: center

This lists all history entries for the selected Server Group.

Delete server group
===================

1. Select the server group in the list.

2. Select :guilabel:`Actions --> Delete server group`.

3. Confirm that you want to delete the server group by clicking on the :guilabel:`OK` button in the resulting dialog.

4. The server group will be deleted.

.. warning::
  **This cannot be undone!** Deleting a Server Group deletes association with all Member Servers, removes the staging, ad-hoc, and live servers; and all undeployed change are discarded. 
  The BIND configs are wiped from the Group Master Server and all backups for the Server Group are destroyed.
