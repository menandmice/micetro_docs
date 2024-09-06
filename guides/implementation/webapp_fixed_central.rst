.. meta::
   :description: Allowing Micetro Web Interface to login to other Central servers.
   :keywords: Micetro 

.. _webapp-fixed-central:

Allowing Micetro Web Interface to login to other Central servers
===================================================================

By default, the Micetro Web Interface and API only allow connecting to a single Micetro Central server, determined during the first login to Micetro after installation.

If you want to allow users to specify a custom Central server to connect to, follow the instructions below.

Windows
-------

1. Edit the ``preferences.cfg`` file for the M&M Web Services located at ``c:\\ProgramData\\Men and Mice\\Web Services\\preferences.cfg``. Add the following XML tag

  .. code-block::

    <LockToDefaultServer value="0" />

2. Restart the M&M Web Services Windows service.

3. After that, a "Server" field will appear in the Micetro Web Interface login page, and the "serverName" field in the API Login command will be honored

Linux
-----

1. Log into the server hosting the Web Interface.

2. Edit the ``preferences.cfg`` file for the M&M Web Services (``/var/mmsuite/web_services/preferences.cfg``). Add the following XML tag

  .. code-block::

    <LockToDefaultServer value="0" />

3. Restart the ``mmws`` service:

  .. code-block:: bash

    systemctl restart mmws

4. After that, a "Server" field will appear in the Micetro Web Interface login page, and the "serverName" field in the API Login command will be honored

