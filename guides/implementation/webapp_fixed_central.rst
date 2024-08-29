.. meta::
   :description: Setting a static value for Micetro Central in Micetro
   :keywords: Micetro 

.. _webapp-fixed-central:

Configuring the Web Intervace to use a fixed Micetro Central Server
===================================================================

By default Micetro allows you to specify, which Micetro Central server is used for the login.

If you want to set a fixed Micetro Central Server for the Web Interface Login dialog box, follow the steps provided below.

Windows
-------

Configuring a Fixed Server Name for the Web Interface Login DialogBox
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Edit the preferences.cfg file of the Micetro Web Services (c:\\ProgramData\\Men and Mice\\Web Services\\preferences.cfg). If not already there add a XML-Tag for the default M&M Central server name:

.. code-block::

  <DefaultCentralServer value="your Micetro Central DNS name or IP" />

2. Add another XML-tag to configure the Web App to use the DefaultCentralServer as fixed server name:

.. code-block::

  <FixedCentralServer value="1" />

3. Restart the M&M Web Services Windows service

4. After that the Login dialog shows the DefaultCentralServer name as "Server", greyed out and not editable anymore.

.. tip::
  You might want to clear the browsers cookies that are cached and reload the Web Interface site in order to get the right data displayed.

Linux
-----

1. Log in to the server running the web interface.

2. Edit the preferences.cfg file of the M&M Web Services (/var/mmsuite/web_services/preferences.cfg). If not already there add a XML-Tag for the default Micetro Central server name:

.. code-block::

  <DefaultCentralServer value="your Micetro Central DNS name or IP" />

3. Add another XML-tag to configure the Web App to use the DefaultCentralServer as fixed server name:

.. code-block::

  <FixedCentralServer value="1" />

4. Restart the ``mmws`` service:

.. code-block:: bash

  systemctl restart mmws

.. tip::
  You might want to clear the browsers cookies that are cached and reload the Web Application site in order to get the right data displayed.
