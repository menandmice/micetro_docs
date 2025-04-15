.. meta::
   :description: Backing up and restoring appliances in Micetro
   :keywords: appliances, DNS/DHCP appliance, MDDS appliances, backup, restore, initialize servers

.. _backup-appliances:

Backing Up and Restoring Appliances
===================================
Micetro automatically takes a backup of your appliance's configuration every 15 minutes, capturing any changes made since the last backup. Additionally, a full backup is taken once every 24 hours, and all the incremental backups are managed and cleaned up for you.

If an appliance experiences a crash and becomes unusable, you can use these backups to set up a new appliance as a replacement while maintaining the same IP address. 

After restoring an appliance, Micetro automatically detects the new server as uninitialized. To begin using the new server, you need to initialize it. 

**To initialize a server**:

1. In the data grid, locate the uninitialized server.
2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Initialize appliance`.

   .. image:: ../../images/appliance-backup-restore-11.png
      :width: 100%

   * **Use data from Micetro**: This option allows you to initialize the server using the data saved in Micetro.
   * **Use data from the new appliance**: Use this option if you want to initialize the server with the data from the new appliance itself.

3. Select :guilabel:`Initialize`.
