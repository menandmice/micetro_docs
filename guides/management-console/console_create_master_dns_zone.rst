.. meta::
   :description: How to create a master zone in Micetro by Men&Mice Management Console
   :keywords: DNS console

.. _console-create-master-dns-zone:

Master Zone (Management Console, obsolete)
--------------------------------------------

This procedure is the fastest way to add a new blank (i.e., empty) zone. If you want to duplicate an existing zone, you should use the :guilabel:`Duplicate` command instead.

.. note::
  It does not matter which server is currently selected when you add a zone. You always have the option to select the Master Server when you configure the zone.

1. In the Object Section, select either :guilabel:`DNS Zones`, or select a specific server under the DNS Servers object.

2. On the toolbar, click the :guilabel:`New Zone` button. The *Create Zone* dialog box displays.

3. To use the *Create Zone Wizard* from this dialog box, click the :guilabel:`Assist me` button and follow the instructions found under the section titled, "Zone Wizard." If you chose not to use the zone wizard, continue with the steps below.

4. In the **Zone Name** field, type a name for the new zone.

5. In the **Master server** field, click the drop-down list, and select the server that you want to designate as the master for this zone. The Slave servers list automatically updates itself based upon your choice of the master server.

6. In the **Slave server** area, select the slave server(s) onto which you want to place this zone. The slave servers are selected by default, so if you do not want to assign this zone to a slave server, you must clear the associated checkbox. You can select or deselect all slave servers by right-clicking the list of slave servers in the dialog box for creation of master zones, and selecting the appropriate menu item.

7. If you want the zone to be an Active Directory Integrated zone, click the :guilabel:`AD Integrated zone` checkbox.

8. If the zone is Active Directory Integrated, the :guilabel:`AD Replication button` is enabled. Click this button to display a dialog box where you can set the AD Replication options for the zone.

.. image:: ../../../images/console-dns-zones-create.png
  :width: 50%
  :align: center

9. To finish creating the zone, click the :guilabel:`Create` button. The new zone is created with the appropriate name server (NS) records, and the *Zone SOA Panel* displays.

.. image:: ../../../images/console-dns-zones-soa-panel.png
  :width: 90%
  :align: center

10. Make any desired changes to the data shown.

11. When all selections/entries are made, click :guilabel:`Save`.
