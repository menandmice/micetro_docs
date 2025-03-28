.. meta::
    :description: Installing the Micetro DNS Agent for Micetro on Linux
    :keywords: DNS, DNS Agent, Micetro, BIND, Unbound, AuthServe, Linux
 
.. _dns-agent-linux:
 
Installing Micetro DNS Agents on Linux
======================================
 
Micetro comes with two types of DNS agents: 
 
    * the Micetro DNS Agent
    * the Micetro :ref:`AuthServe Agent<authserve>` 
 
By default, the installer attempts to automatically detect the installed DNS service (such as BIND) and install the appropriate agent. In cases where automatic detection fails, the installer provides hints and additional information.
 
.. note::
    If you're running BIND DNS, ensure that the DNS agents run as the same user as BIND (by default, ``named``.)
 
    If BIND runs as a different user or files are updated, ensure that the ``mmremote`` service runs as the same user and has sufficient access rights to files and directories.
 
For machines hosting multiple services (such as ISC DHCP and ISC BIND DNS), explicitly specify the desired agents during installation.
 
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
 
Preliminary checks
------------------
Before installing the Micetro DNS Agent on a Linux system, make sure you have thoroughly examined your system's configuration. Pay close attention to the following aspects:
 
    * **Configuration File:** Check whether there is a valid starting configuration file, typically located at ``/etc/named.conf``. If one doesn't exist, you will need to create it.
     
    * **Content of named.conf:** Verify that your ``named.conf`` file contains all the necessary statements as detailed below.
 
    * **Ownership of Named Data Directory:** Determine whether the named init script changes the ownership of the named data directory. This is crucial, especially for certain Red Hat Linux versions and derivatives that may modify the ownership (check for the ``ENABLE_ZONE_WRITE`` setting).
 
    * **Chroot Environment:** Check whether named runs within a chroot environment. If it does, be aware of specific issues that may arise and consult the knowledge base for solutions. Pay attention to the following:
 
        * Determine whether the named init script copies any files into the chroot jail upon starting the service (relevant for SUSE Linux).
 
        * Consider potential problems that might occur when the installer rearranges the data directory listed in ``named.conf`` (relevant for SUSE Linux).
 
    * **User Account for Named:** Identify the user account that owns the named process. Typically, the Micetro DNS Agent runs under the same user account. However, it is sometimes possible to use group membership instead.
 
Running the installer
---------------------
* To install agents automatically (recommended when you have a single service like BIND or Unbound):
 
  .. code-block:: bash
        
    ./install --auto
 
* For a specific set of agents, run the installer as follows (example with ISC BIND and Generic DNS agent):
 
  .. code-block:: bash
 
    ./install --generic-dns-controller --bind-dns-controller --isc-dhcp-controller
 
* For quiet/unattended installation with no output:
 
  .. code-block:: bash
 
    ./install --generic-dns-controller --bind-dns-controller --quiet
 
.. note::
    The Micetro Update Agent is automatically added when another Micetro service is installed.
 
If you intend to use the Generic DNS Agent, refer to the :ref:`generic-dns-controller` for further information.
 
If you experience issues with the new installer, the previous Perl-based installer is still available in the same archive as ``deprecated_installer.pl``. Run it as follows:
 
.. code-block:: bash
    
    cd archive-name
    ./deprecated_installer
 
The installer will ask a series of questions. Be prepared to answer them, as described, for each component. Refer to :ref:`installer-questions`.
 
Installing the agents
---------------------
 
1. Extract the Micetro agent installation package (as root):
 
   .. code-block:: bash
 
    tar -xzvf mmsuite-controllers-10.0.linux.x64.tgz
 
2. In the newly created ``mmsuite-controllers-10.0.linux.x64`` directory, run the installer script to install the Micetro agent (as root):
 
   .. code-block:: bash
 
    cd mmsuite-controllers-10.1.linux.x64 && ./install
 
.. _installer-questions:
 
Installer questions
-------------------
During the installation process, the installer will prompt you with questions related to the Micetro DNS Agent. Be prepared to answer the following:
 
    * Do you want to install the Micetro DNS agent?
    * Are you running named in a chroot() environment?
    * What is the chroot() directory?
    * Where is the BIND configuration file?
    * Would you like the DNS agent to run ``name-checkconf`` to verify changes when editing advanced server and zone options?
    * Where is ``named-checkconf`` located?
    * The installer needs to rearrange the files in ``<directory>`` and restart the name server. A backup will be created. Is this OK?
    * Enter the user and group names under which you want to run the Micetro DNS agent. This must be the user which is running named.
    * Where would you like to install the Micetro external static zone handling utilities?
    * Where do you want to install the Micetro agent binaries?
    * BIND needs to be restarted. Would you like to restart it now?
 
