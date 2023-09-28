.. meta::
   :description: Changes to the script name field validation policy
   :keywords: Micetro's event hooks, Micetro scheduled scripts, Micetro administrator, Micetro external scripts

.. _admin-script-name-validation-policy:

Script name validation policy
=============================

Changes to the script name field validation in versions 10.5.5 and 10.6
-----------------------------------------------------------------------

With version 10.5 there are significant changes to the script name fields for schedules scripts, change event scripts, subnet monitoring scripts, and report results scripts. The dialogs for the first three are accessible from the :guilabel:`Event hooks` page under :guilabel:`Admin` > :guilabel:`Configuration` > :guilabel:`Event Hooks` (:guilabel:`Add/Edit scheduled event`, :guilabel:`Add/Edit change event`, :guilabel:`Set default subnet monitoring`). The last field is found in the :guilabel:`Schedule` dialog for report definitions under :guilabel:`Reports` in the main menu.

.. note::
   The changes introduce the notion of a **scripts folder** which is a folder named ``scripts`` located in Central's data folder. Any existing scripts should be moved there and new script should only be placed there. After existing script have been moved there the field values that refer to them need to be updated.

The new policy does not allow scripts with paths outside of the scripts folder (and sub-folders of it), and validates that the script file actually exists on the server. It is also no longer possible to specify an interpreter as part of the script name value. For Windows, the script file's extension is used to determine the interpreter to be used and for Linux the scripts should use shebang to indicate the interpreter. Finally, the new policy also does not allow parameters to be specified as part of script name value. Wrapper scripts, i.e. scripts that call other scripts with specific parameters can be used instead.

Existing values for script name fields will continue to work and saving without changing the value will not fail validation. The new validation policy only comes into play when the user tries to change the value in the WebUI or through the API.

For dialogs with script name fields that have values that don't meet the new requirements, the current value is shown in a read-only field. 

The new script name field consists of a typeahead field for scripts located in the scripts folder and a checkbox to indicate that ScriptRunner authentication parameters should be used when invoking the script.
