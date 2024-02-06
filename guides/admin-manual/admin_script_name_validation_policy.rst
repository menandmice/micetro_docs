.. meta::
   :description: Changes to the script name field validation policy
   :keywords: Micetro's event hooks, Micetro scheduled scripts, Micetro administrator, Micetro external scripts

.. _admin-script-name-validation-policy:

Script Name Validation Policy
=============================

Changes in Script Name Field Validation (version 10.5.5)
----------------------------------------------------------

In version 10.5.5, significant changes have been made to the validation of script name fields for schedules scripts, change event scripts, subnet monitoring scripts, and report results scripts. 

**Where to Access the Script Name Fields**:

Script name fields are used when adding or editing events and setting default subnet monitoring on the :guilabel:`Event Hooks` page (:menuselection:`Admin --> Configuration --> Event Hooks`).  Additionally, the script name field is located in the :guilabel:`Schedule` dialog box for report definitions on the :guilabel:`Reports` page.

**Key Points to Note**:

* **Scripts Folder**: The changes introduce a new concept of a **scripts folder**. This folder, named ``scripts``, is located in Central's data folder. Existing scripts need to be moved to this folder, and all new scripts should be placed here as well. After moving existing scripts, ensure that field values referring to them are updated accordingly.

* **Restrictions**: The new policy does not allow scripts with paths outside of the scripts folder (or its sub-folders). Validation checks ensure that the script file exists on the server. Additionally, specifying an interpreter as part of the script name value is no longer allowed. For Windows, the interpreter is determined by the script file’s extension, while for Linux, shebang should indicate the interpreter. Parameters cannot be specified as part of the script name value; however, wrapper scripts that call other scripts with specific parameters can be used instead.

* **Compatibility**: Existing values for script name fields will continue to function, and saving without changing the value will not result in validation failure. The new validation policy is enforced only when attempting to change the value via the WebUI or through the API.

* **Display of Non-Compliant Values**: For dialog boxes containing script name fields with values that don't meet the new requirements, the current value is displayed in a read-only field. 

**New Script Name Field**:

The updated script name field includes a dropdown menu listing scripts located in the scripts folder, along with a checkbox to indicate the use of ScriptRunner authentication parameters when invoking the script.