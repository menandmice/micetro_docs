.. meta::
   :description: A guide to using the Men&Mice Web Application 
   :keywords: web app, user guide, Micetro 

.. _webapp-user-guide:

Using Micetro
==============

The application is split into 5 main sections:

* **DNS**. On the :ref:`dns` page, you can create, delete, and edit DNS zones. Here you also manage DNS records within the DNS zones.
* **IPAM**. On the :ref:`ipam-main` page, you have the ability to perform various actions related to network and DHCP management, such as creating a new network range or DHCP scope, managing IP addresses within a network or DHCP scope and creating DHCP reserverations. You can also view related DNS data for IP addresses within a network and add DNS hosts for IP addresses.
* **Reports**. The :ref:`webapp-reporting` is activated with a separate license key and there you can create and save new reporting definitions, as well as schedule reports to be run at specific times.
* **Workflow**. The :ref:`webapp-workflows` requires a separate license key. The module allows you to submit ‘change requests’ for creating, modifying, or deleting DNS records.
* **Admin**. The Admin page is the workspace for system administrators where they perform the various tasks to manage Micetro, such as managing user access and services.

.. note::
   The Internet Explorer browser is no longer supported as of version 9.3.0.
     
.. _webapp-help:

Getting Help or Support
-----------------------

Information about how to get help and access the documentation can be found in the right sidebar on the front page.

You can also access the help sidebar by clicking the :guilabel:`?` icon in the top menu on all pages.

Working with the List View
---------------------------
Micetro is centered around the grid listing objects in the system, such as DNS zones, DNS records, IP address ranges, DHCP scopes, and IP addresses. 

.. image:: ../../images/webui-annotated.jpg
   :width: 80%
|

.. csv-table::
  :widths: 25, 75
  :header: Item, Description

  "Refresh list",	"Refreshes the list containing a list of zones, ranges, records, or IP addresses"
  "Column configuration",	"Specifies which columns are visible in the list"
  "Quickfilter", "Narrows down the results shown in the list after having selected an item in the filtering sidebar. :ref:`webapp-quick-filter`"
  "Toggle list or tree view",	"Toggles the list between list and tree view"
  "Refresh list", "Refreshes the contents of the list"
  "Add to favorites", "Adds the selected item in the list to favorites. The corresponding favorites filter in the sidebar shows all favorited items"
  "Main tasks", "The main tasks in each section."
  "Inspector", "Shows various information for the selected item in the list. See :ref:`webapp-inspector`."
  "Filtering sidebar", "Shows a list of possible filters to use for the list. See :ref:`webapp-filtering`."
  "Quick command", "Allows for quickly finding and performing actions. See :ref:`webapp-quick-command`."
  
Filtering Sidebar
-----------------
The left-hand filtering sidebar acts as a selector in each context, and helps you to quickly find the zones or networks. You can select pre-defined “filters” or selectors.

By default, the sidebar is open, but you can collapse it to an icon-only mode. In case where a list of clickable items is needed, the sidebar is automatically unfolded.

Selecting an item in the filtering sidebar applies the filter for the main work grid. You can further narrow down results with quickfilters from the top menu. (See Quickfilter.)

.. tip::
   When you select a filter in the filtering sidebar, and then select the :guilabel:`Create` operation in the grid, the type of object will be automatically selected based on the active filter.

Folders
^^^^^^^
You can use folders as containers of objects such as DNS zones and networks.

The available folders, along with the folder hierarchy, can be viewed in the filtering sidebar. Click a folder to display the contents of that folder.

.. image:: ../../images/webui-folders.png
  :width: 60%
  :align: center
|
Selecting an item in the list, and then selecting :guilabel:`Add to folder` on the :guilabel:`Action` menu, opens a dialog box where you can move the item from one folder to another, or remove ir from a folder.

The Inspector
-------------
The inspector, located to the right of the grid in each context, serves as an infobox for the selected objects, such as the DNS zone list. In some cases it is possible to edit the information, such as DNS zone authority, or the SOA record for each zone.

All properties for the selected object are shown in the properties section. These include all custom properties that have been defined for a specific object type.

For IP addresses, where available, the vendor for the specific MAC address is also shown.


Searching by Using the Quick Command
------------------------------------

Quick command speeds up common operations in Micetro and helps you quickly find and perform actions on specific objects in the system.

Access quick command by clicking either the lightning icon in the upper-right corner or by using a keyboard shortcut: **Ctrl** + **Space**.

.. image:: ../../images/blackstar-quick-command.png
  :width: 80%
  :align: center


1. Start typing in one of the following:

   * A network

   * A DNS zone name

   * A DNS record name

   * An IP address

   A list of potential results will be displayed:

   .. image:: ../../images/blackstar-quick-command-autocomplete.png
     :width: 70%
     :align: center

2. Select the object to work with.

3. Select the action to perform on the object.

   .. image:: ../../images/blackstar-quick-command-actions.png
     :width: 70%
     :align: center


Quickfilter
-----------

.. note::
  **Quicksearch**

  You can toggle the Quickfilter to Quicksearch. Quicksearch will only highlight matching objects in the grid, but still display all other entries as well.

The Quickfilter can be accessed in all sections that use a list of items, for example, in the DNS zone list in the DNS section.

The Quickfilter helps you narrow down the results displayed after having selected an item in the filtering sidebar. Alternatively, it can be used solely by specifying columns and values for each column to be filtered by.

.. image:: ../../images/blackstar-quickfilter.png
  :width: 75%
  :align: center


The Quickfilter can be used as a free text search by simply entering some string into the field. The value is compared to all rows that have columns containing the given string.

You can also provide the name of the column, a condition operator, and the queried string.

.. code-block::

  type=slave
  name=^example
  name=$arpa.

Conditional Operators
^^^^^^^^^^^^^^^^^^^^^^

.. csv-table::
  :header: "Operator", "", "Opposite operator", ""
  :widths: 10, 40, 10, 40

  "=, ==", "is equal", "!=", "is not equal"
  ">, >=", "larger than, larger than or equal", "<, <=", "smaller than, smaller than or equal"
  "=@", "contains", "!@", "does not contain"
  "=^", "starts with", "!^", "does not start with"
  "=$", "ends with", "!$", "does not end with"
  "=~", "matches regular expression", "!~", "does not match regular expression"
  "in(...)", "is equal to one of the values in the given list", "not in(...)", "does not match any of the values in the given list"

Two or more conditions can be combined using *and*, *or*, and *()* parenthesis.

.. note::
  Date and time values as well as MAC addresses need to be enclosed in quotes when using the quickfilter.

On the **IPAM** page, one way of finding the network containing a specific IP address is typing the full IP address into the quickfilter.

.. image:: ../../images/blackstar-quickfilter-networks.png
  :width: 80%
  :align: center
