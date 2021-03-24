.. _ansible-install:

Installation
------------

The modules and plugins need to be installed on the Ansible control node, often called the Ansible controller and Ansible needs to be configured so that the modules and plugins can be found by Ansible.

Installing the Ansible modules and plugins is a straight forward process. Copy the Ansible modules and plugins to a directory on the Ansible control node, let us assume ``/tmp/mandm``. Later on these files are copied to the destination directories on the control node.

Requirements
^^^^^^^^^^^^

The Ansible integration modules and plugins do not need anything beyond a standard Ansible installation. The minimum Ansible version is 2.7 and up and the required Python version is 2.7+ or 3.5+.

Ansible modules
^^^^^^^^^^^^^^^

The Ansible modules can than be placed in a number of directories, depending on your installation and requirements.

.. csv-table::
  :widths: 30, 70

  "``/usr/share/ansible/plugins/modules/``", "System wide installation, modules available to all users"
  "``~/.ansible/plugins/modules/``", "Modules available only to the current user, as the modules are installed in the users home-directory"
  "``/etc/ansible/library/``", "Local installation. As most Ansible installations use the ``/etc/ansible`` directory as the Ansible top-directory (as this is the default in an Ansible installation), this is probably the best installation option. When installing the modules in this directory, the Ansible library path needs to be set in the ``/etc/ansible/ansible.cfg`` file, pointing to the module directory."

.. code-block::

  library = /etc/ansible/library

After installing the Ansible modules a check can be made to determine if the modules are installed correctly. Run the command:

.. code-block:: bash

  ansible-doc -l | grep '^mm_'

This should produce a list with all the Micetro Ansible modules.

