.. meta::
   :description: Location of important configuration files for Micetro
   :keywords: configuration, Micetro

.. _config-files:

Location of Important Config and Log Files
==========================================

.. important::
  The paths below represent the default values. Depending on your installation, your environment may be using different paths. 

.. _config-windows:

Windows
-------

.. csv-table::
  :header: "Path", "Information"
  :widths: 40, 60

  "``C:\Program Files\Men and Mice\Central``", "Micetro Central install directory."
  "``C:\Program Files\Men and Mice\Console``", "Management Console install directory."
  "``C:\Program Files\Men and Mice\DNS Server Controller``", "DNS Agent install directory."
  "``C:\Program Files\Men and Mice\DHCP Server Controller``", "DHCP Agent install directory."
  "``C:\Program Files\Men and Mice\Web Services``", "Micetro Web Interface install directory."
  "``C:\ProgramData\Men and Mice\Central\preferences.cfg``", "Micetro Central configuration file."
  "``C:\ProgramData\Men and Mice\Central\mmsuite.db``", "Default, built-in database for Micetro."
  "``C:\ProgramData\Men and Mice\Central\backups\``", "Server configuration backups for Micetro Central."
  "``C:\ProgramData\Men and Mice\Central\logs\``", "Micetro Central logfiles. See :ref:`central-logging.`"
  "``C:\ProgramData\Men and Mice\Central\updates\``", "Micetro Updater service install directory."
  "``C:\ProgramData\Men and Mice\DHCP Server Controller\preferences.cfg``", "Mietro DHCP Agent configuration file."
  "``C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg``", "Micetro DNS Agent configuration file."
  "Logfiles for Server Controllers", "Enabled in the agent's ``preferences.cfg`` file. See :ref:`controller-logging`."

.. _config-linux:

Linux
-----

.. csv-table::
   :header: "Path", "Information"
   :widths: 40, 60

   "``/var/mmsuite/mmcentral/preferences.cfg``", "Micetro Central configuration file."
   "``/var/mmsuite/dns_server_controller/preferences.cfg``",	"Micetro DNS Agent configuration file."
   "``/etc/httpd/conf/mmweb.conf``",	"Micetro Web Interface configuration file."
   "``/etc/httpd/conf/mmws.conf``",	"Micetro Web Services proxy configuration file"
   "``./[monitor|nodeX]/postgresql.conf``",	"PostgreSQL HA cluster database configuration file."
   "``./[monitor|nodeX]/pg_hba.conf``",	"Stores client authentication information for the database cluster."
   "``/var/mmsuite/mmcentral.log``",	"Micetro Central logfile."
   "``/var/mmsuite/dns_server_controller/logs/``",	"Micetro DNS Agent logfile."
   "``./[monitor]/pg_log/postgresql-[WeekDay].log``",	"PostgreSQL HA cluster monitor logfile."