.. meta::
   :description: Running and restarting Micetro components
   :keywords: Micetro, maintenance

.. _running-micetro:

Running the Micetro Components (Central, Agents)
================================================

.. _running-micetro-windows:

Windows
-------

Micetro Central
^^^^^^^^^^^^^^^^

Micetro Central runs as a service and you can start and stop Micetro Central using the Services application. You can also control Micetro Central using these command line options:

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

The Micetro DNS agent runs as a service and you can start and stop the agent using the Services application. You can also control the Micetro DNS agent using these command line options:

.. csv-table::
  widths: 30, 70

  "mmremote –i", "Installs the Micetro DNS agent as a service"
  "mmremote –u", "Uninstalls the Micetro DNS agent"
  "mmremote –start", "Starts the Micetro DNS agent service"
  "mmremote –stop", "Stops the Micetro DNS agent service"
  "mmremote –v", "Displays version information"
  "mmremote –h", "Displays available command line options for the Micetro DNS agent"

----

.. _running-micetro-unix:

Linux
-----

After installation, all Micetro components are configured as system processes available through ``systemctl``. Only use ``systemctl`` to stop, (re)start, and query the status of the components:

.. code-block:: bash

  systemctl status|start|stop|restart mmcentral
  systemctl status|start|stop|restart mmremote

You can set several options when starting Micetro Central (by default ``/usr/sbin/mmcentral``):

.. csv-table::
  :widths: 30, 70

  "-ll <level>", "Micetro Central sends event messages to the system log. You can change the log level for Micetro Central by using the –ll command-line option when starting the daemon. Possible levels are 0 - 5 (the default value is 3)"
  "-p <port>", "Set port number to listen to (default 1231)"
  "-u <user>", "Specifies the user name or user id that the program should run as"
  "-g <group>", "Specifies the group name or group id that the program should run as"
  "-d <path>", "Sets the path where the data files should be located (the default path is /var/mmsuite/mmcentral)"
  "-v", "Displays version information"
  "–h", "Displays available command line options for Micetro Central"

For example:

.. code-block:: bash

  mmcentrald -p 9876 -ll 5 -d /temp/data
