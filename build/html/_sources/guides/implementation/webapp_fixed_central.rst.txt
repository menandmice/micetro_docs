.. meta::
   :description: Setting a static value for Men&Mice Central in the Men&Mice Web Application
   :keywords: Micetro 

.. _webapp-fixed-central:

Configure the web application to use a fixed M&M Central server
===============================================================

By default the M&M Web Application allows the user to specify, which M&M Central server is used for the login.

If you want to set a fixed M&M Central Server for the Web App Login dialog follow the steps provided below.

Windows
-------

Steps to configure a fixed Server name for the Web Application login dialog
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Edit the preferences.cfg file of the M&M Web Services (c:\\ProgramData\\Men and Mice\\Web Services\\preferences.cfg). If not already there add a XML-Tag for the default M&M Central server name:

.. code-block::

  <DefaultCentralServer value="your M&M Central DNS name or IP" />

2. Add another XML-tag to configure the Web App to use the DefaultCentralServer as fixed server name:

.. code-block::

  <FixedCentralServer value="1" />

3. Restart the M&M Web Services Windows service

4. After that the Login dialog shows the DefaultCentralServer name as "Server", greyed out and not editable anymore.

.. tip::
  You might want to clear the browsers cookies that are cached and reload the Web Application site in order to get the right data displayed.

Linux
-----

1. Log in to the server running the web application.

2. Edit the preferences.cfg file of the M&M Web Services (/var/mmsuite/web_services/preferences.cfg). If not already there add a XML-Tag for the default M&M Central server name:

.. code-block::

  <DefaultCentralServer value="your M&M Central DNS name or IP" />

3. Add another XML-tag to configure the Web App to use the DefaultCentralServer as fixed server name:

.. code-block::

  <FixedCentralServer value="1" />

4. Restart the ``mmws`` service:

.. code-block:: bash

  systemctl restart mmws

.. tip::
  You might want to clear the browsers cookies that are cached and reload the Web Application site in order to get the right data displayed.
