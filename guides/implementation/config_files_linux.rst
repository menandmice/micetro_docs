.. meta::
    :description: Description of important configuration files for Micetro, including their formatting and locations, on Linux
    :keywords: configuration, preferences, Micetro, Linux
 
.. _config-files-linux:
 
Configuration files for Linux
=============================
Individual components in Micetro can be configured by editing ``preferences.cfg`` files, otherwise known as configuration files. Components that can be configured include the Central executable, the DNS/DHCP Agents, the Update Agent, and the web services executable (mmWs).
 

Location of important config and log files
------------------------------------------
 
.. important::
    The paths below represent the default values. Depending on your installation, your environment may be using different paths. 
 
The default locations of the preferences files for Windows and Linux, respectively, are as follows:
 
.. csv-table::
   :header: "Preferences file locations"
   :widths: 100
 
   "/var/mmsuite/mmcentral/preferences.cfg"
   "/var/mmsuite/dns_server_controller/preferences.cfg"
   "/var/mmsuite/dhcp_server_controller/preferences.cfg"
   "/var/mmsuite/updater/preferences.cfg"
   "/var/mmsuite/web_services/preferences.cfg"
 
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
