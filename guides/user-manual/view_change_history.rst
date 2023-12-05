.. meta::
   :description: How to view the object change history for a user or an object
   :keywords: change history, object history, undo changes

.. _view-change-history:

Viewing Object Change History
=============================
You can access and navigate all changes made to any object in Micetro. The object change history provides a detailed log of all modifications made to any object, including timestamps, user information, actions taken, and user-entered comments.

**Permissions:** 

* Permission: ``Access to view history`` on Micetro.
* Role: ``Administrator (built-in)``

.. note::
   For information about how to view object change history in the Management Console, see  :ref:`console-object-change-history`.

All users can view their own object change history, while administrators have access to the history of all users.

You can view the history of a specific object or all objects.

**To view your own changes:**

1. Click the User icon in the upper-right corner.

2. Select :guilabel:`View history`.

**To view changes to a specific object:**

1. Select the object you want to view.

2. On the :guilabel:`Action` menu, select :guilabel:`View history`. You can also select this option on the **Row menu (...)**.

**To filter data in the Change History window:**

1. Click the filter icon in the top right corner.

2. Enter or select the relevant information and click :guilabel:`Search`.

   .. image:: ../../images/history-filter.png
      :width: 80%

   * If you're viewing global object history, you can narrow down results by selecting an object type.
   * Administrators can specify a username in the :guilabel:`Made by user` box to filter changes by specific users.

Undoing Changes
---------------
You have the option to revert changes to DNS records and custom properties for all objects.

**To undo changes**:

1. Locate the specific action in the object history window that you want to undo, and click on the row menu (...) associated with it.

2. Select :guilabel:`Undo`.

   .. image:: ../../images/object-history-undo.png
      :width: 80%

3. Enter a comment for the action, and select :guilabel:`Save` to confirm the undo action and revert the selected change.
