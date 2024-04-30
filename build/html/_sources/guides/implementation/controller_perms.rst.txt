.. meta::
   :description: Fixing missing permissions on the Men&Mice DNS Server controller
   :keywords: named.conf, Micetro, Men&Mice DNS Server Controller, BIND, troubleshooting, permissions 

.. _controller-perms:

Setting up permissions for DNS Server Controller
------------------------------------------------

.. note::
  The Men&Mice DNS Server Controller relies on the BIND tool ``named-checkconf`` to verify if the BIND configuration file named.conf is valid. The button for editing advanced BIND options in the interface may be unavailable or report read-only configuration if ``named-checkconf`` is not found on any of the standard directories during installation. (Or if the installation is inside a chroot.)

To prevent this, make sure ``named-checkconf`` is executable, and edit the Controller’s configuration file (``/var/named/mmsuite/preferences.cfg``) to include the following lines:

.. code-block::

  <fingerprint value="<some-hex-values>"/> <named-checkconf value="/usr/sbin/named-checkconf"/>

Restart the DNS Server Controller process:

.. code-block:: bash

  systemctl restart mmremote
