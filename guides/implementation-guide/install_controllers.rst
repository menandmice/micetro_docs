.. _install-controllers:

Men&Mice DNS Server Controllers
===============================

.. toctree::
  :maxdepth: 2
  :hidden:

  controller_loglevel
  controller_perms

.. note::
  The DNS Server Controllers need to be ran as the same user as BIND. (By default: ``named``.)
  If your environment BIND is running as a different user, or files are updated, make sure that the ``mmremote`` service is ran as the same user and has sufficient access to files and directories.


Each DNS server intended to be used as part of a server group has to run a Men&Mice Controller. (In addition to the standard DNS software such as BIND.)

Extract the Men&Mice Controller install package (as root):

.. code-block:: bash

  tar -xzvf mmsuite-controllers-9.4.2.linux.x64.tgz

In the newly created ``mmsuite-controllers-9.4.2.linux.x64`` directory run the installer script to install the Men&Mice Controller (as root):

.. code-block:: bash

  cd mmsuite-controllers-9.4.2.linux.x64 && ./install --skip-arrange

Ensure the ``named-checkconf`` file is readable:

.. code-block:: bash

  chmod a+s /usr/sbin/named-checkconf

Verify the Controller application is running:

.. code-block:: bash

  systemctl status mmremote
