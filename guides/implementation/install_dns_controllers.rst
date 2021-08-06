.. meta::
   :description: Installing the Men&Mice DNS Server Controller for Micetro by Men&Mice
   :keywords: DNS, DNS Server Controller, Micetro, BIND, Unbound

.. _install-dns-controllers:

Men&Mice DNS Server Controllers
===============================

Men&Mice DNS Server Controller is the DNS server agent. It sits on each DNS server machine and manages the DNS service on your behalf.

By default, when executed the controller installer tries to figure out the installed service (e.g. BIND) automatically and will try to install it without further user input.

In case it can't install the service it will print out hints and further information.

.. note::
  For DNS servers running BIND, the DNS Server Controllers need to be ran as the same user as BIND. (By default: ``named``.)

  If BIND is running as a different user, or files are updated, make sure that the ``mmremote`` service is ran as the same user and has sufficient access to files and directories.

If the machine has multiple services installed, like ISC DHCP and ISC BIND DNS you want to specify explicitly the Men&Mice Controllers that should be installed.

To get the list of available controllers/parameters just run the installer script with the --help parameter:

  .. code-block:: bash

    cd archive-name
    ./install --help

    Men&Mice server controller installer.
    --help:  Print help.
    --quiet:  Suppress output during install.
    --auto:  Automatically determine what controllers to install. Default if no other option is given.
    --bind-dns-controller:  Install a DNS server controller for BIND.
    --unbound-dns-controller:  Install a DNS server controller for Unbound.
    --generic-dns-controller:  Install a Generic DNS server controller.
    --isc-dhcp-controller:  Install a DHCP server controller for ISC dhcpd.
    --kea-dhcp-controller:  Install a DHCP server controller for Kea dhcp4.
    --update-controller:  Install update controller. Always installed, if another Men&Mice service is installed.

Multiple controllers can be specified. If you want to, for example, have both ISC BIND and the generic DNS controller running on the machine just run the installer as follows:

.. code-block:: bash

  ./install --generic-dns-controller --bind-dns-controller --isc-dhcp-controller

.. note::
  If you have only a single service like BIND or Unbound installed we recommend to run the installer without parameter. It will then use the ``--auto`` parameter and figure out the service automatically.

Quiet/unattended installation is possible with the ``--quiet`` parameter (no output at all):

.. code-block:: bash

  ./install --generic-dns-controller --bind-dns-controller --quiet

.. note::
  The Men&Mice Update Controller always gets automatically added to the list when another Men&Mice service is installed, e.g. in the above listed example the ``--update-controller`` gets added automatically.

If you plan to use the Generic DNS Controller, please see :ref:`generic-dns-controller`.

If you run into issues with the new installer, the old interactive Perl based installer is still present in the same archive as:

.. code-block::

  deprecated_installer.pl

To execute the deprecated installer for the Men&Mice Server Controllers please run it as follows:

.. code-block:: bash

  cd archive-name
  ./deprecated_installer

The installer will ask a series of questions. Be prepared to answer them, as described for each component.

Men&Mice Central running on Linux
---------------------------------

.. note::
  Before installing Men&Mice DNS Server Controller, examine your named data and operating environment, plus the init script and/or settings file used to start named. Be aware that the installer will rearrange named.conf and your named data directory. Know how to answer the following questions:

  * Is there a starting configuration file, such as /etc/named.conf?
    * If not, you will need to create one.
    * If there is, is it valid? It must load without errors.

  * Does named.conf contain the necessary statements? See the notes below.

  * Does the named init script change the ownership of the named data directory? If so, this will cause problems and should be fixed. (This is aimed at users of some Red Hat Linux versions, and derivatives. Look for the ``ENABLE_ZONE_WRITE`` setting.)

  * Does named run in a chroot environment? If so, look for the following problems, and fix or work around any encountered. (Check the installation walkthroughs in the knowledge base for solutions.)
    * Does the named init script copy anything into the chroot jail when starting the service? (This is aimed at users of SUSE Linux.)
    * When the installer rearranges the data directory listed in named.conf, will that cause problems? (This again is aimed at users of SUSE Linux.)

  * What user account owns the named process? Men&Mice DNS Server Controller must typically run as the same user. However, it is sometimes possible to use group membership instead.

