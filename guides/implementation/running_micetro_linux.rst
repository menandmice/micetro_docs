.. meta::
    :description: Running and restarting Micetro components on Linux
    :keywords: Micetro, configuration, maintenance, Linux
 
.. _running-micetro-linux:
 
Running the Micetro components on Linux
=======================================
After installation, all Micetro components are configured as system processes available through ``systemctl``. Only use ``systemctl`` to stop, (re)start, and query the status of the components:
 
.. code-block:: bash
    
    systemctl status|start|stop|restart mmcentral
    systemctl status|start|stop|restart mmremote
 
You can set several options when starting Micetro Central (by default ``/usr/sbin/mmcentral``):
 
.. csv-table::
    :widths: 30, 70
 
    "-ll <level>", "Micetro Central sends event messages to the system log. You can change the log level for Micetro Central by using the ``–ll`` command line option when starting the daemon. Possible levels are 0--5 (the default value is 3)."
    "-p <port>", "Set port number to listen to (default ``1231``)."
    "-u <user>", "Specifies the user name or user ID that the program should run as."
    "-g <group>", "Specifies the group name or group ID that the program should run as."
    "-d <path>", "Sets the path where the data files should be located (the default path is ``/var/mmsuite/mmcentral``)."
    "-v", "Displays version information."
    "–h", "Displays available command line options for Micetro Central."
 
For example:
 
.. code-block:: bash
    
    mmcentrald -p 9876 -ll 5 -d /temp/data
