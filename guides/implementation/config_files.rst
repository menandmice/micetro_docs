.. meta::
   :description: Description of important configuration files for Micetro, including their formatting and locations
   :keywords: configuration, preferences, Micetro

.. _config-files:

Configuration Files
-------------------

Individual components in Micetro can be configured by editing ``preferences.cfg`` files, otherwise known as configuration files. Components that can be configured include the Central executable, the DNS/DHCP Agents, the Update Agent, and the web services executable (mmWs).

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
  "``C:\Program Files\Men and Mice\Web Services``", "Micetro Web Application install directory."
  "``C:\ProgramData\Men and Mice\Central\preferences.cfg``", "Micetro Central configuration file."
  "``C:\ProgramData\Men and Mice\Central\mmsuite.db``", "Default, built-in database for Micetro."
  "``C:\ProgramData\Men and Mice\Central\backups\``", "Server configuration backups for Micetro Central."
  "``C:\ProgramData\Men and Mice\Central\logs\``", "Micetro Central logfiles."
  "``C:\ProgramData\Men and Mice\Central\updates\``", "Micetro Update Agent install directory."
  "``C:\ProgramData\Men and Mice\DHCP Server Controller\preferences.cfg``", "Micetro DHCP Agent configuration file."
  "``C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg``", "Micetro DNS Agent configuration file."
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
   "``/etc/httpd/conf/mmweb.conf``",	"Micetro Web Application configuration file."
   "``/etc/httpd/conf/mmws.conf``",	"Micetro Web Services proxy configuration file"
   "``./[monitor|nodeX]/postgresql.conf``",	"PostgreSQL HA cluster database configuration file."
   "``./[monitor|nodeX]/pg_hba.conf``",	"Stores client authentication information for the database cluster."
   "``/var/mmsuite/mmcentral.log``",	"Micetro Central logfile."
   "``/var/mmsuite/dns_server_controller/logs/``",	"Micetro DNS Agent logfile."
   "``./[monitor]/pg_log/postgresql-[WeekDay].log``",	"PostgreSQL HA cluster monitor logfile."
