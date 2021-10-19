.. meta::
   :description: Location of important configuration files for Micetro by Men&Mice
   :keywords: configuration, Micetro

.. _config-files:

Location of important config and log files
==========================================

.. important::
  The paths below represent the default values. Depending on your installation, your environment may be using different paths. See :ref:`central-non-standard-install`.

Linux
-----

.. csv-table::
   :header: "Path", "Information"
   :widths: 40, 60

   "``/var/mmsuite/mmcentral/preferences.cfg``", "Men&Mice Central configuration file."
   "``/var/mmsuite/dns_server_controller/preferences.cfg``",	"Men&Mice DNS Server Controller configuration file."
   "``/etc/httpd/conf/mmweb.conf``",	"Men&Mice Web Application configuration file."
   "``/etc/httpd/conf/mmws.conf``",	"Men&Mice Web Services proxy configuration file"
   "``./[monitor|nodeX]/postgresql.conf``",	"PostgreSQL HA cluster database configuration file."
   "``./[monitor|nodeX]/pg_hba.conf``",	"Stores client authentication information for the database cluster."
   "``/var/mmsuite/mmcentral.log``",	"Men&Mice Central logfile."
   "``/var/mmsuite/dns_server_controller/logs/``",	"Men&Mice DNS Server Controller logfile."
   "``./[monitor]/pg_log/postgresql-[WeekDay].log``",	"PostgreSQL HA cluster monitor logfile."

.. _config-files-windows:

Windows
-------

.. csv-table::
  :header: "Path", "Information"
  :widths: 40, 60

  "``C:\Program Files\Men and Mice\Central``", "Men&Mice Central install directory."
  "``C:\Program Files\Men and Mice\Console``", "Management Console install directory."
  "``C:\Program Files\Men and Mice\DNS Server Controller``", "DNS Server Controller install directory."
  "``C:\Program Files\Men and Mice\DHCP Server Controller``", "DHCP Server Controller install directory."
  "``C:\Program Files\Men and Mice\Web Services``", "Men&Mice Web Application install directory."
  "``C:\ProgramData\Men and Mice\Central\preferences.cfg``", "Men&Mice Central configuration file."
  "``C:\ProgramData\Men and Mice\Central\mmsuite.db``", "Default, built-in database for Micetro."
  "``C:\ProgramData\Men and Mice\Central\backups\``", "Server configuration backups for Men&Mice Central."
  "``C:\ProgramData\Men and Mice\Central\logs\``", "Men&Mice Central logfiles. See :ref:`central-logging.`"
  "``C:\ProgramData\Men and Mice\Central\updates\``", "Men&Mice Updater service install directory."
  "``C:\ProgramData\Men and Mice\DHCP Server Controller\preferences.cfg``", "Men&Mice DHCP Server Controller configuration file."
  "``C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg``", "Men&Mice DNS Server Controller configuration file."
  "Logfiles for Server Controllers", "Enabled in the controller's ``preferences.cfg`` file. See :ref:`controller-logging`."
