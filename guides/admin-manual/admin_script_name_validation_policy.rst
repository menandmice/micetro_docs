.. meta::
   :description: Changes to the script name field validation policy
   :keywords: Micetro's event hooks, Micetro scheduled scripts, Micetro administrator, Micetro external scripts

.. _admin-script-name-validation-policy:

Script Name Validation Policy
=============================
Script name fields are used when adding or editing events and configuring default subnet monitoring. You can view script names under :guilabel:`Event Hooks` on the :guilabel:`Configuration` tab of the **Admin** page.

The script name field is also located in the :guilabel:`Schedule` dialog for report definitions on the **Reports** page.

Since version 10.5.5, significant changes have been made to the validation of script name fields for scheduled scripts, change event scripts, subnet monitoring scripts, and report results scripts. 

Storing scripts
---------------
Scripts are stored in the ``scripts`` folder, which is located in Micetro Central's data folder. Any existing scripts need to be moved to this folder and all new scripts should be placed in it.

After moving existing scripts, make sure that you update the field values referring to them accordingly.

**Restrictions**:

Scripts cannot be have paths outside of the ``scripts`` folder or any of its sub-folders. Validation checks ensure that the script file exists on the server. 

You cannot specify an interpreter as part of the script name value. On Windows, the interpreter is determined by the script file's extension. On Linux, a ``shebang`` indicates the interpreter.

Naming scripts
--------------
When adding a script name to a scheduled event, change event, subnet monitoring event, or a report result, select the script name from the dropdown. The dropdown displays all scripts located in the ``scripts`` folder.

You can also mark the checkbox to indicate the user of ScriptRunner authentication parameters when invoking the script.

If a script name doesn't meet the requirements, the current value is displayed in dialogs as a read-only field.

.. note::
   Existing values for script names from versions before 10.5.5 will continue to function. Saving without changing the value will not result in a validation failure. The updated validation policy is only enforced when you attempt to change the value in the Web Application or through the API.

**Restrictions**:

Parameters cannot be specified as part of the script name value; however, wrapper scripts that call other scripts with specific parameters can be used instead.
