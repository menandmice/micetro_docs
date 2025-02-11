.. meta::
   :description: Description of important configuration files for Micetro, including their formatting and locations
   :keywords: configuration, preferences, Micetro

.. _config-files:

Configuration Files
-------------------

Individual components in Micetro can be configured by editing ``preferences.cfg`` files, otherwise known as configuration files. Components that can be configured include the Central executable, the DNS/DHCP Agents, the Update Agent, and the web services executable (mmWs).

.. note::
  Since Micetro 11.2, the formatting of the ``preferences.cfg`` files for all binaries has changed from XML to INI. The files are automatically transformed when the binary is started after updating to version 11.2. For more information, refer to :ref:`change-preference-file`.

Location of Important Config and Log Files
==========================================

.. important::
  The paths below represent the default values. Depending on your installation, your environment may be using different paths. 


The default locations of the preference files for Windows and Linux, respectively, are as follows:

.. csv-table::
  :header: "Windows", "Linux"
  :widths: 50, 50

  "C:\\ProgramData\\Men and Mice\\Central\\preferences.cfg", "/var/mmsuite/mmcentral/preferences.cfg"
  "C:\\ProgramData\\Men and Mice\\DNS Server Controller\\preferences.cfg", "/var/mmsuite/dns_server_controller/preferences.cfg"
  "C:\\ProgramData\\Men and Mice\\DHCP Server Controller\\preferences.cfg", /var/mmsuite/dhcp_server_controller/preferences.cfg"
  "C:\\ProgramData\\Men and Mice\\Updater\\preferences.cfg", "/var/mmsuite/updater/preferences.cfg"
  "C:\\ProgramData\\Men and Mice\\Web Services\\preferences.cfg", "/var/mmsuite/web_services/preferences.cfg"


.. _config-windows:

Windows
^^^^^^^
The following table outlines the paths of configuration and log files on Windows:

.. csv-table::
  :header: "Path", "Information"
  :widths: 40, 60

  "``C:\Program Files\Men and Mice\Central``", "Micetro Central install directory."
  "``C:\Program Files\Men and Mice\Console``", "Management Console install directory."
  "``C:\Program Files\Men and Mice\DNS Server Controller``", "DNS Agent install directory."
  "``C:\Program Files\Men and Mice\DHCP Server Controller``", "DHCP Agent install directory."
  "``C:\Program Files\Men and Mice\Updater``", "Update Agent install directory."
  "``C:\Program Files\Men and Mice\Web Services``", "Micetro Web Services install directory."
  "``C:\ProgramData\Men and Mice\Central\preferences.cfg``", "Micetro Central configuration file."
  "``C:\ProgramData\Men and Mice\Central\mmsuite.db``", "Default, embedded database for Micetro."
  "``C:\ProgramData\Men and Mice\Central\backups\``", "Server configuration backups for Micetro Central."
  "``C:\ProgramData\Men and Mice\Central\logs\``", "Micetro Central logfiles."
  "``C:\ProgramData\Men and Mice\Central\updates\``", "Micetro Update Agent install directory."
  "``C:\ProgramData\Men and Mice\DHCP Server Controller\preferences.cfg``", "Mietro DHCP Agent configuration file."
  "``C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg``", "Micetro DNS Agent configuration file."
  "``C:\ProgramData\Men and Mice\Web Services\preferences.cfg``", "Mietro Web Services configuration file."
  "``C:\ProgramData\Men and Mice\Updater\preferences.cfg``", "Micetro Update Agent configuration file."
  "Logfiles for Agents", "Enabled in the agent's ``preferences.cfg`` file. See :ref:`controller-logging`."

.. _config-linux:

Linux
^^^^^
The following table outlines the paths of configuration and log files on Linux:

