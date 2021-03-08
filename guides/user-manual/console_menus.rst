.. _console-menus:

Menu Bars
=========

The Menu Bar in the Men & Mice Management Console provides access to nearly all of the program's functionality.

.. important::
  You must have sufficient access privileges in order to use some of the menu items discussed below.

.. note::
  Not every menu option is listed below. Some are detailed in their respective sections. Some of the options discussed below are global across the whole application (e.g., Cut, Copy, and Paste).

File Menu
---------

Save
  Saves any changes that have been made in the currently active window. This is only available when a zone has been edited and there is some new data to be saved.

Change Password
  Use this command to change your login password to the Management Console. Your current password is required in order to change to a new one.

Page Setup
  Opens the Print Setup dialog box, from which you can choose the default printer, paper, page orientation, and other properties to be used when printing from Management Console.

Print
  Opens the Print dialog box and allows you to print the contents of the currently selected Zone window. This command is only available when a Zone window is open.

Exit
  Closes the Management Console window.

Edit Menu
---------

The commands available from the Edit menu vary, depending on what is currently selected in the Management Console. When working in the Manager window the following functions are offered:

Undo
  Reverses the last edits that you made, in the reverse-order that you made them.

Redo
  Reverses the effects of the last Undo command.

Cut
Removes the currently selected item(s) and stores them in the Windows clipboard.

Copy
  Makes a copy of the currently selected item(s) and places it into the Windows clipboard.

Paste
  Copies the contents of the clipboard at the location of the insertion point.

Paste Custom Properties
  Allows pasting of custom property contents into multiple objects. To use this command, select one object and choose Copy. Then select the objects whose custom properties you want to populate and choose Paste Properties. This will open a dialog box where you can choose which custom properties you want to paste.

Clear
  Deletes the currently selected text or record.

Select All
  This command selects all of the objects (e.g., zones, servers, scopes, IP Address ranges).

Find
  This command initiates a new search.

Find Next
  This command repeats the last search you performed. For example, if the last search was for A, this automatically locates the next occurrence of A in the object list.

Save Filter/Delete Filter
  It is possible to save/delete filters for various object types. Saved filters appear in the list on the left hand side of the Manager Window and in the Create Zone dialog box. Filters can be local or global in scope. Filters created by the Administrator are global and visible to all users. Filters created by any other user are visible only to that user.

Preferences
  Opens the Options dialog box where you can make default selections for various Management Console functions.

.. sidebar::

  .. image:: ../../images/console-preferences-menu.png

.. highlights::
  When working with a zone, the Edit menu changes and includes additional functions.

  Enable Record
    Makes the currently selected record(s) active in the zone. Use this command to re-enable a zone that has been disabled. All records are active by default unless they have been manually disabled. You cannot enable records in dynamic zones.

  Disable Record
    Makes the currently selected record inactive. When a record is disabled, it is ignored in the zone. You cannot disable records in dynamic zones.

  Insert Record
    Opens a popup menu that lets you specify the type of record you want to create. To insert A, CNAME, MX, NS, or PTR records, choose the corresponding option from the menu. The new record is created directly below the currently selected record or field. For other types of records, select Insert Record. This creates a new blank row above the currently selected record or field.

  Duplicate Record
    Creates a copy of the selected record(s). The new records appear directly underneath the last record being duplicated.

  Delete Record
    Deletes the entire record from the zone. Unlike the Clear command, the entire record does not need to be selected for this command to work. It will delete the entire record in which the cursor is currently located.

  Show TTL
    This menu command can be toggled on and off by selecting it repeatedly. This option is enabled by default. If you disable this option, the TTL column will not be displayed in the zone window. This command is only available when a zone window is open and active.

  Show Comment
    This menu command can be toggled on and off by selecting it repeatedly. This option is enabled by default. If you disable this option, the Comment column will not be displayed in the zone windows. This command is only available when a Zone window is open and active. This command can only be used for static zones.

Query Menu
----------

Lease History
  This function can be enabled through System Settings, Logging. When enabled you can search the DHCP lease history and if desired, export the search results to a file.

Object History
  Allows you to query the history throughout the system for all objects or a specific object. Refer to  Object Change History  for details. You can search all objects or, using the Only show objects of type drop-down list, you can select which object type to search. You can only search all object types or one selected object type.

Men & Mice Suite Log
  Displays log messages for the Men & Mice Suite.

Search and Update Wizard
  Launches the Search and Update Wizard, a utility that allows you to find, create, modify, or delete records in multiple zones and DHCP Scopes using a single action. Click Next> and follow the instructions onscreen to specify the type of records you want to search, the action you want to perform (e.g., create, replace, delete, edit), etc.

User Activity
  Users with user administrative privileges can see this menu item. Selecting this menu item displays a window that shows a list of all users including the user name, authentication type, login status, and last login time.

Window Menu
-----------

Cascade
  Aligns all currently open windows inside the Console window so that they overlap, showing only their title bars. This allows you to access all currently open windows.

Show Progress
  This window shows the progress of operation that can take some time, such as opening and saving large zones. When an operation is in progress (and displayed in the progress window) it can be cancelled by clicking in the progress window and choosing Cancel.

Show Console
  Displays errors that may occur during various operations.

Show Manager Window
  Displays the Manager Window. Use this function in the event you inadvertently close the Manager window.

Revert to Standard Layout
  Returns the program to its standard view, with the Management Console open and the main window displayed on top of any other open windows. Other windows are not affected by this command. Also, shows the progress window if the window is hidden.

Active Window List
  At the bottom of the Window menu, there will be a list of every window currently open in the Management Console. You can instantly give a window the focus (i.e., bring it to the top) by selecting it from this list.

Help Menu
---------

Help
  Launches the on-line help features of the Men & Mice Suite.

About Men and Mice Management Console
  Opens the About window, which contains the full version number of the Men & Mice Management Console that you are running.
