.. meta::
   :description: The TCP port for the updater service can be changed. It must be changed on the mmupdate service and also on Micetro Central (mmcentral). All remote servers must listen on the same TCP port for update messages from Micetro Central.
   :keywords: TCP Port, Men&Mice

.. _change-updater-port:

Changing the TCP Port for the Micetro Update Service
-----------------------------------------------------

The Micetro update service is listening by default on port ``4603/TCP``. Although the port ``4603/TCP`` is reserved for the Men&Mice Update service in the IANA database, there might be a different software already running on that port.

The TCP port for the updater service can be changed. It must be changed on the ``mmupdate`` service and also on Micetro Central (``mmcentral``). All remote servers must listen on the same TCP port for update messages from Micetro Central. It is not possible to run the Micetro Update service on different ports for different servers.

1. Stop both services, the Micetro Central service and the remote Micetro updater service.

2. On the machine running the Micetro Update service, append the following line to the Micetro Updater's ``preferences.cfg`` file (create the file if it does not exist):

.. code-block::

  <Arguments value="-p 12345" />

Where ``12345`` is the TCP port number the Men&Mice update service should use.

3. Start the Micetro Update service and check that the process in listening on the new port (using ``netstat -na`` or ``lsof -i``).

4. On the machine running the Micetro Central service, append the following line to the Micetro Central ``preferences.cfg`` file (create the file if it does not exist):

.. code-block::

  <UpdateAgentPortNumber value="12345" />

Where ``12345`` is the TCP port number the Men&Mice update service is using on the remote system(s).

5. Start the Micetro Central service.
