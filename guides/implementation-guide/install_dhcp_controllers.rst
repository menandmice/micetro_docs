.. _install-dhcp-controllers:

Men&Mice DHCP Server Controllers
===============================

Men & Mice DHCP Server Controller is the DHCP server agent. It sits on each DHCP server machine (or in case of the MS DHCP Server Controller, on any machine in the network) and manages the DHCP service on your behalf.

.. toctree::
  :maxdepth: 2
  :hidden:

  controller_loglevel
  controller_perms

Installing Men & Mice DHCP Server Controller is typically quite straightforward, with far fewer considerations than Men & Mice DNS Server Controller.

By default, when executed the controller installer tries to figure out the installed service (e.g. BIND) automatically and will try to install it without further user input.

In case it can't install the service it will print out hints and further information.

If the machine has multiple services installed, like ISC DHCP and ISC BIND DNS you want to specify explicitly the Men & Mice Controllers that should be installed.

To get the list of available controllers/parameters just run the installer script with the --help parameter:

  .. code-block:: bash

    cd archive-name
    ./install --help
    Men & Mice server controller installer.
    --help:  Print help.
    --quiet:  Suppress output during install.
    --auto:  Automatically determine what controllers to install. Default if no other option is given.
    --bind-dns-controller:  Install a DNS server controller for BIND.
    --unbound-dns-controller:  Install a DNS server controller for Unbound.
    --generic-dns-controller:  Install a Generic DNS server controller.
    --isc-dhcp-controller:  Install a DHCP server controller for ISC dhcpd.
    --kea-dhcp-controller:  Install a DHCP server controller for Kea dhcp4.
    --update-controller:  Install update controller. Always installed, if another Men & Mice service is installed.

Multiple controllers can be specified. If you have for instance both ISC Kea and ISC DHCP runnning on the machine just run the installer as follows:

.. code-block:: bash

  ./install --kea-dhcp-controller --isc-dhcp-controller

.. information::
  If you have only a single service like BIND or Unbound installed we recommend to run the installer without parameter. It will then use the --auto parameter and figure out the service automatically.

Quiet/unattended installation is possible with the --quiet parameter (no output at all):

.. code-block:: bash

  ./install --isc-dhcp-controller --quiet

.. note::
  The Men & Mice Update Controller always gets automatically added to the list when another M&M service is installed, e.g. in the above listed example the --update-controller gets added automatically.

If you run into issues with the new installer, the old interactive Perl based installer is still present in the same archive as:

.. code-block::

  deprecated_installer.pl

To execute the deprecated installer for the Men & Mice Controllers please run it as follows:

.. code-block:: bash

  cd archive-name
  ./deprecated_installer

The installer will ask a series of questions. Be prepared to answer them, as indicated below for each component.

.. note::
  The Kea DHCP4 Controller can not be installed by the deprecated installer.

Men&Mice Central running on Linux
---------------------------------

Here are the questions asked by the installer that pertain to Men & Mice DHCP Server Controller:

* Do you want to install the Men & Mice DHCP Server Controller?
* Where is the DHCP server configuration file?
* Where is the DHCP server lease file?
* Where do you want the Men & Mice DHCP Server Controller to keep its configuration files?
* Enter the user and group names under which you want to run the Men & Mice DHCP Server Controller. This must be the user which is running dhcpd.
* Where do you want to install the Men & Mice Server Controller binaries?

Managing Cisco IOS with DHCP support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Men & Mice DHCP Server Controller can also manage Cisco IOS servers with DHCP support. There is no need to install any software on the Cisco device, but it is necessary to create a user account on the device that has the ability to telnet or SSH in. You will be asked for the username and password when adding the server.

When adding a Cisco IOS server to Men & Mice Suite, the options are very similar to those shown when adding an MS DHCP server; by default, if possible, Men & Mice Central will look for a copy of the DHCP Server Controller on the same server as itself, but you can also specify a particular installation to use as a proxy. It is recommended to use a copy of the DHCP Server Controller that is on the same network segment as the Cisco IOS server.

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

Proceed to :ref:`installing the Web Application <install-webui>`.

Men&Mice Central running on Windows
-----------------------------------

Running Men & Mice DHCP Server Controller under a privileged user account / Server type: Microsoft Agent-Free
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Normally, Men & Mice DHCP Server Controller is installed on one host in an Active Directory forest, or one copy per site. That installation can then manage all MS DHCP servers in the forest, or in the site, using Microsoft's own DHCP management API. In order for this to work, the service needs to run as a user that is a member of the Active Directory DHCP Administrators group.

Please note that for the management of the DHCP failover in Windows Server 2012 R2 the service account must also be a member of the local Administrators group of the DHCP servers in order to be able to fetch/manage the failover configuration.

To configure Men & Mice DHCP Server Controller to access DHCP servers on remote computers, do the following:

  1. Start the Windows "Services" program and open the properties dialog box for Men & Mice DHCP Server Controller.
  2. Click the Log On tab. The Local System account radio button is most likely selected.
  3. Click the This account radio button and enter the name and password of a Windows user that is a member of either the Administrators group or the DHCP Administrators group.
  4. Close the dialog box and restart the Men & Mice DHCP Server Controller service.

If Men & Mice DHCP Server Controller is run as a local system service (the default), then it will only be able to manage the MS DHCP service on the same host.

Where to install Men & Mice DHCP Server Controller
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If Men & Mice Central is installed on a Windows host, then one option is to install Men & Mice DHCP Server Controller on the same host. If this is not done, then the system will need to be told where to find the DHCP Server Controller when adding a new DHCP server to the system. This will be presented as connecting via proxy.

However, there are other considerations when deciding where to install Men & Mice DHCP Server Controller.

* The Men & Mice communication protocol used to control a DHCP server is more efficient than the Microsoft protocol. This means that if a DHCP server is separated from Men & Mice Central by a slow network link, it is more efficient to install a copy of the Men & Mice DHCP Server Controller in the same local network (the same site, typically) as the DHCP server.
* Starting in Men & Mice Suite 6.0, Men & Mice DHCP Server Controller can be used to gather lease history data for a DHCP server. However, this requires that the Men & Mice DHCP Server Controller be installed on the DHCP server machine itself. If this is done for all DHCP servers, then there is never any need to run the DHCP Server Controller as a privileged user - the DHCP Server Controller that is only used to control the DHCP service on the same machine as itself can run as a local system service.

Managing Cisco IOS with DHCP Support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Men & Mice DHCP Server Controller can also manage Cisco IOS servers with DHCP support. There is no need to install any software on the Cisco device, but it is necessary to create a user account on the device that has the ability to telnet or SSH in. You will be asked for the username and password when adding the server.

When adding a Cisco IOS server to Men & Mice Suite, the options are very similar to those shown when adding an MS DHCP server; by default, if possible, Men & Mice Central will look for a copy of the DHCP Server Controller on the same server as itself, but you can also specify a particular installation to use as a proxy. It is recommended to use a copy of the DHCP Server Controller that is on the same network segment as the Cisco IOS server.

Proceed to :ref:`installing the Web Application <install-webui>`.
