.. meta::
    :description: Installing the Micetro DHCP Agent on Windows
    :keywords: DHCP, DHCP Agent, ISC DHCP, Kea, Meraki, Cisco, Micetro, Windows
 
.. _dhcp_agents_windows:
 
Installing Micetro DHCP Agents on Windows
=========================================
 
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
    --generic-dns-controller:  Install a Generic DNS server controller.
    --isc-dhcp-controller:  Install a DHCP server controller for ISC dhcpd.
    --kea-dhcp-controller:  Install a DHCP server controller for Kea dhcp4.
    --update-controller:  Install update controller. Always installed, if another Micetro service is installed.
 
Multiple agents can be specified. If, for example, you have both ISC Kea and ISC DHCP runnning on the machine, run the installer as follows:
 
.. code-block:: bash
    
    ./install --kea-dhcp-controller --isc-dhcp-controller
 
.. note::
    If you have only a single service like BIND installed, we recommend running the installer without parameters. Then, it then uses the ``--auto`` parameter and figures out the service automatically.
 
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
 
Running Micetro DHCP Agent under a privileged user account
----------------------------------------------------------
Typically, the Micetro DHCP Agent is installed on one host in an Active Directory (AD) forest, or one copy per site. That installation can then manage all MS DHCP servers in the forest, or in the site, using Microsoft's own DHCP management API. For this to work, the service needs to run as a user that is a member of the Active Directory DHCP Administrators group.
 
 
To configure the Micetro DHCP Agent to access DHCP servers on remote computers:
 
    1. Start the Windows **Services** program and open the **Properties** dialog for the Micetro DHCP Agent.
 
    2. Click the :guilabel:`Log On` tab. The :guilabel:`Local System account` radio button is most likely selected.
 
    3. Click the :guilabel:`This account` radio button and enter the name and password of a Windows user who is a member of either the Administrators group or the DHCP Administrators group.
 
    4. Close the dialog and restart the Micetro DHCP Agent service.
 
If the Micetro DHCP Agent is run as a local system service (the default), then it will only be able to manage the MS DHCP service on the same host.
 
Where to install the Micetro DHCP Agent
---------------------------------------
If Micetro Central is installed on a Windows host, you can install the Micetro DHCP Agent on the same host. If not, then the system must be told where to find the DHCP Agent when adding a new DHCP server to the system. This will be presented as connecting via proxy.
 
However, there are other considerations when deciding where to install the Micetro DHCP Agent, such as:
 
* The Micetro communication protocol used to control a DHCP server is more efficient than the Microsoft protocol. This means that if a DHCP server is separated from Micetro Central by a slow network link, it is more efficient to install a copy of the Micetro DHCP Agent in the same local network (the same site, typically) as the DHCP server.
 
* The Micetro DHCP Agent can be used to gather lease history data for a DHCP server. However, this requires that the Micetro DHCP Agent be installed on the DHCP server machine itself. If this is done for all DHCP servers, then there's never any need to run the DHCP Agent as a privileged user --- the DHCP Agent that is only used to control the DHCP service on the same machine as itself can run as a local system service.
 
Managing Cisco IOS with DHCP support
------------------------------------
The Micetro DHCP Agent can manage Cisco IOS servers with DHCP support. There's no need to install any software on the Cisco device, but it is necessary to create a user account on the device that has the ability to telnet or SSH in. You will be asked for the username and password when adding the server.
 
When adding a Cisco IOS server to Micetro, the options are similar to those shown when adding an MS DHCP server. By default, if possible, Micetro Central will look for a copy of the DHCP Agent on the same server as itself, but you can also specify a particular installation to use as a proxy. It is recommended to use a copy of the DHCP Agent that is on the same network segment as the Cisco IOS server.
 
Managing Cisco Meraki 
---------------------
The Micetro DHCP Agent is also used to create a connection between Micetro and the Meraki dashboard, thus allowing Micetro to manage Meraki. The DHCP agent used for a Meraki connection can be run anywhere as long as it can communicate with the Dashboard API and Micetro Central can reach it. 
 
All Meraki communication uses HTTPS. Therefore, the DHCP Agent must be installed on a system with up-to-date CA certificates.
 
.. note::
    Each Micetro DHCP Agent can be used to connect to multiple Meraki organizations/environments.
