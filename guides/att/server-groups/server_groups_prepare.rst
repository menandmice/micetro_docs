.. _server-groups-prepare:

Preparing a Server Group
************************

The prepare operation copies the DNS configuration from the staging server to the Member Servers.
This operation only places the files and data on Member Servers, but doesn’t overwrite the current live configuration.

1. Select the Server Group, or one of its Member Servers.

2. Click :guilabel:`Prepare group` in the Inspector panel on the right.

3. The following dialog is displayed:

.. image:: ../../images/prepare-server-group.png
  :width: 60%
  :align: center

4. Click on :guilabel:`Prepare now` to initiate the operation.

The progress of the operations is displayed in the group status in the Server Groups context. The status "Prepare in progress" will be changed to "OK" when all servers have finished the prepare process.

.. error::
  Errors are displayed in the info badge above the list of Member Servers. If any errors occur, the prepare operation fails and need to be repeated after the errors are addressed. 
