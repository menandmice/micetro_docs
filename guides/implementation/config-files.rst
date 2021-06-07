.. meta::
   :description: Location of important configuration files for Micetro by Men&Mice
   :keywords: configuration, Micetro 

.. _config-files:

Location of important config and log files
==========================================

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

Windows
-------

.. TBD
