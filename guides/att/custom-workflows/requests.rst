.. _requests:

Requests
********

Requests in the Men&Mice Suite carry out three functions:

* encapsulate a set of DNS changes,
* associate them with metadata which is relevant to what is being done,
* refer to the set of changes in other places in the Men&Mice Suite (such as in the Server Groups).

Basic Request workflow
======================

.. _dns-changes:

1. DNS Changes
--------------

The user makes a change to an existing record or adds a new record (see I/2. DNS Changes).
This can be done either through the regular DNS context (opening of DNS Zones/Include files and making changes) or through a wizard customized for a particular task, such as the II/1. Traffic Move task.
The change is added to the I/2.3. DNS record change queue.

Add more changes
^^^^^^^^^^^^^^^^

Repeat :ref:`dns-changes` until all of the desired changes have been added to the change queue.

.. note::
  If the changes submitted to the queued would affect more than one server group, a modal dialog will allow the user to select one server group to submit the request for.

  .. image:: ../../images/multiple_group_change.png
    :width: 80%
    :align: center

2. Review queued changes
------------------------

User clicks on the *DNS record change queue* icon. A dialog appears presenting a summary (see I/2.3. DNS record change queue) of the changes collected in the record change queue.
After confirming by clicking :guilabel:`Next`, the user fills in the Work Order number and other fields as required (or desired) and submits the request for changes with :guilabel:`Submit`.

Modifying changes
^^^^^^^^^^^^^^^^^

To prevent conflicts, when a user makes a change to a record already in the active Request queue, the UI will display an indicator that the record has been changed.
It is then possible to revert the change.

.. image:: ../../images/modified-in-queue.png
  :width: 80%
  :align: center

Reverting the change does not add an additional action to the queue, but removes the change instead.

3. Staging changes
------------------

After submitting, changes in the record change queue become staged: they’re written to the staging configuration.
The applied changes are contained in a Request, visible in the I/2.1. Requests list, and can be reviewed at any time. (See I/2.2. View request details.)

4. Add more Requests
--------------------

Repeat steps 1-3 until all MOPs have been successfully staged.

5. Prepare and deploy
---------------------

The administrator :ref:`prepares <server-groups-prepare>` and :ref:`deploys <server-groups-deploy>` changes to the live server(s) by using the Server Groups (see Server Groups Guide) context.
Once the Server Group(s) has been successfully deployed, the status of the submitted Requests change from “Staged” to “Deployed”. (Accessible by selecting “Deployed” in the left sidebar on the Request page.)

Basic Requests workflow diagram
===============================

See this diagram for a visual breakdown of the above process:

.. image:: ../../images/att-workflow.png
  :width: 100%
  :align: center
