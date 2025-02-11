.. meta::
   :description: The Micetro DNS Agent relies on the BIND tool named-checkconf to verify if the BIND configuration is valid.
   :keywords: Bind, DNS server, Micetro, named.conf 

.. _named.conf-location:

named.conf validation
=====================

The Micetro DNS Agent (``mmremote``) relies on the BIND tool ``named-checkconf`` to verify if the BIND configuration ``named.conf`` is valid.

If the ``named-checkconf`` is not found on any of the standard directories during installation (or if the installation is inside a CHROOT), the :guilabel:`Advanced` button is not shown.

To fix this, add a configuration parameter pointing to the ``named-checkconf`` tool to the DNS Agent configuration file ``preferences.cfg`` (usually in ``/var/named/mmsuite/preferences.cfg``).

.. code-block::

  <fingerprint value="<some-hex-values>"/>
  <named-checkconf value="/usr/sbin/named-checkconf"/>

Make sure that the ``named-checkconf`` tool is executable and reachable for the DNS Agent (if the DNS Agent is inside a CHROOT environment, the ``named-checkconf`` must also be inside that CHROOT as well as all dynamic libraries needed).

.. note::
  After changing the configuration file for the DNS Agent, the DNS Agent process (``mmremoted``) must be started.
