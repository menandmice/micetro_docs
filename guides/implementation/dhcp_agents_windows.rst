.. meta::
    :description: Installing the Micetro DHCP Agent on Windows
    :keywords: DHCP, DHCP Agent, ISC DHCP, Kea, Meraki, Cisco, Micetro, Windows
 
.. _dhcp_agents_windows:
 
Installing Micetro DHCP Agents on Windows
=========================================
 
.. note::
    For a list of compatible DHCP servers, refer to :ref:`adding-dhcp`.

Micetro DHCP Agent is the DHCP server agent. It sits on each DHCP server machine (or, in environments using MS DHCP or ISC Kea servers, on any machine in the network) and manages the DHCP service on your behalf.

The Micetro components for Windows are provided as ``exe`` files/executables consisting of multiple MSI components. The executeable must be installed as **Windows Administrator** (right-click on the ``exe`` file and select :guilabel:`Run as Administrator`). This extracts the MSI and starts the MSI installer.

The Micetro Agent installer for Windows contains three agents:

* DNS agent (Windows service name: ``Men and Mice DNS Server Controller``)
* DHCP agent (Windows service name: ``Men and Mice DHCP Server Controller``)
* Update agent (Windows service name: ``Men and Mice Updater``)

You can install all components, i.e., all three agents, or select a custom installation, which allows you to select which agent you want to install. 

.. note::
    The Update Agent must be installed. For example, when you install the :ref:`DNS Agent<dns-agent-windows>`, install the Update Agent at the same time. Otherwise, Micetro will not be able to automatically update.

You can also run the installer executable as **Windows Administrator** in silent install mode. To do so, run silent install mode with the following parameters:

* A full installation, including the DNS Agent, DHCP Agent, and Update Agent: 

  .. code-block::
    
    Micetro_Controllers_x64_<version>.exe /s /v"/qn /L*V C:\temp\controllerInstall.log REBOOT=ReallySuppress ADDLOCAL=DHCP,DNS,Update"

* A full installation, including the DNS Agent, DHCP Agent, and Update Agent, with ``runas.exe`` administrator in a Windows command:

  .. note::
    The ``c:\temp`` directory for the ``controllerInstall.log`` file must be created before executing the installation.

  .. code-block::

    runas.exe /user:administrator "Micetro_Controllers_x64_11.0.4.exe /s /v\"/qn /L*V C:\temp\controllerInstall.log REBOOT=ReallySuppress ADDLOCAL=DHCP,DNS,Update\""

  Enter the password for administrator:

  .. code-block::
    
    Attempting to start Micetro_Controllers_x64_25.1.2.exe /s /v"/qn /LV C:\temp\controllerInstall.log REBOOT=ReallySuppress ADDLOCAL=DHCP,DNS,Update" as user "WIN-32QTB227IR8\administrator" ...
    
* To install only the DHCP and the Update Agents:

  .. code-block::
    
    Micetro_Controllers_x64_<version>.exe /s /v"/qn /L*V C:\temp\controllerInstall.log REBOOT=ReallySuppress ADDLOCAL=DHCP,Update"
    
* To install only the DNS and Update Agents:

  .. code-block::
    
    Micetro_Controllers_x64_<version>.exe /s /v"/qn /L*V C:\temp\controllerInstall.log REBOOT=ReallySuppress ADDLOCAL=DNS,Update"

**Example**: The following example is a full installation for Micetro version 25.1.2:

.. code-block::
        
    Micetro_Controllers_x64_<25.1.2>.exe /s /v"/qn /L*V C:\temp\controllerInstall.log REBOOT=ReallySuppress ADDLOCAL=DHCP,DNS,Update"

All agents are installed as a **Windows Service** and all services run by default under the **Local System** account. For information about how to change the account that runs the service, refer to :ref:`windows-dhcp-privileged`.

.. note::
    The installers will not touch the Windows firewall. The necessary ports must be allowed. Refer to :ref:`networking_requirements` for a list of services and their respective ports.
 
Agent-free installation
-----------------------
For an agent-free installation, in which an Agent is used as proxy to communicate with the Windows service, the Local System account is usually insufficient.

The DNS Agent service (service name: ``Men and Mice DNS Server Controller``) runs under an Active Directory (AD) service account that is member of the ``DNSAdmins`` group in AD and is also local administrator on the machine running the agent.

With the Micetro DHCP Agent (service name: ``Men and Mice DHCP Server Controller``), the serivce account typically runs under an AD service account that is member of the AD group ``DHCP Administrators``. If the DHCP server role runs on a dedicated Windows domain member server (not on a Domain Controller), membership to the local ``DHCP Administrators`` group for the DHCP servers is required.

The Update Agent can also run on the Local System. Typically, no changes are needed for this agent type. 

For more information about agent-free management, refer to :ref:`agent-free-dns-dhcp`.

.. _windows-dhcp-privileged:

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
