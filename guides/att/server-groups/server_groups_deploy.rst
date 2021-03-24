.. _server-groups-deploy:

Deploying a Server Group
************************

The deploy operation overwrites the live configuration with the one previously copied onto Member Servers with the prepare operation.
Deploying also reloads the servers in the Server Group.

Deploying the new configuration on the DNS member servers is done by doing the following:

1. Select the Server Group.

2. Click on :guilabel:`Deploy group` in the Inspector panel on the right.

3. The following dialog is displayed:

.. image:: ../../images/deploy-server-group.png
  :width: 60%
  :align: center

4. Click on :guilabel:`Deploy now` to initiate the operation.

5. The dialog is closed and the list of member servers in the group is displayed

6. The progress of the operations is displayed in the group status in the Server Groups context. The status "Deploy in progress" will be changed to "OK" when all servers have finished the deploy process.

Roll-back deployment
====================

Deployments can be rolled back to the last known working configuration. After opening a server group, you can initiate a roll-back through the Actions menu:

.. image:: ../../images/roll-back.png
  :width: 80%
  :align: center

The rollback operation restores the last known good configuration. Rolling back deployment ignores any previous deployments containing errors as well as configurations that have been prepared but not deployed.
