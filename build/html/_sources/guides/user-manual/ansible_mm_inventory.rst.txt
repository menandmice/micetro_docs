.. meta::
   :description: Micetro inventory plugin supports reading configuration from both a YAML configuration file and environment variables
   :keywords: Micetro by Men&Mice, Micetro inventory plugin

.. _ansible-mm_inventory:

mm_inventory plugin
-------------------

This plugin generates the inventory from Micetro. It supports reading configuration from both a YAML configuration file and environment variables. If reading from the YAML file, the filename must end with ``mm_inventory.(yml|yaml)``, the path in the command would be ``/path/to/mm_inventory.(yml|yaml)``. If some arguments in the configuration file are missing, this plugin will try to fill in the missing arguments by reading from environment variables. If reading configurations from environment variables, the path in the command must be @mm_inventory.

Valid configuration filenames are:

* ``mm_inventory``

* ``mmsuite``

* ``mandm``

* ``menandmice``

* ``mandmsuite``

* ``mm_suite``

* ``mandm_suite``

Options
^^^^^^^

There are two sets of configuration options, the options for the inventory plugin to function correctly and for Ansible to know how to use the plugin.

Plugin configuration
""""""""""""""""""""

The ``mm_inventory`` plugin is configured through a configuration file, named ``mm_inventory.yml`` and the options are:

plugin
  Name of the plugin (mm_inventory)

host
  Micetro to connect to (http://micetro.example.net)

user
  UserID to connect with (apiuser)

password
  The password to connect with (apipasswd)

filters
  Filter on custom properties, can be more than 1 and should be a list. If multiple filters are given, they act as an and function

ranges
  What IP ranges to examine (172.16.17.0/24) Multiple ranges can be given, they act as an or function

.. note::
  When both *ranges* and *filters* are supplied that will result in an and function.

Example:

.. code-block:: yaml

  filters:
    - location: home
    - owner: tonk
  ranges:
    - 192.168.4.0/24
    - 172.16.17.0/24

Would result in an inventory for all host that have the ``location: home`` and ``owner: tonk`` custom properties set and are either a member of the 192.168.4.0/24 or 172.16.17.0/24 range.

An example of the ``mm_inventory.yml`` file:

.. code-block:: yaml

  plugin: mm_inventory
  host: "http://micetro.example.net"
  user: apiuser
  password: apipasswd
  filters:
    - location: London
  ranges:
    - 172.16.17.0/24

Environment variables:
""""""""""""""""""""""

The ``mm_inventory`` plugin can also be configured through environment variables

.. code-block:: bash

  export MM_HOST=YOUR_MM_HOST_ADDRESS
  export MM_USER=YOUR_MM_USER
  export MM_PASSWORD=YOUR_MM_PASSWORD
  export MM_FILTERS=YOUR_MM_FILTERS
  export MM_RANGES=YOUR_MM_RANGES

When reading configuration from the environment, the inventory path must always be ``@mm_inventory``.

.. code-block:: bash

  ansible-inventory -i @mm_inventory --list

Ansible configuration
"""""""""""""""""""""

Ansible needs to know about the ``mm_inventory`` plugin and also has some extra configuration options. First the ``mm_inventory`` plugin needs to be enabled, so Ansible can use it. This is done in the ``[inventory]`` section in the ``ansible.cfg`` file.

.. code-block::

  [inventory]
  enable_plugins   = mm_inventory, host_list, auto
  cache            = yes
  cache_plugin     = jsonfile
  cache_prefix     = mm_inv
  cache_timeout    = 3600
  cache_connection = /tmp/mm_inventory_cache

With the following meaning:

cache:
  Switch caching on and off

cache_plugin:
  Which caching plugin to use

    * jsonfile

    * yaml

    * pickle

    * …

cache_prefix:
  User defined prefix to use when creating the cache files

cache_connection:
  Path in which the cache plugin will save the cache files

cache_timeout:
  Timeout for the cache in seconds

Now the inventory plugin can be used with Ansible, like:

.. code-block:: bash

  ansible-inventory -i /path/to/mm_inventory.yml --list

Or set the ``mm_inventory.yml`` as the Ansible inventory in the ``ansible.cfg`` file.

.. code-block::

  inventory = mm_inventory.yml
