.. _webserver-proxy-timeout:

Increase timeout for webserver proxy
====================================

To ensure that the Web Application works smoothly with larger change request queues (that take longer to process by Central) modify ``/etc/httpd/conf`` and increase the mmws proxy timeout value:

.. code-block::

  ProxyTimeOut 60
