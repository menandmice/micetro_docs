.. meta::
   :description: How to update Micetro
   :keywords: update, update components, update appliances, Micetro

.. _updates:

Updating Micetro
=================
Micetro notifies you when a new version becomes available and allows administrators to update to the new version. Versions may contain updates for any number of components, such as Micetro Central and the Micetro agents. 

* Minor versions often only contain an update for a single component, such as the Web Application.

* Major version upgrades normally contain an update for every component.

For information about Micetro's versioning model and version support, refer to :ref:`version-numbers`. 

**Permissions needed to apply updates:**

* **Permission**: None (You cannot create a custom role to access this function.)
* **Role**: ``Administrators (built-in)``

.. note::
  To receive notifications and check for updates, you must be in a group with administrative privileges. Only the Administrator user can perform the actual update.


Checking the Status of Micetro Components
-----------------------------------------
You can see the status of all components at a glance, so you know everything is running as expected.

**To check the current status of Micetro components and appliances**:

1. Select the :guilabel:`Configuration` tab on the **Admin** page. 
2. In the left sidebar, select :guilabel:`Current status` under :guilabel:`Micetro Version`.

A list of all components, their current versions, and statuses is displayed.

Troubleshooting Component Issues
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If there's an error with a component, or it's offline, it will be highlighted in the **Status** column of the **Current Status** grid. Hover your cursor over the **Offline** or **Error** status for more details to help you troubleshoot.

Updating Micetro Components and Appliances
------------------------------------------
If you're updating Micetro from an older version, refer to the following table:

.. csv-table::
  :widths: 30, 30, 40
  :header: "Origin version", "Target version", "Update to"

  "11.x", "25.x", "25.x [1]_"
  "10.x", "11.x", "11.x [1]_"
  "9.x", "10.x", "10.x [1]_"
  "8.x", "10.x", "10.x [1]_"
  "7.x", "10.x", "10.x [1]_"
  "6.x", "10.x", "9.3"

.. [1] Before updating to Micetro 10.0 or newer, Kea DHCP servers must be updated to 1.6.0 or 1.8.0. Refer to `Kea update notice <https://menandmice.com/docs/10.0/release_notes/10.0.0#release>`_.

Refer to the following instructions for updating Micetro components and appliances:

.. toctree::
   :maxdepth: 1

   update_components
   update_appliances
