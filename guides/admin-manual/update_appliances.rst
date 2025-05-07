.. meta::
   :description: How to update appliances in Micetro
   :keywords: update, appliance, appliances, Micetro

.. _update-appliances:

Updating Appliances
===================
If any appliances have pending updates, they are displayed on the :guilabel:`Appliance updates` grid, along with their details and statuses.

There are three types of applliance updates:

1. **Full**: The most extensive type of updates, which involve replacing the entire appliance, typically with the release of a new major version. These updates are versioned and are around 700MB in size.
2. **Minor**: Version upgrades, e.g., 9.4.1, and typically include minor improvements or enhancements. You can always update directly to the latest minor version within a major version.

   For example, the 9.4.2 update includes all changes made in 9.4.1, so you can update directly from 9.4.0 to 9.4.2. However, customers with appliance versions older than 9.4 need to install the 9.4.0 full upgrade first before deploying 9.4.1 or 9.4.2. These updates are around 2--300MB in size. 
3. **Patch**: Minor adjustments to individual components, such as BIND or ISC DHCP. They address specific issues or vulnerabilities.

Appliance Update Status
-----------------------
The update process involves downloading and deploying updates reflected in the **Status** column of the **Appliance updates** data grid. There are five different statuses:

* **Available**: Updates are ready for application but have not been downloaded yet.
* **Deployed**: Updates have been applied and fully deployed. 
* **Partially deployed**: Updates have been downloaded but not applied to every applicable appliance in the system.
* **Downloaded**: Similar to **Partially deployed**, but updates have not been applied to any appliance in the system.
* **Downloading**: A temporary state indicating that the patch or upgrade is currently being downloaded.

.. note::
   It's recommended to update individual appliances one at a time to avoid simultaneous downtime for all appliances.

Updating an Appliance
---------------------
**To update an appliance**:

1. On the **Admin** page, select the :guilabel:`Configuration` tab.
2. In the left sidebar, select :guilabel:`Appliance updates` under :guilabel:`Micetro Version`. 
3. Select the relevant update.
4. Use the Row :guilabel:`...` menu to select :guilabel:`Download`.

   .. image:: ../../images/appliances-download-11.0.png
      :width: 50%

4. Once the download is complete, the update **Status** becomes :guilabel:`Pending`. Initiate the update process by selecting :guilabel:`Deploy` on the Row :guilabel:`...` menu.
