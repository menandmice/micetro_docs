.. meta::
   :description: In Micetro scheduled scripts allow the administrator to configure the system to run on schedule
   :keywords: Micetro scheduled scripts, Micetro administrator, event hooks, scheduled events

.. _admin-scheduled-evnts:

Scheduled Events
================

The administrator can configure the system to run scripts in a schedule, such as backing up the database every night at 3:00 AM, performing changes early in the morning, etc.

To configure scheduled events:

1. On the **Admin** page, select :guilabel:`Configuration` in the upper-left corner.

2. Select :guilabel:`Event Hooks` in the filtering sidebar. In the **Scheduled events** section you can see any already defined events. 

3. You can click the Actions (**...**) button to edit or delete an event. There is also an option to run the script immediately.

4. To add a new script, click :guilabel:`Add`. The Add Schedule Event dialog box opens.

5. Enter/select the neccessary information, and then click :guilabel:`Add`.

   * **Enabled**: Select the checkbox to enable the scheduling process for the script. Likewise, at any time if you wish to disable the script, return to this dialog box and clearr this option.

   * **Script name**: Enter the script name and necessary startup parameters. You must enter all information for the script as you would when invoking the script from the command line. It is assumed that the script is located in the same directory as the Men&Mice Central database file (mmsuite.db). If the script is stored in a different location, you must enter the path for the script.

    *Example 1*: Running a script named mytest.py. 
  
      To run a script named mytest.py that is located in the Men&Mice Central directory using the scripting host cscript, enter ``python mytest.py`` in the appropriate field.

    *Example 2*: Running an executable named checkdata.exe. 
  
      To run an executable named checkdata.exe that is located in the Men&Mice Central directory, enter ``checkdata.exe`` in the appropriate field.

      It is possible to create a special user that has permissions to run scripts. When this user exists, it is possible to execute scripts that access Micetro without having to enter a user name and password in the script itself.

      To enable this feature, create a user named ScriptRunner. This user must use the Men&Mice Internal authentication method. When this user has been created, you only have to enter $u as a user name and $p as a password when logging in to Micetro through the script.

     .. note::
      This method only works if the script scheduler invokes the script. When running the script, Micetro uses a temporary password that changes every time the script runs. For example, you could start a python script and pass in the username and password through arguments with ``python script.py $u $p``


   * **Run on**: Either enter the date and time the script should run, or use the datetime picker to select the date and time.

   * **Repeat every**: If this script should repeat at a desired frequency, select the checkbox. Then, in the next two fields, select the interval – for example, 1 week, 1 month, etc.
