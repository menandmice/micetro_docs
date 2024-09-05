.. meta::
   :description: Setting a static value for Micetro Central in the Micetro Web Interface
   :keywords: Micetro 

.. _webapp-fixed-central:

Configuring the Web Interface to Use a fixed Micetro Central Server
===================================================================

By default, the Micetro Web Interface allows you to select the Micetro Central server for login. If you want to set a fixed Micetro Central Server for the login dialog box, follow the steps below.

Windows
-------

**To configure a fixed Server name for the Web Interface login**:

1. Edit the ``preferences.cfg`` file for the M&M Web Services located at ``c:\\ProgramData\\Men and Mice\\Web Services\\preferences.cfg``. If it doesn't exist, insert an XML-Tag for the default Micetro Central server name:

  .. code-block::

    <DefaultCentralServer value="your M&M Central DNS name or IP" />

2. Add an XML tag to set the Web Interface to use the DefaultCentralServer as a fixed server name:

  .. code-block::

    <FixedCentralServer value="1" />

3. Restart the M&M Web Services Windows service.

4. After that, the login dialog box will display the DefaultCentralServer name as "Server", which will be greyed out and uneditable.

.. tip::
  It's a good idea to clear the browser's cached cookies and reload the Web Interface page to ensure the correct data is displayed.

Linux
-----

1. Log into the server hosting the Web Interface.

2. Edit the ``preferences.cfg`` file for the M&M Web Services (``/var/mmsuite/web_services/preferences.cfg``). Add an XML tag for the default Micetro Central server name if it's missing:

  .. code-block::

    <DefaultCentralServer value="your M&M Central DNS name or IP" />

3. Add an XML tag to set the Web Interface to use the DefaultCentralServer as fixed server name:

  .. code-block::

    <FixedCentralServer value="1" />

4. Restart the ``mmws`` service:

  .. code-block:: bash

    systemctl restart mmws

.. tip::
  It's a good idea to clear the browser's cached cookies and reload the Web Interface page to ensure the correct data is displayed.
