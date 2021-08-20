.. meta::
   :description: Release notes for Micetro by Men&Mice 10.0.x versions
   :keywords: Micetro, release notes, releases, update notes

.. _release-notes:

Release notes
=============

.. note::
  All upcoming major releases are supported for 2 years.

Jump to: 

10.0.4
------

*Date*

* Multiline TXT records for zones hosted on Dyn are parsed correctly again.

* Communicating with Azure will properly handle limits and no longer throttle the service.

* The Men&Mice Web Services component will correctly read the configuration information from the preferences file, including logging.

* Adding or editing large SPF records to Azure and AWS no longer produces errors.

* Added an additional check when syncing cloud accounts to prevent Micetro from clearing the zones from the database when getting intermittent empty zone list responses.

* History entries are created as expected when external subnets are added by synchronization.

