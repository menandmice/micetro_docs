.. _soap-api:

SOAP API for Micetro
--------------------

Introduction
^^^^^^^^^^^^

The SOAP interface was introduced in Version 6.2 of the (then) Men&Mice Suite. The web service allows administrators and software developers to create custom scripts and applications on top of Micetro to manage DNS, DHCP and IP address infrastructures of all sizes. Most features available in Micetro are available through the web service interface.

The web service can be used to perform tasks such as:

* Configure and work with Bind, Microsoft and Unbound DNS servers,

* work with DNS zones and records,

* configure ISC and Microsoft DHCP servers,

* work with DHCP scopes, pools and reservations,

* IP address management (IPAM),

* and much more.

SOAP API documentation
^^^^^^^^^^^^^^^^^^^^^^

The SOAP command reference can be viewed online on `http://api.menandmice.com/`_.

.. tip::
  Documentation for the REST API is bundled with the Web Application, and can be viewed on ``http(s)://micetro.yourdomain.tld/mmws/wsdldoc`` where *micetro.yourdomain.tld* is the url for the Web Application.

  If Men&Mice Central is running on a different server from the Web Application, the url to use is ``http(s)://micetro.yourdomain.tld/mmws/wsdldoc?server=your.central.server.com``.