Ansible lookup plugins
""""""""""""""""""""""

The set of Ansible Integration modules consists of multiple sets (lookup and inventory) and these should be installed in their own directories.

The lookup plugins can be installed in:

.. csv-table::
  :widths: 30, 70

  "``/usr/share/ansible/plugins/lookup``", "System wide installation, modules available to all users"
  "``~/.ansible/plugins/lookup``", "Plugins available only to the current user, as the plugins are installed in the users home-directory"
  "``/etc/ansible/plugins/lookup``", "Local installation. As most Ansible installations use the ``/etc/ansible`` directory as the Ansible top-directory (as this is the default in an Ansible installation) this is probably the best installation option. When installing the lookup plugins in this directory, the Ansible lookup path needs to be set in the ``/etc/ansible/ansible.cfg`` file, pointing to the lookup plugin directory."

.. code-block::

  lookup_plugins = /usr/share/ansible/plugins/lookup:\
                   /etc/ansible/plugins/lookup

To check if the modules are installed correctly and are available to Ansible, issue the command:

.. code-block:: bash

  ansible-doc -t lookup -l | grep '^mm_'

Which should produce a list with all the Micetro Ansible lookup plugins.

Ansible inventory plugins
"""""""""""""""""""""""""

The inventory plugins can be installed in:

.. csv-table::
  :widths: 30, 70

  "``/usr/share/ansible/plugins/inventory``", "System wide installation, modules available to all users"
  "``~/.ansible/plugins/inventory``", "Plugins available only to the current user, as the plugins are installed in the users home-directory"
  "``/etc/ansible/plugins/inventory``", "Local installation. As most Ansible installations use the ``/etc/ansible`` directory as the Ansible top-directory (as this is the default in an Ansible installation) this is probably the best installation option. When installing the inventory plugins in this directory, the Ansible lookup path needs to be set in the ``/etc/ansible/ansible.cfg`` file, pointing to the lookup plugin directory."

.. code-block::

  inventory_plugins = /usr/share/ansible/plugins/inventory:\
                      /etc/ansible/plugins/inventory

To check if the modules are installed correctly and are available to Ansible, issue the command:

.. code-block:: bash

  ansible-doc -t inventory -l | grep '^mm_'

Which should produce a list with all the Micetro Ansible inventory plugins.

The ``mm_inventory`` plugin also needs some extra configuration, see :ref:`ansible-mm_inventory` for more information.

.. _ansible-api-user:

API user
--------

As the Ansible modules and plugins connect to a Micetro installation, a connection between Ansible and Micetro needs to be made.

API user for Micetro
^^^^^^^^^^^^^^^^^^^^

In Micetro a user needs to be defined that has all rights in Micetro (administrator) so it is able to perform all needed tasks. It is also possible to delegate only certain tasks to certain API users. :ref:`ansible-credentials` gives an overview which rights a required for every module.

API Provider in Ansible
^^^^^^^^^^^^^^^^^^^^^^^

For the Ansible modules and plugins to function correctly a provider has to be defined. This provider consist of a user, password and connection url (``mmurl``) and this provider needs to be defined in the Ansible setup, either through Ansible Tower/AWX or in the Ansible directory.

As the modules and plugins can be used by all systems under Ansible control, it is advised to define the API provider for the all group. Create a file all in the ``/etc/ansible/group_vars`` directory, or the ``/etc/ansible/inventory/group_vars`` directory (if your inventory is a directory instead of a file) which contains something similar to:

.. code-block::
  :linenos:

  ---
  provider:
    mmurl: http://mmsuite.example.net
    user: apiuser
    password: apipasswd

.. note::
  Encrypt the ``apipasswd`` with ``ansible-vault`` to prevent plaintext passwords in the Ansible tree.

An example to achieve this is:

.. code-block:: bash

  printf "apipasswd"             | \
      ansible-vault              \
          encrypt_string         \
          --stdin-name="password"

Which results in:

::

  password: !vault |
    $ANSIBLE_VAULT;1.1;AES256
    3464653838326533616266653.....643434316266666430
    6139656636383537336365313.....336161393439666431
    3539313065656531313838356.....613861623135656634
    6332393063643531390a34366.....323631613034356565
    6138


If an Ansible vault with multiple vault ID’s is needed, please have a look at http://www.tonkersten.com/2019/07/151-ansible-with-multiple-vault-ids/ for more information.

The defined provider can be used in Ansible playbooks like:

Run ansible playbook for another host and delegate to the control node

.. code-block:: yaml

  - name: Claim IP address
    mm_claimip:
      state: present
      ipaddress: 172.16.12.14
      provider: "{{ provider }}"
    delegate_to: localhost

The reason for the ``delegate_to: localhost`` option, is that all commands can be performed on the Ansible control node. So, it is possible to protect the Micetro API to only accept commands from the Ansible control node and not from everywhere. This can also be achieved by creating a playbook that has localhost as the hosts-setting and is specific for the interaction with Micetro.

Run ansible playbook on the Ansible Control node

.. code-block:: yaml

  ---
  - name: host connection example
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Claim IP address
        mm_claimip:
          state: present
          ipaddress: 172.16.12.14
          provider: "{{ provider }}"

.. _ansible-config-example:

Ansible configuration example
-----------------------------

Beneath is an example Ansible configuration file (``ansible.cfg``) with the assumption that all Micetro plugins and modules are installed in the ``/etc/ansible`` directory. Some lines end with a backslash ``\``, which indicates that the following should be appended, but these are split for code clarity.

.. code-block::
  :linenos:

  # ==============================================
  [defaults]
  remote_tmp              = $HOME/.ansible/tmp
  inventory               = inventory
  pattern                 = *
  forks                   = 5
  poll_interval           = 15
  ask_pass                = False
  remote_port             = 22
  remote_user             = ansible
  gathering               = implicit
  host_key_checking       = False
  interpreter_python      = auto_silent
  force_valid_group_names = true
  retry_files_enabled     = False
  callback_whitelist      = minimal, dense, oneline
  stdout_callback         = default
  nocows                  = 0
  library                 = /etc/ansible/library
  action_plugins          = /usr/share/ansible_plugins/action_plugins
  callback_plugins        = /etc/ansible/plugins/callback_plugins
  connection_plugins      = /usr/share/ansible_plugins/connection_plugins
  filter_plugins          = /usr/share/ansible_plugins/filter_plugins
  vars_plugins            = /usr/share/ansible_plugins/vars_plugins
  inventory_plugins       = /usr/share/ansible_plugins/inventory_plugins:\
                            /etc/ansible/plugins/inventory
  lookup_plugins          = /usr/share/ansible_plugins/lookup_plugins:\
                            /etc/ansible/plugins/lookup

  [inventory]
  enable_plugins   = mm_inventory, host_list, auto
  cache            = no
  cache_plugin     = pickle
  cache_prefix     = mm_inv
  cache_timeout    = 60
  cache_connection = /tmp/mm_inventory_cache

  [privilege_escalation]
  become          = False
  become_method   = sudo
  become_user     = root
  become_ask_pass = False
