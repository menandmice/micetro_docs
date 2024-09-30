.. meta::
   :description: How to update Micetro
   :keywords: update, Micetro

.. _updates:

Update Guide
============
.. note::
   These instructions apply to the Micetro Web Interface. For information about update management in the M&M Management Console, see :ref:`console-updates`.

**Permissions:**

* **Permission**: None (cannot create a custom role to access this)
* **Role**: ``Administrators (built-in)``

Micetro Version
---------------
Micetro notifies you when a new version becomes available and allows administrators to update to a new version. Versions may contain updates for any number of components, such as Micetro Central and the Micetro agents. 

* Minor versions often only contain an update for a single component, such as the Micetro Web Interface.

* Major version upgrades normally contain an update for every component.

.. note::
  To receive notifications and check for updates, you must be in a group with administrative privileges. Only the Administrator user can perform the actual update.
 

Updating Micetro
----------------
Before updating Micetro, we strongly recommend reading the Release Notes first, see :ref:`release-notes`. 

**To apply an update**:

1. Select :guilabel:`Admin` on the top navigation bar.

2. Click the :guilabel:`Configuration` tab at the top of the admin workspace.

3. Find available updates under :guilabel:`Micetro Version` in the left sidebar.

   .. image:: ../../images/available-updates-10.6.png
    :width: 80%


Preparing the Update
^^^^^^^^^^^^^^^^^^^^^
To streamline the updating process, the update is prepared by ensuring that update packages are uploaded to the various components before it is deployed.

**To prepare an update**:

1. Select :guilabel:`Prepare Update` to start the update process.

2. A package for the new version is downloaded and prepared for deployment. This includes uploading a package to each DNS and DHCP server. 

Deploying the Update
^^^^^^^^^^^^^^^^^^^^^
Once the package has been prepared, select :guilabel:`Deploy Update` to deploy the new version. 

If the new version includes an updated Central component, it will restart. Otherwise, Micetro seamlessly updates to the new version.

After the update has been deployed, each Micetro component requiring an upgrade is upgraded to the latest version. The update packages uploaded during the preparation phase are put into place.

Update Paths
^^^^^^^^^^^^^
If you're updating Micetro from an older version, refer to the following table:

.. csv-table::
  :widths: 30, 30, 40
  :header: "Origin version", "Target version", "Update to"

  "10.x", "11.x", "11.x [1]_"
  "9.x", "10.x", "10.x [1]_"
  "8.x", "10.x", "10.x [1]_"
  "7.x", "10.x", "10.x [1]_"
  "6.x", "10.x", "9.3"

.. [1] Kea DHCP servers must be updated to 1.6.0 or 1.8.0 *before* updating Micetro to 10.0 or newer. See `Kea update notice <https://menandmice.com/docs/10.0/release_notes/10.0.0#release>`_.


Checking the Status of Micetro Components and Appliances
---------------------------------------------------------
You can see the status of all components at a glance so you know everything is up and running smoothly.

**To check the current status of Micetro Components and Appliances**:

1. Go to the :guilabel:`Configuration` tab on the **Admin** page. 
2. Select :guilabel:`Current status` under :guilabel:`Micetro Version` in the left sidebar.
3. You will see a list of all components, their current version, and status. 

Troubleshooting
^^^^^^^^^^^^^^^^
The :guilabel:`Status` column will highlight if there is an error with the component, or if it is offline. Hover over the Offline or Error status for more details to help you troubleshoot.

Updating Appliances
--------------------
:guilabel:`Appliance updates` shows if any Appliances have updates pending. There are three types of updates:

* **Full**: Full updates are the most extensive and involve replacing the entire appliance, typically with the release of a new major version. These updates are versioned and are around 700MB in size.
* **Minor**: Minor updates consist of version upgrades, such as 9.4.1, and typically include minor improvements or enhancements. You can always update directly to the latest minor version within a major version. For example, the 9.4.2 update includes all changes made in 9.4.1, so it's okay to go directly from 9.4.0 to 9.4.2. However, for customers with older appliance versions before 9.4, it's necessary to first install the 9.4.0 full upgrade before deploying 9.4.1 or 9.4.2. These updates are around 2-300MB in size. 
* **Patch**: Patch updates are minor adjustments to individual components, such as BIND or ISC DHCP. They address specific issues or vulnerabilities.

Update Status
^^^^^^^^^^^^^
The update process involves downloading and deploying updates reflected in the :guilabel:`Status` column.

* **Available**: Updates are ready for application but have not been downloaded yet.
* **Deployed**: Updates have been applied and fully deployed. 
* **Partially deployed**: Updates have been downloaded but not applied to every applicable appliance in the system.
* **Downloaded**: Similar to **Partially deployed**, but updates have not been applied to any appliance in the system.
* **Downloading**: This is a temporary state indicating that the patch or upgrade is currently being downloaded.

.. note::
   It is recommended to update individual appliances one at a time to avoid simultaneous downtime for all appliances.

**To update an appliance**:

1. Go to the :guilabel:`Configuration` tab on the **Admin** page.
2. Select :guilabel:`Appliance updates` under :guilabel:`Micetro Version` in the left sidebar. 
3. On the Row menu :guilabel:`...` for the relevant update, select :guilabel:`Download`.

   .. image:: ../../images/appliances-download-11.0.png
      :width: 50%

4. Once the download is complete, the update status becomes :guilabel:`Pending`. Initiate the update process by selecting :guilabel:`Deploy` on the Row menu.
