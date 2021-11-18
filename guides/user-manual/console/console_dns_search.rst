.. meta::
   :description: The Zone tab in Micetro allows users to search any or all fields in the zone for a particular keyword or numeric value
   :keywords: DNS solution, Micetro by Men&Mice

.. _console-dns-search:

Search (DNS) (Management Console, deprecated)
---------------------------------------------

The Zone tab contains a powerful search utility that allows you to search any or all fields in the zone for a particular keyword or numeric value.

1. In the Zone tab toolbar, click the :guilabel:`Find` button. The Find in <zone name> dialog box displays.

..

2. The first field (on the left) is a drop-down list. The default setting is Any field, which means that every field (i.e., column of data) in the zone is included in the search. If you select a specific field from this list, then only that column will be searched.

3. The middle field is a drop-down list that contains several Boolean operators you can use to further define and narrow your search. The default setting is **Contains**, which will find any occurrence of the search criterion, even if it is nestled between other characters. Each operator has a corresponding inverse (e.g., Does not contain) that will search for everything but the criterion you entered.

4. The third field is where you enter the text or value you are searching for in this zone.

5. If you check the Select all matches checkbox, any records containing information that match the search criterion will automatically be selected. The selected records can then be operated on by other functions, such as Clear, Cut, Copy, Paste, Enable, and Disable. When this option is disabled, only the cell containing the current occurrence of the search criteria is selected.

6. To make your search case sensitive, check the :guilabel:`Case sensitive` checkbox. When checked, a search for ABC will not find fields that contain abc, aBC, AbC, etc.

7. If you check the :guilabel:`Wrap around` checkbox, when you use the *Find Again* command, the search will start again from the beginning of the zone instead of stopping at the end.

8. To initiate a search, click the :guilabel:`Find` button. The focus will shift to the first cell (or record) that meets the search criteria. If there is no matching information in the zone, a dialog box displays the message, "Nothing found."

9. Shortcut: You can instantly pull up the Find dialog box by pressing Ctrl+Alt+F. This will work in any screen where the search tool is available.