Make sure the ``named-checkconf`` file is readable:
 
.. code-block:: bash
 
    chmod a+s /usr/sbin/named-checkconf
 
Required named.conf statements
------------------------------
The Micetro DNS Agent requires specific settings within the ``named.conf`` file (including any files listed in ``include`` statements in ``named.conf``). Make sure the following statements are present:
 
* ``directory``: The ``directory`` substatement of the ``options`` statement must be present and point to a directory that the installer can replace. It should not refer to ``/``, ``/etc``, the root of a chroot jail, or any partition mount point. If you need to add or change the ``directory`` statement, be prepared to move files or update paths used elsewhere in your ``named.conf``.
 
* ``key``: For BIND, there must be an explicitly defined key in ``named.conf`` to enable control of named using ``rndc`` commands. Copy the contents of the key file, such as ``rnds.key``, into ``named.conf`` if it's not explicitly defined.
 
  To generate a key, consider using the following command (adjust the path if needed):
 
    .. code-block:: bash
        
        rndc-confgen > /etc/rndc.conf
 
  This creates the ``rndc.conf`` file, which contains configuration for local use, and key and controls statements that can be copied into ``named.conf``.
 
* ``controls``: The Micetro DNS Agent uses a ``controls`` statement for BIND. There must be a ``controls`` statement with an ``inet`` substatement that references an explicitly defined key (as mentioned above). The ``inet`` statement should allow connections from the loopback address ``127.0.0.1``. If no ``controls`` statement is defined, the installer will prompt you to create one manually.
 
Changes in named.conf
---------------------
Upon installation, the Micetro DNS Agent will rearrange the named configuration data, which includes rewriting ``named.conf`` and reorganizing the data directory. The new configuration is functionally equivalent to the old one, except that the logging statement may be added or modified to include new channels. Before making these modifications, a backup is made of the named configuration data.
   
Common files
^^^^^^^^^^^^
The file layout differs slightly between instances with and without BIND views, but there are a few common items:
 
.. csv-table::
    :header: "Description", "File(s) or directory"
    :widths: 40, 60
 
    "Micetro DNS Agent daemon", "mmremoted, usually in /usr/sbin or /usr/local/sbin"
    "Micetro external static zone handling utilities", "mmedit and mmlock, usually in /usr/bin or /usr/local/bin"
    "Data directory for Micetro DNS agent", "Usually /var/named, /etc/namedb, /var/lib/named, or something within a chroot jail; the same location as before the DNS Agent was installed"
    "Backup of original data directory", "Same as above, with '.bak' appended to the path"
    "New starting configuration file", "Usually either /etc/named.conf or /etc/namedb/named.conf; possibly located within a chroot jail"
    "Backup of original starting configuration file", "Same as above, with '.bak' appended to the path"
    "Logging statement from named.conf", "conf/logging, relative to the data directory"
    "Key and acl statements from named.conf", "conf/user_before, relative to the data directory"
    "Options statement from named.conf", "conf/options, relative to the data directory"
    "Controls, server, and trusted-keys statements from named.conf [1]_", "conf/user_after, relative to the data directory"
    "Preferences file", "mmsuite/preferences.cfg, located in the data directory"
    "init script [2]_", "/etc/init.d/mmremote"
    "Settings file used by the init script (Ubuntu Linux only)", "/etc/default/mmremote"
 
.. [1] If present and not using view, the root hints zone statement.
.. [2] The shell script, which is used by init during system startup, that can be used to control the service.
 
With views
^^^^^^^^^^
If views are defined, the following files are created inside the data directory:
 
.. csv-table::
    :header: "Description", "File(s) or directory"
    :widths: 40, 60
 
    "View statements, not including zone statements within each view", "conf/zones"
    "List of include statements for a particular view, one for each zone statement file", "conf/zones_viewname"
    "Directory of zone statement files for a particular view", "conf/zo_viewname"
    "A sample zone statement file, for the zone 'localhost'. in the view 'internal'", "conf/zo_internal/localhost.opt"
    "Directory of primary master zone files for a particular view", "hosts/view_viewname/masters"
    "Directory of secondary zone files for a particular view", "hosts/view_viewname/slaves"
    "A sample zone file, for the primary master zone 'localhost.' In the view 'internal'", "hosts/view_internal/masters/localhost-hosts"
 
Without views
^^^^^^^^^^^^^
If views are not defined, the following files are created inside the data directory:
 
