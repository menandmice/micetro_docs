.. meta::
   :description: How to update Micetro
   :keywords: update, Micetro

.. _updates:

Updating Micetro Components and Appliances
==========================================
This guide is intended to provide instructions on updating Micetro, its components, and appliances.

.. note::
   These instructions apply to the Micetro Web Application. For information about update management in the M&M Management Console, refer to :ref:`console-updates`.

**Permissions needed to apply updates:**

* **Permission**: None (cannot create a custom role to access this)
* **Role**: ``Administrators (built-in)``

Micetro Versions
----------------
Micetro notifies you when a new version becomes available and allows administrators to update to the new version. Versions may contain updates for any number of components, such as Micetro Central and the Micetro agents. 

* Minor versions often only contain an update for a single component, such as the Micetro Web Application.

* Major version upgrades normally contain an update for every component.

.. note::
  To receive notifications and check for updates, you must be in a group with administrative privileges. Only the Administrator user can perform the actual update.
 
Update Paths
------------
A direct update path is supported for all Micetro versions from 7.x and greater. If you are on a version below 7.x, please update first to version 9.3 before updating to the target version, e.g., 25.1.x.

Important Notes for Updating
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* **If you have a Kea DHCP server on a version below 1.6.0**, it must be updated to 1.6.0 or 1.8.0 before you can update to Micetro version 10.0.0 or greater. For more information, refer to the `Kea update notice <https://docs.menandmice.com/en/10.0/release_notes/10.0.0/#release>`_.

* **If you're running Micetro Central on Windows on a version between 7.x and 10.x** and want to update directly to 25.1.x, follow these instructions:

     1. Run the installer executable manually to upgrade Micetro Central to version 25.1.x.
     2. Download only the Micetro Central installer file from the `Micetro downloads server <https://download.menandmice.com/Windows/>`_ and run the installer with "Run as Administrator" on the machine running Micetro Central.
     3. Update Micetro Central in the High Availability setup, if applicable.
     4. Shut down the Micetro Central service on each secondary server.
     5. Update the primary server manually using an installer, which can be downloaded from the `downloads server <https://download.menandmice.com/>`_.
     6. Manually update each secondary server using an installer. 

   When the update is successfully completed, the service will be started again. Both servers should be updated and returned to High Availability mode.

Updating Micetro
----------------
Before updating Micetro, we strongly recommend first reading the :ref:`release-notes`. 

Checking for Available Updates
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Select :guilabel:`Admin` on the top navigation menu.

2. Select the :guilabel:`Configuration` tab.

3. Any available updates will be displayed in the left sidebar under :guilabel:`Micetro Version`.

   .. image:: ../../images/available-updates-10.6.png
    :width: 90%

Preparing the Update
^^^^^^^^^^^^^^^^^^^^^
To streamline the updating process, the update is prepared---ensuring that update packages are uploaded to the various components---before it is deployed.

**To prepare an update**:

1. Select :guilabel:`Prepare Update` to start the update process.

2. A package for the new version is downloaded and prepared for deployment. The preparation includes uploading a package to each DNS and DHCP server. 

Deploying the Update
^^^^^^^^^^^^^^^^^^^^^
Once the package has been prepared, select :guilabel:`Deploy Update` to deploy the new version. 

If the new version includes an updated Micetro Central component, it will restart. Otherwise, Micetro seamlessly updates to the new version.

After the update has been deployed, each Micetro component requiring an upgrade is upgraded to the latest version. The update packages uploaded during the preparation phase are put into place.

Checking the Status of Micetro Components and Appliances
---------------------------------------------------------
You can see the status of all components at a glance, so you know everything is running as expected.

**To check the current status of Micetro Components and Appliances**:

1. Select the :guilabel:`Configuration` tab on the **Admin** page. 
2. In the left sidebar, select :guilabel:`Current status` under :guilabel:`Micetro Version`.

A list of all components, their current versions, and statuses is displayed.

