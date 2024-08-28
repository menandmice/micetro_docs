.. meta::
   :description: How to install Micetro Central, the server component for Micetro
   :keywords: Micetro, Micetro Central, server, installation, how to

.. _install-central:

Micetro Central
================

Micetro Central is the central authentication server. It also serves as the meta-data storage engine, containing data such as zone history logs, user accounts and permissions, etc. You must have at least one copy of Central installed in the environment. Central does not need to be installed on a DNS server.

.. _central-non-standard-install:

.. important::
  The installer was designed to be quick and straightforward. Pay attention to the steps, if you'd like to customize your installation. (Such as installing Central to a different path.)

.. _install-central-linux:

Micetro Central on Linux
-------------------------

.. note::
  Before installing Men&Mice Central, decide the following:

  * What user account will own the Men&Mice Central process?

  * Where do you want everything stored? There are defaults provided.

Extract and run the Men&Mice Central install package:

.. code-block::

  tar -xzvf micetro-central-10.3.5.linux.x64.tgz
  cd micetro-central-10.3.5.linux.x64
  ./install

After installation has finished, check for running mmcentral:
.. code-block::

  systemctl status mmcentral
  


Removing Micetro Central
^^^^^^^^^^^^^^^^^^^^^^^^^

Installing Micetro Central puts the following files on your system:

.. csv-table::
  :header: "Description", "File(s) or directory"
  :widths: 30, 70

  "Micetro Central daemon", "mmcentrald, usually in /usr/sbin or /usr/local/sbin"
  "Data directory for Micetro Central", "Usually /var/mmsuite/mmcentral"
  "Update directory", "update, located in the data directory"
  "Preferences file", "preferences.cfg, located in the data directory"
  "init script, the shell script that can be used to control the service; used by init during system startup", "/etc/init.d/mmcentral"
  "settings file used by the init script (Ubuntu Linux only)", "/etc/default/mmcentral"

To remove Micetro Central, first use the init script to stop the service (give it the "stop" argument). Then simply delete the daemon and the init script, and remove any references to the init script in the rest of the boot system if necessary. Also delete the data directory if desired.

Micetro Central configuration files on Linux
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

See :ref:`config-linux`.

.. _install-central-windows:

Micetro Central on Windows
---------------------------

Run the downloaded binary and follow the instructions on-screen.

.. note::
  Installing Micetro Central does not require special privileges. The service will be started automatically after installation.

.. image:: ../../images/install-windows-service.png
  :width: 60%
  :align: center
|
.. note:: Running Men&Mice Central under a privileged user account
  Running Central as a specific service account affects a few functions when it talks to the Active Directory, such as Integrated Security communications with an SQL server database, communications with AD Sites and Services, authentication of AD users, and ability to ping.

  When creating a service account for Central, make sure the user is in the local "administrators" group on the Central machine. Otherwise it will not be able to utilize the ping functionality.

  The service account running Central needs to be added to the DNS Admins and/or DHCP Admins group to manage data.

.. important::
  The installer creates the data directories for Men&Mice Central at the default location (C:\\Program Files\\Men and Mice\\Central) even if the installation target is on a different drive or path. See :ref:`config-files-windows`.

Micetro Central configuration files on Windows
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

See :ref:`config-windows`.
