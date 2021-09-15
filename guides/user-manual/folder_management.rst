.. meta::
   :description: Folder management in Micetro by Men&Mice
   :keywords: folder management, organization, Micetro

.. _folder-management:

Folder management
=================

Folder management is an important organizational tool for objects (through :ref:`object-folders`) and saved filters (through :ref:`smart-folders`).

The list of folders is located in the 'Folders' tab of the filtering sidebar. To switch to the 'Folders' tab, click the folder icon on the bottom of the sidebar.

.. tip::
    Any object that has been placed in an object folder has an indicator next to its name in the grid. Hovering over the icon will display the name of the folder.

Folders and contexts
^^^^^^^^^^^^^^^^^^^^

Folders are exclusive to their respective contexts, DNS or IPAM. Users cannot place IPAM objects in DNS folders, or vica versa.

.. _folder-access:

Access to folders
^^^^^^^^^^^^^^^^^

*Folders* are created globally: anyone creating an object or smart folder will make it visible to (and editable by) all users in the system. However, *objects in folders* are only visible to those that have the correct role to view them. See :ref:`access-control` for details.

.. note::
    Folders are **not shared** across address spaces, and cannot be moved from one address space to another.

Creating folders
^^^^^^^^^^^^^^^^

1. Locate the parent folder under which you want to create the new folder. (Or the root folder.)

2. Click on the ellipsis next to the parent/root folder's name, and select :guilabel:`Create folder` (for :ref:`object-folders`) or :guilabel:`Create smart folder` (for :ref:`smart-folders`).

3. Fill in the name (for object folders) and the filter query (for smart folders only) and click :guilabel:`Create`.

.. note::
    Folder names don't need to be unique.

Editing folders
^^^^^^^^^^^^^^^

You can edit a folder's name or filter query (for smart folder) by clicking :guilabel:`Edit` from its ellipsis menu.

Deleting folders
^^^^^^^^^^^^^^^^

You can delete a folder by clicking :guilabel:`Delete` from its ellipsis menu.

.. warning::
    Deleting a folder will delete **ALL** subfolders.

Folder types
^^^^^^^^^^^^

.. toctree::
    :maxdepth: 1

    object_folders
    smart_folders

Object folders are represented by a folder icon (full if there are objects or other folders inside, empty otherwise). Smart folders are represented by a filter icon.

.. note::
    For information on using folders in the Management Console, see :ref:`console-object-folders` and :ref:`console-saved-filter:`.