.. csv-table::
   :header: "Path", "Information"
   :widths: 40, 60

   "``/var/mmsuite/mmcentral/preferences.cfg``", "Micetro Central configuration file."
   "``/var/mmsuite/dns_server_controller/preferences.cfg``",	"Micetro DNS Agent configuration file."
   "``/var/mmsuite/dhcp_server_controller/preferences.cfg``",	"Micetro DHCP Agent configuration file."
   "``/var/mmsuite/updater/preferences.cfg``",	"Micetro Update Agent configuration file."
   "``/var/mmsuite/web_services/preferences.cfg``",	"Micetro Web Services configuration file."
   "``/etc/httpd/conf/mmweb.conf``",	"Micetro Web Application configuration file."
   "``/etc/httpd/conf/mmws.conf``",	"Micetro Web Services proxy configuration file"
   "``./[monitor|nodeX]/postgresql.conf``",	"PostgreSQL HA cluster database configuration file."
   "``./[monitor|nodeX]/pg_hba.conf``",	"Stores client authentication information for the database cluster."
   "``/var/mmsuite/mmcentral.log``",	"Micetro Central logfile."
   "``/var/mmsuite/dns_server_controller/logs/``",	"Micetro DNS Agent logfile."
   "``./[monitor]/pg_log/postgresql-[WeekDay].log``",	"PostgreSQL HA cluster monitor logfile."

Preference file structure and format
====================================
The preference file format supports rudimentary **sections**. This means that preference keys sharing a prefix can be grouped together under a section with the prefix as its name. The names of everything following the section header are prefixed to the key value until the next section. Preferences not belonging to a section must be listed at the top of the file.

When adding new lines to the preference file, make sure not to inadvertently place them in a section. For example, adding ``FooBar = true`` to the bottom of the file example above would actually add the preference ``CrashDumpFooBar`` to the file. If you are unsure, add new lines at the top of the file.

The INI example below demonstrates how sections can be used to group preference keys that share the same prefix. Using sections is optional and, if preferred, you can write the keys out fully as before, e.g., ``DatabaseServer`` is the equivalent of ``Server`` under a ``[Database]`` section.

Example of a preference file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block::

    Password = dXi6n8JHFmbJOssIva3JhO316A5d68qk
    GUID = 6ea66fa1-e507-a358-8bee-7f04eb6af614

    [Database]
    Type = mssql
    Server = "localhost@mydatabase;Encrypt=no"
    Username = micetro_user
    Password = $3$1$II+HwZRCvHV7UvZ+ZYN6W/UXaFtR1l3QdEXwvqNmL//vERjs3FPnDQ50

    [CrashDump]
    Enabled = false
    Level = 3

.. note::
  Preference keys are case-insensitive, i.e., ``password``, ``Password``, and ``PASSWORD`` are all the same.

  If a preference key occurs two or more times in the file, only the final value is used.

Strings
^^^^^^^
Preference values that contain whitespaces, semicolons, or hash signs must be quoted. Other string values do not require quotation.

Quotation marks within quoted strings need to be escaped, e.g., ``lorem = "ipsum \ "dolor\" sit amet"``.

Booleans
^^^^^^^^
In the XML format, the values for Boolean preferences were either 0 or 1, e.g., ``<CrashDumpEnable value="1"/>``. When transformed to the INI format, the values will remain either 0 or 1, but the values ``true`` and ``false`` can now be used instead. 

.. note::
    It is recommended to use ``true`` and ``false`` moving forward to align with the INI format, e.g., ``CrashDumpEnable = true``.

Comments
^^^^^^^^
The INI format supports comments. You can use either `;` and `#` to comment on what is following in a line or a whole line, if the comment is placed at the start of the line.

Example:

.. code-block::

    Password = dXi6n8JHFmbJOssIva3JhO316A5d68qk
    GUID = 6ea66fa1-e507-a358-8bee-7f04eb6af614

    [Database]
    Type = mssql
    Server = "localhost@mydatabase;Encrypt=no" ; Need to be quoted because of ';'
    Username = test ; micetro_user 
    Password = $3$1$II+HwZRCvHV7UvZ+ZYN6W/UXaFtR1l3QdEXwvqNmL//vERjs3FPnDQ50

    #[CrashDump]
    #Enabled = true
    #Level = 3
 
.. warning::
    Comments are **not** maintained when the binary itself updates the preferences. For example, when Central replaces a ``plaintext:mypassword`` value with a hash for the ``DatabasePassword`` preference.
