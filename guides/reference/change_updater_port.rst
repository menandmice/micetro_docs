.. meta::
   :description: The TCP port for the updater service can be changed. It must be changed on the ``mmupdate`` service and also on Men&Mice Central (``mmcentral``). All remote servers must listen on the same TCP port for update messages from Men&Mice Central.
   :keywords: TCP Port, Men&Mice

.. _change-updater-port:

Changing the TCP port for the Men&Mice Update Service
-------------------------------------------------------

The Men&Mice update service is listening by default on port ``4603/TCP``. Although the port ``4603/TCP`` is reserved for the Men&Mice Update service in the IANA database, there might be a different software already running on that port.

The TCP port for the updater service can be changed. It must be changed on the ``mmupdate`` service and also on Men&Mice Central (``mmcentral``). All remote servers must listen on the same TCP port for update messages from Men&Mice Central. It is not possible to run the Men&Mice Update service on different ports for different servers.

1. Stop both services, the Men&Mice Central service and the remote Men&Mice updater service.

2. On the machine running the Men&Mice Update service, append the following line to the Men&Mice Updater's ``preferences.cfg`` file (create the file if it does not exist):

.. code-block::
  :linenos:

  <Arguments value="-p 12345" />

Where ``12345`` is the TCP port number the Men&Mice update service should use.

3. Start the Men&Mice Update service and check that the process in listening on the new port (using ``netstat -na`` or ``lsof -i``).

4. On the machine running the Men&Mice Central service, append the following line to the Men&Mice Central ``preferences.cfg`` file (create the file if it does not exist):

.. code-block::
  :linenos:

  <UpdateAgentPortNumber value="12345" />

Where ``12345`` is the TCP port number the Men&Mice update service is using on the remote system(s).

5. Start the Men&Mice Central service.
