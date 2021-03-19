.. _webapp-fixed-central:

Configure the web application to use a fixed M&M Central server
===============================================================

By default the M&M Web Application allows the user to specify, which M&M Central server is used for the login.

If you want to set a fixed M&M Central Server for the Web App Login dialog follow the steps provided below.

Steps to configure a fixed Server name for the Web Application login dialog

Edit the preferences.cfg file of the M&M Web Services (c:\ProgramData\Men and Mice\Web Services\preferences.cfg). If not already there add a XML-Tag for the default M&M Central server name:

.. code-block::
  :linenos:

  <DefaultCentralServer value="your M&M Central DNS name or IP" />

Add another XML-tag to configure the Web App to use the DefaultCentralServer as fixed server name:

.. code-block::
  :linenos:

  <FixedCentralServer value="1" />

Restart the M&M Web Services Windows service

After that the Login dialog shows the DefaultCentralServer name as "Server", greyed out and not editable anymore.

.. note::
  You might want to clear the browsers cookies that are cached and reload the Web Application site in order to get the right data displayed.
