.. _config-files:

Location of important config files, scripts, and logs
=====================================================

.. table::

=============================================================================  =======================================
Path                                                                           Information
=============================================================================  =======================================
/var/mmsuite/mmcentral/preferences.cfg                                         Men&Mice Central
                                                                               configuration file.
/var/mmsuite/dns_server_controller/preferences.cfg                             Men&Mice DNS Server Controller
                                                                               configuration file.
/etc/httpd/conf/mmweb.conf                                                     Men&Mice Web Application
                                                                               configuration file.
/etc/httpd/conf/mmws.conf                                                      Men&Mice Web Services proxy
                                                                               configuration file.
./[monitor|nodeX]/postgresql.conf                                              PostgreSQL HA cluster database
                                                                               configuration file.
./[monitor|nodeX]/pg_hba.conf                                                  Stores client authentication
                                                                               information for the database cluster.
/var/mmsuite/mmcentral/scripts/policies.toml                                   DNS Policies file.
/var/mmsuite/mmcentral/scripts/change_request_update.py                        Script to validate Change Requests
                                                                               when staged, and automatically
                                                                               updates the Status and Environment
                                                                               properties.
/var/mmsuite/mmcentral/scripts/group_deploy.py                                 Script to facilitate the Deploy
                                                                               operation for Server Groups.
/var/mmsuite/mmcentral/scripts/set_policies.py                                 Script to validate and apply the
                                                                               policies entered in policies.toml.
/var/mmsuite/dns_server_controller/server_groups/[server-group-name]/staging/  Staging server for Server Groups.
                                                                               (For out-of-band changes.)
/var/mmsuite/mmcentral.log                                                     Men&Mice Central logfile.
/var/mmsuite/dns_server_controller/logs/                                       Men&Mice DNS Server Controller logfile.
./[monitor]/pg_log/postgresql-[WeekDay].log                                    PostgreSQL HA cluster monitor logfile.
=============================================================================  =======================================
