.. meta::
   :description: In Micetro scheduled scripts allow the administrator to configure the system to run on schedule
   :keywords: Micetro scheduled scripts, Micetro administrator, event hooks, scheduled events

.. _admin-scheduled-events:

Scheduled Events
================

The administrator can configure the system to run scripts in a schedule, such as collecting a list of all users that performed at least one operation that day at midnight, etc.

To configure scheduled events:

1. On the **Admin** page, select :guilabel:`Configuration` in the upper-left corner.

2. Select :guilabel:`Event Hooks` in the filtering sidebar. In the **Scheduled events** section you can see any already defined events. 

3. You can click the Actions (**...**) button to edit or delete an event. There is also an option to run the script immediately.

4. To add a new script, click :guilabel:`Add`. The Add Schedule Event dialog box opens.

5. Enter/select the neccessary information, and then click :guilabel:`Add`.

   * **Enabled**: Select the checkbox to enable the scheduling process for the script. Likewise, at any time if you wish to disable the script, return to this dialog box and clear this option.

   * **Script name**: Select the script to use. It is assumed that the script is located in the scripts folder under Central's data folder.

    *Example 1*: Running a script named mytest.py. 
  
      To run a script named mytest.py that is located in the the script folder, start typing in ``mytest.py`` in the field and select it from the dropdown.

    *Example 2*: Running an executable named checkdata.exe. 
  
     To run an executable named checkdata.exe that is located in scripts fodlder, start entering ``checkdata.exe`` in the field and select it from the dropdown.

     It is possible to create a special user that has permissions to run scripts. When this user exists, it is possible to execute scripts that access Micetro without having include a user name and password in the script itself.

     To enable this feature, create a user named ScriptRunner. This user must use the Men&Mice Internal authentication method. When this user has been created, you only have to check the checkbox below the typeahead field.

     .. note::
      This method only works if the script scheduler invokes the script. When running the script, Micetro uses a temporary password that changes every time the script runs. For example, you could start a python script and pass in the username and password through the first and second arguments with ``python script.py ScriptRunner xxx``


   * **Run on**: Either enter the date and time the script should run, or use the datetime picker to select the date and time.

   * **Repeat every**: If this script should repeat at a desired frequency, select the checkbox. Then, in the next two fields, select the interval, for example, 1 week, 1 month, etc.
