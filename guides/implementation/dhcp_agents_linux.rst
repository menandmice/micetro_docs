.. meta::
   :description: Installing the Micetro DHCP Agent on Linux
   :keywords: DHCP, DHCP Agent, ISC DHCP, Kea, Micetro, Linux

.. _dhcp_agents_linux:

Installing Micetro DHCP Agents on Linux
=======================================

.. note::
  For a list of compatible DHCP servers, see :ref:`adding-dhcp`.

Micetro DHCP Agent is the DHCP server agent. It sits on each DHCP server machine (or, in environments using MS DHCP or ISC Kea servers, on any machine in the network) and manages the DHCP service on your behalf.

Installing Micetro DHCP Agent is typically quite straightforward, with far fewer considerations than the Micetro DNS Agent. By default, when installation is executed, the agent installer tries to figure out the installed service (e.g., BIND) automatically and attempts to install it without further user input. If the installer cannot install the service, it prints out hints and further information.

If the machine has multiple services installed, like ISC DHCP and ISC BIND DNS, you must specify explicitly the Micetro Agents that should be installed.

To retrieve the list of available agents/parameters, run the installer script with the ``--help`` parameter:

  .. code-block:: bash

    cd archive-name
    ./install --help
    Micetro server controller installer.
    --help:  Print help.
    --quiet:  Suppress output during install.
    --auto:  Automatically determine what controllers to install. Default if no other option is given.
    --bind-dns-controller:  Install a DNS server controller for BIND.
    --unbound-dns-controller:  Install a DNS server controller for Unbound.
    --generic-dns-controller:  Install a Generic DNS server controller.
    --isc-dhcp-controller:  Install a DHCP server controller for ISC dhcpd.
    --kea-dhcp-controller:  Install a DHCP server controller for Kea dhcp4.
    --update-controller:  Install update controller. Always installed, if another Micetro service is installed.

Multiple agents can be specified. If, for example, you have both ISC Kea and ISC DHCP runnning on the machine, run the installer as follows:

.. code-block:: bash

  ./install --kea-dhcp-controller --isc-dhcp-controller

.. note::
  If you have only a single service like BIND or Unbound installed, we recommend running the installer without parameters. Then, it then uses the ``--auto`` parameter and figures out the service automatically.

Quiet/unattended installation is possible with the ``--quiet`` parameter (no output at all):

.. code-block:: bash

  ./install --isc-dhcp-controller --quiet

.. note::
  The Micetro Update Agent is always automatically added to the list when another Micetro service is installed, e.g., in the above listed example the ``--update-controller`` is added automatically.

If you run into issues with the new installer, the old interactive Perl-based installer is still present in the same archive:

.. code-block::

  deprecated_installer.pl

To execute the deprecated installer for the Micetro Agents, please run it as follows:

.. code-block:: bash

  cd archive-name
  ./deprecated_installer

The installer will ask a series of questions. Be prepared to answer them, as indicated below, for each component.

.. note::
  The Kea DHCPv4 Agent cannot be installed by the deprecated installer.

Installer questions
-------------------
The installer asks the following questions, which pertain to the Micetro DHCP Agent:

* Do you want to install the Micetro DHCP Agent?

* Where is the DHCP server configuration file?

* Where is the DHCP server lease file?

* Where do you want the Micetro DHCP Agent to keep its configuration files?

* Enter the user and group names under which you want to run the Micetro DHCP Agent. This must be the user which is running ``dhcpd``.

* Where do you want to install the Micetro Agent binaries?

Managing Cisco IOS with DHCP support
------------------------------------
Micetro DHCP Agent can also manage Cisco IOS servers with DHCP support. There's no need to install any software on the Cisco device, but it is necessary to create a user account on the device that has the ability to telnet or SSH in. You will be asked for the username and password when adding the server.

When adding a Cisco IOS server to Micetro, the options are similar to those shown when adding an MS DHCP server. By default, if possible, Micetro Central will look for a copy of the DHCP Agent on the same server it is hosted on, but you can also specify a particular installation to use as a proxy. It is recommended to use a copy of the DHCP Agent that is on the same network segment as the Cisco IOS server.

1. Extract the Micetro Agent install package (as root):

.. code-block:: bash

  tar -xzvf mmsuite-controllers-10.0.linux.x64.tgz

2. In the newly created ``mmsuite-controllers-10.0.linux.x64`` directory run the installer script to install the Micetro Agent (as root):

.. code-block:: bash

  cd mmsuite-controllers-10.1.linux.x64 && ./install 

3. Ensure the ``named-checkconf`` file is readable:

.. code-block:: bash

  chmod a+s /usr/sbin/named-checkconf

4. Verify the Agent application is running:

.. code-block:: bash

  systemctl status mmremote
