.. meta::
    :description: Installing the Micetro DNS Agent for Micetro on Windows
    :keywords: DNS, DNS Agent, Micetro, BIND, Unbound, AuthServe, Windows
 
.. _dns-agent-windows:
 
Installing Micetro DNS Agents on Windows
========================================
Micetro comes with two types of DNS agents: 
 
    * the Micetro DNS Agent
    * the Micetro :ref:`AuthServe Agent<authserve>` 
 
By default, the Micetro agent installer attempts to automatically detect the installed DNS service, e.g., BIND, and install the appropriate agent. In the case that automatic detection fails, the installer provides hints and additional information.
 
.. note::
    If you're running BIND DNS, make sure that the DNS agents run as the same user as BIND (by default, ``named``.)
 
    If BIND runs as a different user or files are updated, make sure that the ``mmremote`` service runs as the same user and has sufficient access permissions to files and directories.
 
For machines hosting multiple services, such as ISC DHCP and ISC BIND DNS, explicitly specify the desired agents during installation.
 
To view available agent options and parameters, run the installer script with the ``--help`` parameter:
 
.. code-block:: bash
        
    cd archive-name
    ./install --help
 
    Micetro agent installer.
    --help:  Print help.
    --quiet:  Suppress output during installation.
    --auto:  Automatically determine the agents to install. Default if no other option is given.
    --bind-dns-controller:  Install a DNS agent for BIND.
    --unbound-dns-controller:  Install a DNS agent for Unbound.
    --generic-dns-controller:  Install a Generic DNS agent.
    --isc-dhcp-controller:  Install a DHCP agent for ISC dhcpd.
    --kea-dhcp-controller:  Install a DHCP agent for Kea dhcp4.
    --update-controller:  Install update agent. Always installed if another Micetro service is installed.
 
Where to install the Micetro DNS Agent
--------------------------------------
If Micetro Central is installed on a Windows host, you can install Micetro DNS Agent on the same host. If not, the system needs to be told where to find the DNS Agent when a new DNS server is added to the system. This is presented as connecting via proxy.
 
.. note::
    The Micetro communication protocol used to control a DNS server is more efficient than the Microsoft protocol. This means that if a DNS server is separated from Micetro Central by a slow network link, it is more efficient to install a copy of the Micetro DNS Agent in the same local network (the same site, typically) as the DNS server.
    
Installing agents
-----------------
* To install agents automatically (recommended when you have a single service like BIND or Unbound):
 
  .. code-block:: bash
        
    ./install --auto
 
* For a specific set of agents, run the installer as follows (example with ISC BIND and Generic DNS Agent):
 
  .. code-block:: bash
 
    ./install --generic-dns-controller --bind-dns-controller --isc-dhcp-controller
 
* For quiet/unattended installation with no output:
 
  .. code-block:: bash
 
    ./install --generic-dns-controller --bind-dns-controller --quiet
 
.. note::
    The Micetro Update Agent is automatically added when another Micetro service is installed.
 
If you intend to use the Generic DNS Agent, refer to :ref:`generic-dns-controller` for more information.
 
If you experience issues with the new installer, the previous Perl-based installer is still available in the same archive as ``deprecated_installer.pl``. Run it as follows:
 
.. code-block:: bash
    
    cd archive-name
    ./deprecated_installer
 
The installer will ask a series of questions. Be prepared to answer them, as described, for each component.
 
Active Directory-integrated zones and dynamic zones
---------------------------------------------------
To open a dynamic zone, Micetro must read it from the DNS service rather than from a file. This is done via *zone transfer*. On Windows Server 2003 and later, the zone transfer restriction setting in the zone's options window must be set to allow transfers to an explicit list of IP addresses that includes the server's own address. The default setting which allows zone transfers to any server listed in the zone's NS records will not suffice.
 
In some cases, the Micetro DNS Agent must need to be specifically told which interface to use when requesting zone transfers. If you have trouble opening a dynamic zone after setting the zone's transfer restrictions appropriately, check the **Event Log / Application Log** for messages from the Micetro DNS Agent. If there is a message indicating that Agent was unable to get a zone transfer, take note of the address it tried to use; you can either add that IP address to the transfer restrictions list or else edit a configuration file for the Micetro DNS Agent.
 
To configure the DNS Agent to use a different address, edit the service's ``preferences.cfg`` file on the DNS server computer. The file is located in one of the following two locations, where {Windows} is probably ``C:\\Windows``:
 
* ``{Windows}\System32\dns\mmsuite\preferences.cfg``
* ``C:\Documents and Settings\All Users\Application Data\Men and Mice\DNS Server Controller\preferences.cfg``
* ``C:\ProgramData\Men and Mice\DNS Server Controller\preferences.cfg``
 
If the file does not exist, create it. The file is a text file in a simple XML-based format.
 
Add the following element, replacing the dummy address here with the server's correct network address:
 
.. code-block::
    
    <DNSServerAddress value="192.0.2.1"/>
 
Save the file, and then restart the Micetro DNS Agent using :menuselection:`Administrative Tools --> Services` in Windows. Then, restart Micetro Central so that it can cache the zone's contents.
 
.. note::
    For Active Directory (AD)-integrated zones, other domain controllers running Microsoft DNS do not need to get zone transfers. This is because the zone data is replicated through LDAP, rather than through zone transfers. Thus, for an AD-integrated zone, the zone transfer restriction list might only need the server's own address.
 
Setting up agent-free management for MS services
------------------------------------------------
Normally, the Micetro DNS Agent is installed on only *one* host in an Active Directory forest, or one copy per site. That installation can then manage all Microsoft DNS servers in the forest, or in the site, using Microsoft's own DNS management API (agent-free). To do so, the service needs to run as a user with DNS management privileges (i.e., the AD service account must be a member of the DNSAdmins group for the domain).
 
To configure Micetro DNS Agent to access DNS servers on remote computers:
 
1. Start the Windows 'Services' program and open the **Properties** dialog box for the Micetro DNS Agent.
2. Select the :guilabel:`Log On` tab. The :guilabel:`Local System account` radio button is most likely selected.
3. Select the :guilabel:`This account` radio button and enter the name and password of a Windows user who is a member of the Administrators group.
4. Close the dialog box and restart the Micetro DNS Agent service.
 
If Micetro DNS Agent is run as a local system service (the default), it will only be able to manage the MS DNS service on the same host.
 
Enabling the generic DNS Agent functionality
------------------------------------------
If the Agent should be configured to run a connector script so it can interface with DNS servers other than the natively supported Windows DNS/Unix BIND DNS, you must configure the script interpreter and the connector script in the agents ``preferences.cfg`` file.
 
The file is a text file in a simple XML-based format. Add the following element, replacing the dummy script interpreter and script:
 
.. code-block:: XML
    
    <GenericDNSScript value="python /scripts/genericDNS.py" />
 
For information about ``preferences.cfg`` files, refer to :ref:`config-files-windows`.
 
Configuring the DNS Agent for Microsoft Azure DNS
-------------------------------------------------
You can configure the DNS Agent to work with Microsoft Azure DNS. For information on configuring Microsoft Azure DNS, refer to :ref:`configure-azure-dns`.
 
.. toctree::
    :maxdepth: 1
 
    authserve_agent
