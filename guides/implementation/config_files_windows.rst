.. meta::
    :description: Description of important configuration files for Micetro on Windows
    :keywords: configuration, preferences, Micetro, Windows
 
.. _config-files-windows:
 
Configuration files for Windows
===============================
Individual components in Micetro can be configured by editing ``preferences.cfg`` files, otherwise known as configuration files. Components that can be configured include the Central executable, the DNS/DHCP Agents, the Update Agent, and the web services executable (mmWs).
 
Location of important config and log files
------------------------------------------
 
.. important::
    The paths below represent the default values. Depending on your installation, your environment may be using different paths. 
 
 
The default locations of the preferences files for Windows are as follows:
 
.. csv-table::
   :header: Preferences file locations
   :widths: 100
 
   "C:\\ProgramData\\Men and Mice\\Central\\preferences.cfg"
   "C:\\ProgramData\\Men and Mice\\DNS Server Controller\\preferences.cfg"
   "C:\\ProgramData\\Men and Mice\\DHCP Server Controller\\preferences.cfg"
   "C:\\ProgramData\\Men and Mice\\Updater\\preferences.cfg"
   "C:\\ProgramData\\Men and Mice\\Web Services\\preferences.cfg"
 
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
   "Logfiles for Agents", "Enabled in the agent's ``preferences.cfg`` file. Refer to :ref:`controller-logging`."