Extract the Men&Mice Controller install package (as root):

  .. code-block:: bash

    tar -xzvf mmsuite-controllers-10.0.linux.x64.tgz

In the newly created ``mmsuite-controllers-10.0.linux.x64`` directory run the installer script to install the Men&Mice Controller (as root):

  .. code-block:: bash

    cd mmsuite-controllers-10.0.linux.x64 && ./install --skip-arrange

Installer Questions
^^^^^^^^^^^^^^^^^^^

Here are the questions asked by the installer that pertain to Men&Mice DNS Server Controller:

  * Do you want to install the Men&Mice DNS Server Controller?
  * Are you running named in a chroot() environment?
  * What is the chroot() directory?
  * Where is the BIND configuration file?
  * Would you like the DNS Server Controller to run name-checkconf to verify changes when editing advanced server and zone options?
  * Where is named-checkconf?
  * The installer needs to rearrange the files in <directory> and restart the name server. A backup will be created. Is this OK?
  * Enter the user and group names under which you want to run the Men&Mice DNS Server Controller. This must be the user which is running named.
  * Where would you like to install the Men&Mice external static zone handling utilities?
  * Where do you want to install the Men&Mice Server Controller binaries?
  * BIND needs to be restarted. Would you like to restart it now?

Ensure the ``named-checkconf`` file is readable:

  .. code-block:: bash

    chmod a+s /usr/sbin/named-checkconf

Required named.conf Statements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Men&Mice DNS Server Controller requires that named.conf (including any files listed in include statements in named.conf) have certain settings. The following are required:

directory
  The directory substatement of the options statement must be present and must point to a directory that the installer can replace. Specifically, it may not refer to ``/``, ``/etc``, the root of a chroot jail, or any partition mount point. If you need to change or add the directory statement, you may then have to move files around or change the paths used elsewhere in your ``named.conf`` (or its included files).

key
  For BIND, there must be a key defined, so that Men&Mice DNS Server Controller can control named using ``rndc`` commands. It is common for there to be a key in a default file such as ``rndc.key``, which is almost always found in the same location as ``named.conf``; however, Men&Mice DNS Server Controller requires that this key be defined *explicitly* in ``named.conf``. If there is a file named ``rndc.key``, its contents can simply be copied directly into ``named.conf``.

  To generate a key, the following command usually works, though you may have to specify a path to the command:

  .. code-block:: bash

    rndc-confgen > /etc/rndc.conf

  This creates the file ``rndc.conf`` in the default directory (usually ``/etc``, which may or may not be where you want it). This file contains a *complete* ``rndc`` configuration for local use, as well as key and controls statements, in comments, that can be copied into ``named.conf`` (after removing the comment marks).

controls
  Men&Mice DNS Server Controller uses a controls statement for BIND. There must be a controls statement with an ``inet`` substatement that references an explicitly defined key (see above); the ``inet`` statement must allow connections from the loopback address, 127.0.0.1. If there is no controls statement defined, the installer will remind you to create one manually.

Changes in named.conf
^^^^^^^^^^^^^^^^^^^^^

Installing Men&Mice DNS Server Controller rearranges your named configuration data, including rewriting ``named.conf`` and rearranging the data directory. The new configuration is functionally equivalent to the old, except the logging statement is either added or changed to add some new channels.

Common Files
""""""""""""

The file layout is a little different with or without BIND views. Here are the parts in common:

