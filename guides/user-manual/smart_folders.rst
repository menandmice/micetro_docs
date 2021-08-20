.. meta::
   :description: Smart folders in Micetro by Men&Mice
   :keywords: folder management, organization, filtering, Micetro 

.. _smart-folders:

Smart folders 
-------------

Smart folders are saved filters, using the filter query syntax from :ref:`webapp-quick-filter`.

Smart folders can group together the following objects:

DNS
    Zones and records.

IPAM
    Ranges, scopes, containers, and IP addresses.

.. note::
    DNS records and IP addresses can only be filtered with a smart folder placed in the root folder.

Access to smart folders
^^^^^^^^^^^^^^^^^^^^^^^

See :ref:`folder-access`.

.. _combine-smart-folder:

Combining smart folders
^^^^^^^^^^^^^^^^^^^^^^^

Smart folders placed inside another smart folder will combine the filtering queries.

**Example:** user creates a smart folder called *.com TLD** with the filter query ``.com`` (either in the root folder or inside an object folder). Inside the **.com TLD** smart folder they create another smart folder called *local** with the filter query ``authority=example.local.``.

The smart folder *.com TLD* will display all zones that contain the string ``.com``, and the smart folder *local* will display all zones that contain the string ``.com`` **and** whose authority is ``example.local.``.

.. tip::
    Using smart folders within smart folders allows you to create powerful and complex filter combinations while preserving each filter element on its own as well.