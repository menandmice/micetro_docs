.. meta::
   :description: Object folders in the Micetro Management Console
   :keywords: folder management, organization, Micetro 

.. _console-object-folders:

Object Folders (Management Console)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To help in organizing your IP Address ranges, DNS Zones, and DHCP scopes, you can create folders and subfolders into which you can place one or more objects. You can also rename and delete folders, as well as specify access to ranges within the folder (once objects have been moved into it).

.. note::
  :ref:`object-folders` also appear in the Web Application, and objects can be added to and removed from them.

Creating a New Folder
"""""""""""""""""""""

When you create a new folder, you can move objects from the "master" list into this new folder. However, the objects always remain in the master list as well.

To create a folder, do the following:

1. In the *Object List*, right-click on either :guilabel:`IP Address ranges`, :guilabel:`DNS Zones`, or :guilabel:`DHCP scopes`.

2. From the shortcut menu, select :guilabel:`New folder`. The *Create Folder* dialog box displays.

3. Type a name for the folder.

4. Click :guilabel:`OK`. The new folder now displays in the Object List.

5. To move an object into this new folder, simply highlight it and drag and drop it into this folder.

Creating a Subfolder
""""""""""""""""""""

If desired, you can add a subfolder underneath any existing folder.

.. warning::
  If you move an object from another folder into a subfolder, the object no longer appears in the original folder. This is not the case, however, when you move an object from the master list. The object always remains in the master list, regardless of what folder/subfolder a copy is moved to.

In the *Object List*, click :guilabel:`+` next to the object type where you want to create the subfolder. The object expands to show any currently defined folders.

1. Right-click on the folder to which you want to add a subfolder.

2. From the shortcut menu, select :guilabel:`New Folder`.

3. In the *Create Folder* dialog box, type a name for the new subfolder.

4. Click :guilabel:`OK`. You can now move objects into this subfolder by dragging/dropping them from the list on the right.

Renaming a Folder
"""""""""""""""""

You can rename any folder by doing the following:

1. Select the folder you want to rename.

2. Right-click and, from the shortcut menu, select :guilabel:`Rename`.

3. In the *Rename folder* dialog box, type the new name for the folder.

4. Click :guilabel:`OK`. The object list refreshes and the new folder name displays.

Specifying Access for Folder Items
""""""""""""""""""""""""""""""""""

Once you have created a folder and moved objects into the folder, you can assign permissions to the ranges in the folder to control who can work with those objects. Choosing access for a folder does not set the access for the folder, but merely selects all objects in the folder and applies the access settings to these objects.

To specify access for item/items in a folder, do the following:

1. Right-click on the folder and, from the shortcut menu, select :guilabel:`Access`.

2. In the *Access Control* dialog box, select the group/user (or add a new group/user). Then, specify the permissions for the user.

3. Click :guilabel:`OK`.

4. If desired, enter a *Save Comment* when prompted.

Deleting a Folder
"""""""""""""""""

When deleting a folder, the objects within the folder are not deleted and remain intact.

To delete a folder/subfolder, do the following:

1. Right-click on the folder and, from the shortcut menu, select :guilabel:`Delete`.

2. When the confirmation message displays, click :guilabel:`Yes`.