.. csv-table::
  :header: "Description", "File(s) or directory"
  :widths: 40, 60

  "Men&Mice DNS Server Controller daemon", "mmremoted, usually in /usr/sbin or /usr/local/sbin"
  "Men&Mice external static zone handling utilities", "mmedit and mmlock, usually in /usr/bin or /usr/local/bin"
  "Data directory for Men&Mice DNS Server Controller", "Usually /var/named, /etc/namedb, /var/lib/named, or something within a chroot jail; the same location as before the DNS Server Controller was installed"
  "Backup of original data directory", "Same as above, with '.bak' appended to the path"
  "New starting configuration file", "Usually either /etc/named.conf or /etc/namedb/named.conf; possibly located within a chroot jail"
  "Backup of original starting configuration file", "Same as above, with '.bak' appended to the path"
  "logging statement from named.conf", "conf/logging, relative to the data directory"
  "key and acl statements from named.conf", "conf/user_before, relative to the data directory"
  "options statement from named.conf", "conf/options, relative to the data directory"
  "controls, server, and trusted-keys statements from named.conf; also, if present and if not using views, the root hints zone statement", "conf/user_after, relative to the data directory"
  "Preferences file", "mmsuite/preferences.cfg, located in the data directory"
  "init script, the shell script that can be used to control the service; used by init during system startup", "/etc/init.d/mmremote"
  "settings file used by the init script (Ubuntu Linux only)", "/etc/default/mmremote"

**Without Views**

If views are not defined, the following files are created inside the data directory:

.. csv-table:: Without BIND views
  :header: "Description", "File(s) or directory"
  :widths: 40, 60

  "List of include statements, one for each zone statement file", "conf/zones"
  "Directory of zone statement files", "conf/zoneopt"
  "A sample zone statement file, for the zone 'localhost'.", "conf/zoneopt/localhost.opt"
  "Directory of primary master zone files", "hosts/masters"
  "Directory of slave zone files", "hosts/slaves"
  "A sample zone file, for the primary master zone 'localhost.'", "hosts/masters/localhost-hosts"

**With views**

If views are defined, the following files are created inside the data directory:

.. csv-table:: With BIND views
  :header: "Description", "File(s) or directory"
  :widths: 40, 60

  "View statements, not including zone statements within each view", "conf/zones"
  "List of include statements for a particular view, one for each zone statement file", "conf/zones_viewname"
  "Directory of zone statement files for a particular view", "conf/zo_viewname"
  "A sample zone statement file, for the zone 'localhost'. in the view 'internal'", "conf/zo_internal/localhost.opt"
  "Directory of primary master zone files for a particular view", "hosts/view_viewname/masters"
  "Directory of slave zone files for a particular view", "hosts/view_viewname/slaves"
  "A sample zone file, for the primary master zone 'localhost.' in the view 'internal'", "hosts/view_internal/masters/localhost-hosts"

Removing the DNS Server Controller and Reverting to Original Data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To remove the DNS Server Controller, first use the init script to stop the service (give it the *stop* argument). Then simply delete the daemon and the init script, and remove any references to the init script in the rest of the boot system if necessary. To revert to your original data, stop named with its init script. Then delete the initial configuration file and the data directory and rename the originals, removing the ".bak" from their names.

SELinux
^^^^^^^

Some newer Linux distributions come with SELinux (Security Enhanced Linux) enabled by default. Due to the complexity of and variation between SELinux configuration files, we are unable to support SELinux configuration at this time. SELinux settings commonly interfere with the normal operation of named after its configuration has been rewritten by the installer for Men&Mice DNS Server Controller, so our recommendation is to disable SELinux. It is possible to make ``named``, Men&Mice Suite, and SELinux all work together, but we cannot currently offer support for this.

The $INCLUDE and $GENERATE Directives
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Please refer to the following articles for information about how these directives are handled in Men&Mice Suite.

* :ref:`dns-controller-include`

* :ref:`dns-controller-generate`

Installation with Dynamic Zones
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Men&Mice Suite expects dynamic zones to be made dynamic by allowing signed updates. Any dynamic zone must have an allow-update statement whose ACL contains a key. If you do not otherwise have a need for signed updates, add the rndc key (or any other key) to the list.

Furthermore, after installation, be sure that your server allows zone transfers of dynamic zones to the loopback address, 127.0.0.1, or users will be unable to open dynamic zones from this server. Zone transfer restrictions can be set or changed in the server's and in each zone's **Options** window in the Men&Mice Management Console.

Verify the DNS Server Controller is running
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Verify the Controller application is running:

.. code-block:: bash

  systemctl status mmremote

Men&Mice Central running on Windows
-----------------------------------

