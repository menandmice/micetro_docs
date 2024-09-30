.. meta::
   :description: Smart folders in Micetro
   :keywords: folder management, organization, filtering, Micetro 

.. _smart-folders:

Smart Folders 
-------------

Smart folders are saved filters, using the filter query syntax from the :ref:`webapp-quick-filter`.

Smart folders can group the following objects:

* **DNS**: Zones and records.

* **IPAM**: Ranges, scopes, containers, and IP addresses.

.. note::
    DNS records and IP addresses can only be filtered by using a smart folder that is placed in the root folder.

Access to Smart Folders
^^^^^^^^^^^^^^^^^^^^^^^

See :ref:`folder-access`.

.. _combine-smart-folder:

Combining Smart Folders
^^^^^^^^^^^^^^^^^^^^^^^

Smart folders nested within another smart folder will merge their filtering queries.

**Example:** You create a smart folder called *.com TLD** with the filter query ``.com`` (placed either in the root folder or inside an object folder). Within the **.com TLD** smart folder, you then create another smart folder named *local** with the filter query ``authority=example.local.``.

The *.com TLD* smart folder will display all zones that contain the string ``.com``, while the *local* smart folder will display all zones that contain the string ``.com`` **and** have the authority ``example.local.``.

.. tip::
    Using smart folders within smart folders allows you to create complex and powerful filter combinations, while maintaining the integrity of each filter element.