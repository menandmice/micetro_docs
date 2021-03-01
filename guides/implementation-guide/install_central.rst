Men&Mice Central
================

Bla bla, summary of what Central is, bla bla.

.. toctree::
  :maxdepth: 2
  :hidden:

  central_database
  install_console
  central_ha
  central_python

Install Men&Mice Central on Linux
---------------------------------

.. note::
  Before installing Men & Mice Central, decide the following:

  * What user account will own the Men & Mice Central process?
  * Where do you want everything stored? There are defaults provided.

Extract and run the Men&Mice Central install package:

.. code-block::

  tar -xzvf mmsuite-central-9.4.4.linux.x64.tgz
  cd mmsuite-central-9.4.2.linux.x64
  ./install

Installer Questions

Here are the questions asked by the installer that pertain to Men & Mice Central:

* Do you want to install Men & Mice Central?
* Where do you want Men & Mice Central to keep its configuration files?
* Enter the user and group names under which you want to run Men & Mice Central.
* Where do you want to install the Men & Mice Central binary?

Proceed to :ref:`Configuring the database <central_database>`.

Install Men&Mice Central on Windows
-----------------------------------

.. note:: Running Men & Mice Central under a privileged user account
  Running Central as a specific service account affects a few functions when it talks to the Active Directory, such as Integrated Security communications with an SQL server database, communications with AD Sites and Services, authentication of AD users, and ability to ping.

  When creating a service account for Central, make sure the user is in the local "administrators" group on the Central machine. Otherwise it will not be able to utilize the ping functionality.

Proceed to :ref:`Configuring the database <central_database>`.

Install Men&Mice Central on Solaris
-----------------------------------

Extract and run the Men&Mice Central install package:

.. code-block::

  gzcat archive-name.tgz | tar xf -

Then change into the newly-created directory and run the installer as described in the following sections.

By default, when executed it tries to figure out the installed service (e.g. BIND) automatically and will try to install it without further user input.
In case it can't install the service it will print out hints and further information.

If the machine has multiple services installed, like ISC DHCP and ISC BIND DNS you want to specify explicitly the Men & Mice Controllers that
should be installed.

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