Active Directory Integrated Zones and Other Dynamic Zones
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In order to open a dynamic zone, Men&Mice Suite must read it from the DNS service rather than from a file. The way this is done is via *zone transfer*. On Windows Server 2003 and later, the zone transfer restriction setting in the zone's options window must be set to allow transfers to an explicit list of IP addresses that includes the server's own address. The default setting of allowing zone transfers to any server listed in the zone's NS records will not suffice.

In some cases, Men&Mice DNS Server Controller will also need to be told specifically which interface to use when requesting zone transfers. If you have trouble opening a dynamic zone after setting the zone's transfer restrictions appropriately, check the Event Log / Application Log for messages from Men&Mice DNS Server Controller. If there is a message indicating that it was unable to get a zone transfer, note the address it tried to use; you can either add that IP address to the transfer restrictions list, or else edit a configuration file for Men&Mice DNS Server Controller.

To configure the DNS Server Controller to use a different address, edit the service's preferences.cfg file on the DNS server computer. The file is located in one of the following two locations, where {Windows} is probably C:\\Windows:

* {Windows}\\System32\\dns\\mmsuite\\preferences.cfg
* C:\\Documents and Settings\\All Users\\Application Data\\Men and Mice\\DNS Server Controller\\preferences.cfg
* C:\\ProgramData\\Men and Mice\\DNS Server Controller\\preferences.cfg

If the file does not exist, create it. The file is a text file in a simple XML-based format. Add the following element, replacing the dummy address here with the server's correct network address:

.. code-block::

  <DNSServerAddress value="192.0.2.1"/>

Save the file, and then restart Men&Mice DNS Server Controller using :menuselection:`Administrative Tools --> Services` in Windows. Then also restart Men&Mice Central, so that it can cache the zone's contents.

.. note::
  For Active Directory-integrated zones, other domain controllers running Microsoft DNS do not need to get zone transfers. This is because the zone data is replicated through LDAP, rather than through zone transfers. Thus, for an AD-integrated zone, the zone transfer restriction list might need only the server's own address.

Running Men&Mice DNS Server Controller under a privileged user account / Server type: "Microsoft Agent-Free"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Normally, the Men&Mice DNS Server Controller is installed on only *one* host in an Active Directory forest, or one copy per site. That installation can then manage all MS DNS servers in the forest, or in the site, using Microsoft's own DNS management API. In order for this to work, the service needs to run as a user that has DNS management privileges (i.e. the AD service account must be a member of the DNSAdmins group of the domain).

To configure Men&Mice DNS Server Controller to access DNS servers on remote computers, do the following:

 1. Start the Windows 'Services' program and open the properties dialog box for Men&Mice DNS Server Controller.
 2. Click the :guilabel:`Log On` tab. The :guilabel:`Local System account` radio button is most likely selected.
 3. Click the :guilabel:`This account` radio button and enter the name and password of a Windows user that is a member of the Administrators group.
 4. Close the dialog box and restart the Men&Mice DNS Server Controller service.

If Men&Mice DNS Server Controller is run as a local system service (the default), then it will only be able to manage the MS DNS service on the same host.

Enable the Generic DNS Server Controller functionality
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If the Controller should be configured to run a connector script in order to interface with other DNS servers than the natively supported Windows DNS/Unix BIND DNS, the script interpreter and the connector script must be configured in the controllers ``preferences.cfg`` file.

The file is a text file in a simple XML-based format. Add the following element, replacing the dummy script interpreter and script:

.. code-block:: XML

  <GenericDNSScript value="python /scripts/genericDNS.py" />

Configure the DNS Server Controller to work with Microsoft Azure DNS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For information on configuring Microsoft Azure DNS, see :ref:`configure-azure-dns`.

Where to install Men&Mice DNS Server Controller
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If Men&Mice Central is installed on a Windows host, then one option is to install Men&Mice DNS Server Controller on the same host. If this is not done, then the system will need to be told where to find the DNS Server Controller when adding a new DNS server to the system. This will be presented as connecting via proxy.

.. note::
  The Men&Mice communication protocol used to control a DNS server is more efficient than the Microsoft protocol. This means that if a DNS server is separated from Men&Mice Central by a slow network link, it is more efficient to install a copy of the Men&Mice DNS Server Controller in the same local network (the same site, typically) as the DNS server.
