.. meta::
   :description: Configuring logging for Men&Mice Central
   :keywords: logging, Micetro, troubleshooting

.. _central-logging:

Enable logging for Central
==========================

.. important::
  Logging is not enabled by default.

  To help troubleshooting, it is highly recommended to enable logging for Men&Mice Central and all Server Controllers. (See :ref:`controller-logging`.)

After logging in to the :ref:`first-login` in the Management Console, navigate to :menuselection:`Tools --> System Settings --> Advanced`` and locate the log file settings. (You can use the :guilabel:`Quick Filter` to narrow the options.)

Define the logfile’s location (e.g. ``/var/mmsuite/mmcentral.log`` for Linux) and in ‘*Logging Level for Men&Mice Central*’ set the value.

.. note::
  Men&Mice recommend setting the loglevel to **5** for troubleshooting. Consult the Customer Care team to determine the best loglevel for your environment.
