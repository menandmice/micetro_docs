.. meta::
   :description: How to increase proxy timeout for the Micetro Web Interface
   :keywords: Micetro, proxy timeout

.. _webserver-proxy-timeout:

Increase Timeout for Webserver Proxy
====================================

To ensure that the Web Interface operates efficiently with larger change request queues that take longer to process by Central, modify the ``/etc/httpd/conf`` file and increase the mmws proxy timeout value:

.. code-block::

  ProxyTimeOut 60
