.. _managing-server-group-members:

Managing Member Servers
***********************

Main operations
===============

The main operations for Member Servers are:

.. csv-table::
  :widths: 30, 70

  "Add member server", "Add a Member Server"
  "Edit member server", "Edit the selected Member Server’s name and IP address."
  "Prepare group", "Push the staged DNS configuration and data to the Member Servers."
  "Deploy group", "Make the staged DNS config live and reloads the DNS servers in the server group."
  "Detach member server", "Detach the server from the Men&Mice Suite. The Member Server remains in the group, but excluded from prepare/deploy operations and ignored in sync checks."
  "Deploy member server", "Deploy the selected Member Server(s). This operation is the same as deploying on a Server Group, but only affects the selected members."
  "Remove member server", "Remove the selected Member Server from the group. Removed servers need to be re-added to be part of the Server Group again."
  "View history", "Display the history entries for the selected Member Server."

Inspector
=========

The inspector for the server group shows various properties and metadata for the selected Member Server, and displays available actions.

Properties
----------

Shows the properties of the selected member server.

Prepare
-------

The server group can be prepared by running the :ref:`<server-groups-prepare` action. The last preparation date and the user that initiated the preparation is shown.

Deploy
------

The server group can be prepared by running the :ref:`server-groups-deploy` action. The last deployment date and the user that initiated the deployment is shown.
The Inspector also shows the number of undeployed changes for the group. Click on :guilabel:`View undeployed changes` to open details.

.. note::
  Prepare and Deploy are operations that are applied to the entire Server Group.

  .. sidebar::

    .. figure:: ../../images/member-server-inspector.png

    The Inspector panel for the Member Server

Viewing the list of members within a server group
=================================================

Double-click on a Server Group (or using the :guilabel:`Open` action after selecting a Server Group) to view the list of all Member Servers in the selected group.

New Member Servers can be added by using the Add member action.

.. image:: ../../images/server-group-members.png
  :width: 90%
  :align: center

The list displays the following information about Member Servers:

* Member name: the hostname of the Member Server.
* Sync status: the sync status of the Member Server. (If out-of-sync, the entire group is out-of-sync. In-sync Member Servers can still be part of an out-of-sync group.)
* Server state: the state of the DNS server.

Server Group state
==================

.. image:: ../../images/server-group-in-sync.png
  :width: 90%
  :align: center

The badge on the top of the list indicates the state of the group:

In sync
  all Member Servers are in sync with the group.

Out of sync
  One or more members are out of sync with the group.

Operation status

.. image:: ../../images/server-group-op-status.png
  :width: 90%
  :align: center

When a Server Group operation (prepare, deploy, reload) is in progress, the status of the operation will be displayed in the badge above the list.
In case of an error, the error and details about the error will also be shown here, through a badge that can be expanded to get more details.

Adding a Member Server
======================

1. Click :guilabel:`Add member`.

2. In the ‘Server name’ field specify the hostname of the server.

3. (Optional) Add the IP address of the server.

4. Click on :guilabel:`Create` to add the member server.

.. note::
  Adding a new Member Server automatically syncs it with the group, overwriting any existing configuration and data on it.

.. _detach-member-server:

Detaching a Member Server
=========================

1. Select the Member Server to be detached.

2. Click :guilabel:`Actions --> Detach`.

3. Click :guilabel:`Yes` to confirm the detachment of the Member Server.

.. note::
  Detaching a server lets it remain part of the Server Group. It will be displayed greyed out, and is excluded from prepare/deploy operations and ignored in sync checks, but doesn’t need to be re-added.

.. note::
  When a Member Server is detached, there is a new action called Attach that can be used to re-attach it to the group.
  This option only available in the Actions dropdown when a detached Member Server is selected in the list.

Removing a Member Server
========================

1. Select the Member Server to be removed.

2. Click :guilabel:`Actions --> Remove`.

3. Click :guilabel:`Yes` to confirm the removal of the Member Server from the group

.. warning::
  Removed servers need to be re-added to be part of the Server Group again. If there’s a sync issue, it is recommended to use :ref:`Detach <detaching-member-server>` instead.
