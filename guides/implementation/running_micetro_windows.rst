.. meta::
   :description: Running and restarting Micetro components on Windows
   :keywords: Micetro, configuration, maintenance, Windows

.. _running-micetro-windows:

Running the Micetro components on Windows
=========================================
You can run Micetro Central and the Micetro agents both run as services. However, you can also control them using the Services application or with the following command line options.

Micetro Central
^^^^^^^^^^^^^^^^

.. csv-table::
  :widths: 30, 70

  "mmcentral –i", "Installs Micetro Central as a service"
  "mmcentral –u", "Uninstalls Micetro Central"
  "mmcentral –start", "Starts the Micetro Central service"
  "mmcentral –stop", "Stops the Micetro Central service"
  "mmcentral –v", "Displays version information"
  "mmcentral –h", "Displays available command line options for Micetro Central"

Micetro Agents
^^^^^^^^^^^^^^

.. csv-table::
  :widths: 30, 70

  "mmremote –i", "Installs the Micetro DNS agent as a service"
  "mmremote –u", "Uninstalls the Micetro DNS agent"
  "mmremote –start", "Starts the Micetro DNS agent service"
  "mmremote –stop", "Stops the Micetro DNS agent service"
  "mmremote –v", "Displays version information"
  "mmremote –h", "Displays available command line options for the Micetro DNS agent"