Troubleshooting
^^^^^^^^^^^^^^^^
If there's an error with a component, or it's offline, it will be highlighted in the :guilabel:`Status` column of the **Current Status** grid. Hover your cursor over the **Offline** or **Error** status for more details to help you troubleshoot.

Updating Appliances
-------------------
If any appliances have pending updates, they are displayed on the :guilabel:`Appliance updates` grid, along with their details and statuses.

There are three types of updates:

1. **Full**: Full updates are the most extensive and involve replacing the entire appliance, typically with the release of a new major version. These updates are versioned and are around 700MB in size.
2. **Minor**: Minor updates consist of version upgrades, such as 9.4.1, and typically include minor improvements or enhancements. You can always update directly to the latest minor version within a major version. For example, the 9.4.2 update includes all changes made in 9.4.1, so it's okay to go directly from 9.4.0 to 9.4.2. However, for customers with appliance versions older than 9.4, it's necessary to first install the 9.4.0 full upgrade before deploying 9.4.1 or 9.4.2. These updates are around 2--300MB in size. 
3. **Patch**: Patch updates are minor adjustments to individual components, such as BIND or ISC DHCP. They address specific issues or vulnerabilities.

Appliance Update Status
^^^^^^^^^^^^^^^^^^^^^^^
The update process involves downloading and deploying updates reflected in the :guilabel:`Status` column of the **Appliance updates** grid. There are five different statuses:

* **Available**: Updates are ready for application but have not been downloaded yet.
* **Deployed**: Updates have been applied and fully deployed. 
* **Partially deployed**: Updates have been downloaded but not applied to every applicable appliance in the system.
* **Downloaded**: Similar to **Partially deployed**, but updates have not been applied to any appliance in the system.
* **Downloading**: This is a temporary state indicating that the patch or upgrade is currently being downloaded.

.. note::
   It's recommended to update individual appliances one at a time to avoid simultaneous downtime for all appliances.

How to Update Appliances
^^^^^^^^^^^^^^^^^^^^^^^^
To update an appliance in Micetro, you can either download and apply the update directly through the Web Application or download the update package manually and then apply it through the Web Application. It's also possible to update MDDS manually by following the `instructions in the BlueCat Address Manager Administration Guide <https://docs.bluecatnetworks.com/r/Address-Manager-Administration-Guide/Upgrading-DNS/DHCP-Server-software/25.1.0>`_.

**To update an appliance**:

1. On the **Admin** page, select the :guilabel:`Configuration` tab.
2. In the left sidebar, select :guilabel:`Appliance updates` under :guilabel:`Micetro Version`. 
3. Select the relevant update.
4. Use the Row :guilabel:`...` menu to select :guilabel:`Download`.

   .. image:: ../../images/appliances-download-11.0.png
      :width: 50%

4. Once the download is complete, the update **Status** becomes :guilabel:`Pending`. Initiate the update process by selecting :guilabel:`Deploy` on the Row :guilabel:`...` menu.

**To manually prepare an appliance update**:

1. Navigate to the `appliance update index <https://update.menandmice.com/appliance/index.json>`_ and grab the ``filename`` for the update, e.g., "filename": "bdds-9.6.1.zip".
2. Download the update file (.zip) with that ``filename`` from the `update server <https://update.menandmice.com/appliance/updates/>`_ and upload it to the Central server.
3. Unzip the file and extract its contents, which include the manifest file, into a folder in one of the following locations:

   * **Windows**: ``C:\ProgramData\Men and Mice\Central\update\appliance``
   * **Linux**: ``/var/mmsuite/mmcentral/update/appliance``

   .. note::
      We recommend naming the folder based on the update version, e.g., ``C:\ProgramData\Men and Mice\Central\update\appliance\9.6.1`` or ``/var/mmsuite/mmcentral/update/appliance/9.6.1``.

4. In the Web Application, navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Appliance updates` in the left sidebar.
5. Select the update in the grid and use the Row :guilabel:`...` menu to select :guilabel:`Deploy`.

   .. note::
      The update you downloaded should be listed in the data grid and available for deployment as long as there is an MDDS appliance with a version to which the update applies.
