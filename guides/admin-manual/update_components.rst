.. meta::
   :description: How to update Micetro components
   :keywords: update, components, Micetro

.. _update-components:

Updating Micetro
================
Before updating Micetro, we strongly recommend first reading the :ref:`release-notes`. 

.. note::
   These instructions apply to the Web Application. For information about update management in the Management Console, refer to :ref:`console-updates`.
   

Checking for Available Updates
------------------------------
To check for available updates in Micetro:

1. On the **Admin** page, select the :guilabel:`Configuration` tab.

2. In the left sidebar, select :guilabel:`Micetro Version`..

3. Select :guilabel:`Available updates`.

Any available updates for Micetro components will be displayed in the data grid.

   .. image:: ../../images/available-updates-10.6.png
    :width: 90%

The process of updating Micetro and its components comprises two steps:

1. Preparing the update
2. Deploying the update

Preparing the Update
--------------------
To streamline the updating process, the update is prepared---ensuring that update packages are uploaded to the various components---before it is deployed.

**To prepare an update**:

1. Select :guilabel:`Prepare Update` to start the update process.

2. A package for the new version is downloaded and prepared for deployment. The preparation includes uploading a package to each DNS and DHCP server. 

Deploying the Update
--------------------
Once the package has been prepared, select :guilabel:`Deploy Update` to deploy the new version. 

If the new version includes an updated Micetro Central component, it will restart. Otherwise, Micetro seamlessly updates to the new version.

After the update has been deployed, each Micetro component requiring an upgrade is upgraded to the latest version. The update packages uploaded during the preparation phase are put into place.
