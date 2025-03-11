.. meta::
   :description: Download and install Micetro Central and components on Linux
   :keywords: download, install, Micetro, Linux, Central

.. _install-components-linux:

Micetro components for Linux
============================
.. important::
  All Micetro non-Windows components (Central, Micetro Agents, and the Web Application) require Python (version 3 or above) to be installed on the target server.

`Download <https://download.menandmice.com>`_ the following installer packages:

* Micetro Central: ``micetro-central.linux.x64.tgz``
* Micetro Agent: ``micetro-controllers.linux.x64.tgz``
* Micetro Web Application: ``micetro-web.linux.x64.tgz``
* Micetro AuthServe Agent: ``mm-authserve-agent.tar.gz``

.. note::
  Unless noted, all commands are run as *root*.

.. _install-central-linux:

Micetro Central on Linux
========================
Micetro Central is the central authentication server. It also serves as the metadata storage engine, containing data such as zone history logs, user accounts and permissions, etc. You must have at least one copy of Central installed in the environment. Central does not need to be installed on a DNS server.

.. note::
  Before installing Micetro Central, decide the following:

  * What user account will own the Micetro Central process?

  * Where do you want everything stored? There are defaults provided.

.. important::
  The installation process is designed to be fast and simple. If you want to customize your setup, such as changing the installation path for Central, be sure to follow the steps carefully.

**To install Micetro Central**:

Extract and run the Micetro Central installation package:

.. code-block::

  tar -xzvf micetro-central-10.3.5.linux.x64.tgz
  cd micetro-central-10.3.5.linux.x64
  ./install

After installation has finished, check for running ``mmcentral``:

.. code-block::

  systemctl status mmcentral
  
Installing Micetro Central puts the following files on your system:

.. csv-table::
  :header: "Description", "File(s) or directory"
  :widths: 30, 70

  "Micetro Central daemon", "mmcentrald, usually in /usr/sbin or /usr/local/sbin"
  "Data directory for Micetro Central", "Usually /var/mmsuite/mmcentral"
  "Update directory", "update, located in the data directory"
  "Preferences file", "preferences.cfg, located in the data directory"
  "init script, [1]_", "/etc/init.d/mmcentral"
  "Settings file used by the init script (Ubuntu Linux only)", "/etc/default/mmcentral"

.. [1] The shell script that can be used to control the service. Used by init during system startup.

For information on preferences/configuration files, refer to :ref:`config-files-linux`.

Removing Micetro Central
------------------------
To remove Micetro Central:

1. Use the init script to stop the service (give it the "stop" argument).

2. Delete the daemon and the init script.

3. Remove any references to the init script in the rest of the boot system, if necessary.

4. (Optional). You can also delete the data directory.

.. _cloud-prereqs-linux:

Setting up cloud services
-------------------------
For IP Address Management (IPAM), Micetro connects with cloud services through Micetro Central. DNS management requires the Micetro DNS Agent and DHCP management requires the Micetro DHCP Agent. Before proceeding with any actions involving Micetro and cloud services, two critical prerequisites must be met:

1. **DNS/DHCP Agent Installation and Setup**:

   The Micetro Agent must be installed on the machine where Micetro Central is running. For instructions on installing Micetro Agents, refer to the following pages:
         
         * DNS Agent: :ref:`dns-agent-linux`
         * DHCP Agent: :ref:`dhcp_agents_linux`

2. **Network Connectivity**:

   * Make sure the machine hosting Micetro Central can connect to the designated cloud instance.
   * The connection must be made through port ``443/TCP``, which is reserved for secure communication.
   * For detailed networking requirements, refer to :ref:`networking-requirements`.

If you intend to add multiple AWS cloud accounts using a single set of credentials, refer to :ref:`aws-multi-account`.

After these prerequisites are met, you can integrate cloud services with Micetro. Refer to :ref:`cloud` for instructions.
