.. _ansible-mm_freeip:

mm_freeip plugin
----------------

This Men&Mice FreeIP lookup plugin finds one or more free IP addresses in a certain network, defined in Micetro.

Options
^^^^^^^

claim:
  Claim the IP address(es) for the specified amount of time in seconds

excludedhcp:
  exclude DHCP reserved ranges from result

filter:
  Micetro filter statement. Filter validation is done by Micetro, not in the plugin. More filter info: :ref:`quickfilter`

multi:
  Get a list of x number of free IP addresses from the requested zones.

network:
  (required) Network zone(s) from which the first free IP address is to be found. This is either a single network or a list of networks

ping:
  ping the address found before returning.

provider:
  (required) Definition of the Micetro API provider.

Usage
^^^^^

When using the Men&Mice FreeIP plugin something needs to be taken into account. When running an Ansible lookup plugin, this lookup action takes place every time the variable is referenced. So it will not be possible to claim an IP address for further reference, this way. This has to do with the way Ansible works. A solution for this is to assign all collected IP addresses to an Ansible fact, but here you need to make sure the factname is not used over multiple hosts.

Example usage
^^^^^^^^^^^^^

Claim IP addresses in one or more ranges

.. code-block:: yaml

  ---
  - name: Men&Mice FreeIP test play
    hosts: localhost
    connection: local
    become: false

    vars:
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipassword
      network: examplenet

    tasks:
      - name: Set free IP addresses as a fact
        set_fact:
          freeips: "{{ query('mm_freeip',
                             provider,
                             network,
                             multi=15,
                             claim=60,
                             startaddress='192.168.63.100',
                             excludedhcp=True,
                             ping=True)
                   }}"

      - name: Get the free IP address and show info
        debug:
          msg:
            - "Free IPs          : {{ freeips }}"
            - "Queried network   : {{ network }}"
            - "Ansible version   : {{ ansible_version.full }}"
            - "Python version    : {{ ansible_facts['python_version'] }}"
            - "Python executable : {{ ansible_facts['python']['executable'] }}"

      - name: Loop over IP addresses
        debug:
          msg:
            - "Next free IP      : {{ item }}"
        loop: "{{ freeips }}"

::

  # ansible-playbook mmtest.yml

  PLAY [Men&Mice FreeIP test play] *************************************

  TASK [Gathering Facts] ***********************************************
  ok: [localhost]

  TASK [Set free IP addresses as a fact] *******************************
  ok: [localhost]

  TASK [Get the free IP address and show info] *************************
  ok: [localhost] => {
      "msg": [
          "Free IPs          : ['192.168.63.203', '192.168.63.204']",
          "Queried network   : nononet",
          "Ansible version   : 2.9.7",
          "Python version    : 3.6.8",
          "Python executable : /usr/libexec/platform-python"
      ]
  }

  TASK [Loop over IP addresses] ****************************************
  ok: [localhost] => (item=192.168.63.203) => {
      "msg": [
          "Next free IP      : 192.168.63.203"
      ]
  }
  ok: [localhost] => (item=192.168.63.204) => {
      "msg": [
          "Next free IP      : 192.168.63.204"
      ]
  }

  PLAY RECAP ***********************************************************
  localhost : ok=4  changed=0  unreachable=0  failed=0  skipped=0  rescued=0  ignored=0