.. csv-table::
    :header: "Description", "File(s) or directory"
    :widths: 40, 60
 
    "List of include statements, one for each zone statement file", "conf/zones"
    "Directory of zone statement files", "conf/zoneopt"
    "A sample zone statement file, for the zone 'localhost'.", "conf/zoneopt/localhost.opt"
    "Directory of primary master zone files", "hosts/masters"
    "Directory of secondary zone files", "hosts/slaves"
    "A sample zone file, for the primary master zone 'localhost.'", "hosts/masters/localhost-hosts"
 
 
Removing the DNS Agent and reverting to original configuration
--------------------------------------------------------------
Follow these instructions if you want to remove the DNS Agent and revert to your original DNS configuration and data:
 
1. Stop the service
^^^^^^^^^^^^^^^^^^^
Use the init script to stop the DNS agent service. To do so, provide the ``stop`` argument to the init script. For example:
 
.. code-block:: bash
    
    sudo /etc/init.d/dns-controller stop
 
or
 
.. code-block:: bash
 
    sudo systemctl stop dns-controller
 
Replace ``/etc/init.d/dns-controller`` and ``dns-controller`` with the appropriate paths and service names for your system.
 
2. Remove agent files
^^^^^^^^^^^^^^^^^^^^^
Once the service is stopped, you can proceed to remove the DNS Agent files:
 
    * Delete the daemon binary file associated with the DNS Agent.
    * Delete the init script used to start the DNS Agent service.
    * If the init script was registered as part of the boot system, remove any references to it. This may involve using system-specific tools or manually editing boot configuration files.
 
3. Revert to your original configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If you wish to revert to your original DNS configuration and data, follow these additional steps:
 
1. Stop the BIND or named service, which might have been managed by the DNS agent, using its respective init script. For example:
 
   .. code-block:: bash
        
    sudo /etc/init.d/named stop
 
   or
 
   .. code-block:: bash
        
    sudo systemctl stop named
 
2. With the BIND or named service stopped, you can proceed to restore your original DNS configuration and data:
 
    * Delete the initial configuration file (``named.conf``) created by the DNS Agent. 
 
    * Delete the data directory created by the DNS Agent.
 
    * If you created backup files by renaming the originals with a ".bak" extension, restore the original files by removing the ".bak" extension from their names.
 
These steps will effectively remove the DNS Agent and revert your DNS setup to its original state.
 
.. warning::
    Be cautious when performing these actions, as they may impact your DNS service.
 
Adjusting SELinux
-----------------
 
.. note::
    The following commands apply to Linux distributions based on RedHat EL 8 or higher. Your distribution may differ.
 
After installing the DNS Agent, run the following commands as root:
 
.. code-block:: bash
    
    semanage fcontext -a -t named_cache_t --ftype f "/var/named(/.*)?"
    semanage fcontext -a -t named_cache_t --ftype d "/var/named(/.*)?"
    semanage fcontext -a -t named_conf_t --ftype f "/var/named/conf(/.*)?"
    semanage fcontext -a -t named_conf_t --ftype d "/var/named/conf(/.*)?"
    semanage fcontext -a -t named_zone_t --ftype f "/var/named/hosts(/.*)?"
    semanage fcontext -a -t named_zone_t --ftype d "/var/named/hosts(/.*)?"
    restorecon -rv /var/named
 
These will adjust the SELinux security label for the BIND 9 configuration and zone files.
 
.. note::
    Due to the complexity of and variation between SELinux configuration files, we are currently unable to officially support SELinux configuration, as SELinux settings can interfere with the normal operation of named after its configuration has been rewritten by the installer for Micetro DNS Agent. It is possible to make ``named``, Micetro, and SELinux all work together, but we cannot currently offer official support for this.
 
The $INCLUDE and $GENERATE directives
-------------------------------------
 
Refer to the following articles for information about how these directives are handled in Micetro.
 
* :ref:`dns-controller-include`
 
* :ref:`dns-controller-generate`
 
Installing with dynamic zones
-----------------------------
Micetro expects dynamic zones to be made dynamic by allowing signed updates. Any dynamic zone must have an allow-update statement whose ACL contains a key. If you do not otherwise have a need for signed updates, add the ``rndc`` key (or any other key) to the list.
 
Furthermore, after installation, make sure your server allows zone transfers of dynamic zones to the loopback address, ``127.0.0.1``, or users will be unable to open dynamic zones from this server. Zone transfer restrictions can be set or changed in the server's **Edit server options** dialog on the **Admin** page and in each zone's **Edit zone options** dialog on the **DNS** page in Micetro.
 
Verifying the DNS Agent is running
----------------------------------
Verify the agent application is running:
 
.. code-block:: bash
    
    systemctl status mmremote

|
**Related topics**:

.. toctree::
    :maxdepth: 1
 
    authserve_agent
