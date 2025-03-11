.. meta::
   :description: Download and install Micetro Central and components on Windows
   :keywords: download, install, Micetro, Windows, Central

.. _install-components-windows:

Micetro components for Windows
==============================
`Download <https://download.menandmice.com>`_ the following installer packages:

* Micetro Central: ``Micetro_Central_x64.exe``
* Micetro Agent: ``Micetro_Controllers_x64.exe``
* Micetro Web Application: ``Micetro_Web_Application_x64.exe``
* Micetro Management Console: ``Micetro_Management_Console.exe``

.. note::
  Unless noted, all applications are run as **Administrator**.

.. _install-central-windows:

Micetro Central on Windows
--------------------------
Micetro Central is the central authentication server. It also serves as the metadata storage engine, containing data such as zone history logs, user accounts and permissions, etc. You must have at least one copy of Central installed in the environment. Central does not need to be installed on a DNS server.

Installing Micetro Central does not require special privileges. The service will be started automatically after installation.

.. important::
  The installation process is designed to be fast and simple. If you want to customize your setup, such as changing the installation path for Central, be sure to follow the steps carefully.

**To install Micetro Central**:

Run the downloaded binary and follow the instructions on the screen.

.. image:: ../../images/install-windows-service.png
  :width: 60%
  :align: center
|
.. important::
  The installer creates the data directories for Micetro Central at the default location ``C:\\Program Files\\Men and Mice\\Central`` even if the installation target is on a different drive or path.

  For information about preferences/configuration files, refer to :ref:`config-files-windows`.

Running Micetro Central under a privileged user account
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Running Central as a specific service account affects a few functions when it talks to the Active Directory, such as Integrated Security communications with an SQL server database, communications with AD Sites and Services, authentication of AD users, and ability to ping.

When creating a service account for Central, make sure the user is in the local "administrators" group on the Central machine. Otherwise, it will not be able to utilize the ping functionality.

To be able to manage data, the service account running Central needs to be added to the DNS Admins and/or DHCP Admins group.

.. _cloud-prereqs-windows:

Setting up cloud services
-------------------------
For IP Address Management (IPAM), Micetro connects with cloud services through Micetro Central. DNS management requires the Micetro DNS Agent and DHCP management requires the Micetro DHCP Agent. Before proceeding with any actions involving Micetro and cloud services, two critical prerequisites must be met:

1. **DNS/DHCP Agent Installation and Setup**:

   The Micetro Agent must be installed on the machine where Micetro Central is running. For instructions on installing Micetro Agents, refer to the following pages:
         
         * DNS Agent: :ref:`dns-agent-windows`
         * DHCP Agent: :ref:`dhcp_agents_windows`

2. **Network Connectivity**:

   * Make sure the machine hosting Micetro Central can connect to the designated cloud instance.
   * The connection must be made through port ``443/TCP``, which is reserved for secure communication.
   * For detailed networking requirements, refer to :ref:`networking-requirements`.

If you intend to add multiple AWS cloud accounts using a single set of credentials, refer to :ref:`aws-multi-account`.

After these prerequisites are met, you can integrate cloud services with Micetro. Refer to :ref:`cloud` for instructions.
