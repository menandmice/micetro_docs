.. meta::
   :description: The TCP port for the Update Agent can be changed. It must be changed on the mmupdate service and also on Micetro Central (mmcentral). All remote servers must listen on the same TCP port for update messages from Micetro Central.
   :keywords: TCP Port, Micetro, Update Agent

.. _change-updater-port:

Changing the TCP Port for the Micetro Update Agent
--------------------------------------------------

The Micetro Update Agent is listening by default on port ``4603/TCP``. Although the port ``4603/TCP`` is reserved for the Update Agent in the IANA database, there might be a different software already running on that port.

The TCP port for the Update Agent can be changed. It must be changed on the ``mmupdate`` service and also on Micetro Central (``mmcentral``). All remote servers must listen on the same TCP port for update messages from Micetro Central. It is not possible to run the Update Agent on different ports for different servers.

1. Stop both services, Micetro Central and the remote Update Agent.

2. On the machine running the Update Agent, append the following line to the Update Agent's ``preferences.cfg`` file (create the file if it does not exist):

.. code-block::

  <Arguments value="-p 12345" />

Where ``12345`` is the TCP port number the Update Agent should use.

3. Start the Update Agent and check that the process in listening on the new port (using ``netstat -na`` or ``lsof -i``).

4. On the machine running Micetro Central, append the following line to the Micetro Central ``preferences.cfg`` file (create the file if it does not exist):

.. code-block::

  <UpdateAgentPortNumber value="12345" />

Where ``12345`` is the TCP port number the Update Agent is using on the remote system(s).

5. Start Micetro Central.
