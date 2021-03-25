.. _ansible-playbooks:

Example playbooks
=================

To use the Micetro Ansible Integration you need to create Ansible playbooks that utilize the functionality of Micetro.

Following are a couple of example playbooks for inspiration. These playbooks have been tested extensively with different operating systems, versions of Ansible and Python.

.. contents::

play-user
---------

.. code-block:: yaml

  ---
  #
  # Add, delete and change users in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice users test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Get the free IP address and show info
        debug:
          msg:
            - "Ansible version    : {{ ansible_version.full }}"
            - "Python version     : {{ ansible_facts['python_version'] }}"
            - "Python executable  : {{ ansible_facts['python']['executable'] }}"

      - name: Add the user 'mauricem' as an admin
        mm_user:
          username: mauricem
          password: password
          full_name: Maurice Moss
          state: present
          authentication_type: internal
          roles:
            - Administrators (built-in)
            - DNS Administrators (built-in)
            - DHCP Administrators (built-in)
            - IPAM Administrators (built-in)
            - User Administrators (built-in)
            - Approvers (built-in)
            - Requesters (built-in)
          provider: "{{ provider }}"

      - name: Check idempotency
        mm_user:
          username: mauricem
          password: password
          full_name: Maurice Moss
          state: present
          authentication_type: internal
          roles:
            - Administrators (built-in)
            - DNS Administrators (built-in)
            - DHCP Administrators (built-in)
            - IPAM Administrators (built-in)
            - User Administrators (built-in)
            - Approvers (built-in)
            - Requesters (built-in)
          provider: "{{ provider }}"

      - name: Change the groups
        mm_user:
          username: mauricem
          password: password
          full_name: Maurice Moss
          state: present
          authentication_type: internal
          roles:
            - Administrators (built-in)
            - User Administrators (built-in)
            - Approvers (built-in)
            - Requesters (built-in)
          provider: "{{ provider }}"

      - name: Check idempotency again
        mm_user:
          username: mauricem
          password: password
          full_name: Maurice Moss
          state: present
          authentication_type: internal
          roles:
            - Administrators (built-in)
            - User Administrators (built-in)
            - Approvers (built-in)
            - Requesters (built-in)
          provider: "{{ provider }}"

      - name: Remove the user again
        mm_user:
          username: mauricem
          state: absent
          provider: "{{ provider }}"

play-group
----------

.. code-block:: yaml

  ---
  #
  # Add, delete and change groups in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice users test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Get the free IP address and show info
        debug:
          msg:
            - "Ansible version    : {{ ansible_version.full }}"
            - "Python version     : {{ ansible_facts['python_version'] }}"
            - "Python executable  : {{ ansible_facts['python']['executable'] }}"

      - name: Add the 'local' group
        mm_group:
          name: local
          desc: A local rgroup
          state: present
          users:
            - mauricemoss
            - jenbarber
          provider: "{{ provider }}"

      - name: Check idempotency
        mm_group:
          name: local
          desc: A local group
          state: present
          users:
            - mauricemoss
            - jenbarber
          provider: "{{ provider }}"

      - name: Add nonexisting user to group
        mm_group:
          name: local
          desc: A local group
          state: present
          users:
            - roy
          provider: "{{ provider }}"
        ignore_errors: true

      - name: Remove the 'local' group
        mm_group:
          name: local
          state: absent
          provider: "{{ provider }}"

play-role
---------

.. code-block:: yaml

  ---
  #
  # Add, delete and change roles in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice users test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Get the free IP address and show info
        debug:
          msg:
            - "Ansible version    : {{ ansible_version.full }}"
            - "Python version     : {{ ansible_facts['python_version'] }}"
            - "Python executable  : {{ ansible_facts['python']['executable'] }}"

      - name: Add the 'local' role
        mm_role:
          name: local
          desc: A local role
          state: present
          users:
            - mauricemoss
            - jenbarber
          provider: "{{ provider }}"

      - name: Check idempotency
        mm_role:
          name: local
          desc: A local role
          state: present
          users:
            - mauricemoss
            - jenbarber
          provider: "{{ provider }}"

      - name: Add nonexisting user to role
        mm_role:
          name: local
          desc: A local role
          state: present
          users:
            - roy
          provider: "{{ provider }}"
        ignore_errors: true

      - name: Remove the 'local' role
        mm_role:
          name: local
          state: absent
          provider: "{{ provider }}"

play-props
----------

.. code-block:: yaml

  ---
  #
  # Set, delete and change custom properties in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice Custom Properties test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Ansible information
        debug:
          msg:
            - "Ansible version   : {{ ansible_version.full }}"
            - "Python version    : {{ ansible_facts['python_version'] }}"
            - "Python executable : {{ ansible_facts['python']['executable'] }}"

      - name: Set text property
        mm_props:
          state: present
          name: MyProperty
          proptype: text
          dest: dnsserver
          listitems:
            - Paul
            - Daniel
            - April
            - Nolan
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Check idempotentie
        mm_props:
          state: present
          name: MyProperty
          proptype: text
          dest: dnsserver
          listitems:
            - Paul
            - Daniel
            - April
            - Nolan
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Change type - not allowed
        mm_props:
          state: present
          name: MyProperty
          proptype: yesno
          dest: dnsserver
          listitems:
            - Paul
            - Daniel
            - April
            - Nolan
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Change list around
        mm_props:
          state: present
          name: MyProperty
          proptype: text
          dest: dnsserver
          listitems:
            - Paul
            - Daniel
            - April
            - Nolan
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Remove property
        mm_props:
          state: absent
          name: MyProperty
          proptype: text
          dest: dnsserver
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Remove property - again
        mm_props:
          state: absent
          name: MyProperty
          proptype: yesno
          dest: dnsserver
          provider: "{{ provider }}"
        delegate_to: localhost

play-claimip
------------

.. code-block:: yaml

  ---
  #
  # Claim and release an IP address in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  #
  - name: Men&Mice ClaimIP test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Ansible information
        debug:
          msg:
            - "Ansible version   : {{ ansible_version.full }}"
            - "Python version    : {{ ansible_facts['python_version'] }}"
            - "Python executable : {{ ansible_facts['python']['executable'] }}"

      - name: Claim IP address
        mm_claimip:
          state: present
          ipaddress: 172.16.12.14
          provider: "{{ provider }}"

      - name: Check idempotentie
        mm_claimip:
          state: present
          ipaddress: 172.16.12.14
          provider: "{{ provider }}"

      - name: Unclaim IP address
        mm_claimip:
          state: present
          ipaddress: 172.16.12.14
          provider: "{{ provider }}"

      # This task claims an IP address that cannot exit
      # and returns a warning because of that
      - name: Claim erroneous IP address
        mm_claimip:
          state: present
          ipaddress: 456.978.12.14
          provider: "{{ provider }}"

play-dhcp
---------

.. code-block:: yaml

  ---
  #
  # Make a DHCP reservation and release it in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice DHCP test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Ansible information
        debug:
          msg:
            - "Ansible version   : {{ ansible_version.full }}"
            - "Python version    : {{ ansible_facts['python_version'] }}"
            - "Python executable : {{ ansible_facts['python']['executable'] }}"

      - name: Add a reservation for an IP address
        mm_dhcp:
          state: present
          name: myreservation
          ipaddress: 172.16.17.8
          macaddress: 44:55:66:77:88:00
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: check idempotentie
        mm_dhcp:
          state: present
          name: myreservation
          ipaddress: 172.16.17.8
          macaddress: 44:55:66:77:88:00
          provider: "{{ provider }}"
        delegate_to: localhost

      # Changing the MAC address of a reservation is not allowed, as this
      # would alter the reservation. To achieve this, release the reservation
      # and reclaim it.
      - name: change mac
        mm_dhcp:
          state: present
          name: myreservation
          ipaddress: 172.16.17.8
          macaddress: 44:55:66:77:88:99
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: change ip
        mm_dhcp:
          state: present
          name: myreservation
          ipaddress: 172.16.17.9
          macaddress: 44:55:66:77:88:99
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: change name
        mm_dhcp:
          state: present
          name: movemyreservation
          ipaddress: 172.16.17.9
          macaddress: 44:55:66:77:88:99
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: delete reservation (wrong one)
        mm_dhcp:
          state: absent
          name: movemyreservation
          ipaddress: 172.16.17.9
          macaddress: 44:55:66:77:88:99
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: delete reservation (correct one)
        mm_dhcp:
          state: absent
          name: myreservation
          ipaddress: 172.16.17.8
          macaddress: 44:55:66:77:88:99
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: create reservation in invalid range
        mm_dhcp:
          state: present
          name: reservationnonet
          ipaddress: 172.16.17.58
          macaddress: 44:55:66:77:88:99
          provider: "{{ provider }}"
        delegate_to: localhost

play-zone
---------

.. code-block:: yaml

  ---
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice DHCP test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Ansible information
        debug:
          msg:
            - "Ansible version   : {{ ansible_version.full }}"
            - "Python version    : {{ ansible_facts['python_version'] }}"
            - "Python executable : {{ ansible_facts['python']['executable'] }}"

      - name: Ensure the zone
        mm_zone:
          state: present
          name: example.com
          nameserver: mandm.example.com
          authority: mandm.example.net
          masters: mandm.example.net
          servtype: master
          customproperties:
            owner: Reynholm Industries
            place: London
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Remove the zone
        mm_zone:
          state: absent
          name: example.com
          provider: "{{ provider }}"
        delegate_to: localhost

play-dnsrecord
--------------

.. code-block:: yaml

  ---
  #
  # Set and change a DNS record in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice DNSRecord test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Ansible information
        debug:
          msg:
            - "Ansible version   : {{ ansible_version.full }}"
            - "Python version    : {{ ansible_facts['python_version'] }}"
            - "Python executable : {{ ansible_facts['python']['executable'] }}"

      - name: Set DNS record
        mm_dnsrecord:
          state: present
          name: reynholm
          rrtype: A
          dnszone: testzone
          data: 192.168.10.12
          comment: From The API side
          ttl: 86400
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Check idempotentie
        mm_dnsrecord:
          state: present
          name: reynholm
          rrtype: A
          dnszone: testzone
          data: 192.168.10.12
          comment: From The API side
          ttl: 86400
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Set DNS record with erroneous values
        mm_dnsrecord:
          state: present
          name: reynholm
          rrtype: AAAA
          dnszone: testzone
          data: 192.168.10.127
          comment: From The API side
          ttl: apple
          provider: "{{ provider }}"
        delegate_to: localhost
        ignore_errors: true

      - name: Change record
        mm_dnsrecord:
          state: present
          name: reynholm
          rrtype: A
          dnszone: testzone
          data: 192.168.10.14
          comment: From The API side
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Do something stupid
        mm_dnsrecord:
          state: present
          name: reynholm
          rrtype: A
          dnszone: notthetestzone
          data: 192.168.90.14
          comment: Welcome to the error
          provider: "{{ provider }}"
        delegate_to: localhost
        ignore_errors: true

      - name: Do more something stupid things
        mm_dnsrecord:
          state: present
          name: reynholm
          rrtype: A
          dnszone: testzone
          data: 192.168.390.14
          comment: Welcome to the error
          provider: "{{ provider }}"
        delegate_to: localhost
        ignore_errors: true

      - name: Remove record
        mm_dnsrecord:
          state: absent
          name: reynholm
          dnszone: notthetestzone
          data: 192.168.90.14
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Remove record - again
        mm_dnsrecord:
          state: absent
          name: reynholm
          dnszone: notthetestzone
          data: 192.168.90.14
          provider: "{{ provider }}"
        delegate_to: localhost

play-freeip
-----------

.. code-block:: yaml

  ---
  #
  # Find a set of free IP addresses in a range in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice FreeIP test play
    hosts: localhost
    connection: local
    become: false

    vars:
      network:
        - examplenet

    tasks:
      - name: Set free IP addresses as a fact
        set_fact:
          freeips: "{{ query('mm_freeip',
                           provider,
                           network,
                           multi=25,
                           claim=60,
                           excludedhcp=True,
                           ping=True)
                 }}"

      - name: Get the free IP address and show info
        debug:
          msg:
            - "Free IPs           : {{ freeips }}"
            - "Queried network(s) : {{ network }}"
            - "Ansible version    : {{ ansible_version.full }}"
            - "Python version     : {{ ansible_facts['python_version'] }}"
            - "Python executable  : {{ ansible_facts['python']['executable'] }}"

      - name: Loop over IP addresses
        debug:
          msg:
            - "Next free IP       : {{ item }}"
        loop: "{{ freeips }}"

play-ipinfo
-----------

.. code-block:: yaml

  ---
  #
  # Get all info for an IP address in Micetro example
  #
  # The file <ansible_topdir>/group_vars/all contains:
  #
  #    ---
  #    provider:
  #      mmurl: http://micetro.example.net
  #      user: apiuser
  #      password: apipasswd
  #
  - name: Men&Mice IP Info test play
    hosts: localhost
    connection: local
    become: false

    tasks:
      - name: Get get IP info
        set_fact:
          ipinfo: "{{ query('mm_ipinfo', provider, '172.16.17.2') | to_nice_json }}"

      - name: Show Ansible and Python information
        debug:
          msg:
            - "Ansible version    : {{ ansible_version.full }}"
            - "Python version     : {{ ansible_facts['python_version'] }}"
            - "Python executable  : {{ ansible_facts['python']['executable'] }}"

      - name: Show all infor for this IP address
        debug:
          var: ipinfo

      # This task tries to get the information for a non-existing IP address
      # which results in a fatal `Object not found for reference` error
      - name: Get get IP info for a non existing IP address
        set_fact:
          ipinfo: "{{ query('mm_ipinfo', provider, '390.916.17.2') | to_nice_json }}"
        ignore_errors: true

play_it_all
-----------

Example of a playbook that combines functionality

.. code-block:: yaml

  ---
  - name: Men&Mice test play
    hosts: localhost
    connection: local
    become: false

    vars:
      network: examplenet

    tasks:
      # Some extra information about Ansible and the used
      # Python version
      - name: Ansible information
        debug:
          msg:
            - "Ansible version   : {{ ansible_version.full }}"
            - "Python version    : {{ ansible_facts['python_version'] }}"
            - "Python executable : {{ ansible_facts['python']['executable'] }}"

      # The `ipaddr` filter needs the Python `netaddr` module, so make sure
      # this is installed
      # The `ipaddr` is used to determine the reverse IP address
      #
      # For example:
      #   vars:
      #     ipa4: "172.16.17.2"
      #     ipa6: "2001:785:beef:1:f2c4:8f9d:b554:e614"
      #
      #   - "Forward IPv4 address : {{ ipa4 }}"
      #   - "Forward IPv4 address : {{ ipa4 }}"
      #   - "Reverse IPv4 address : {{ ipa4 | ipaddr('revdns') }}"
      #   - "Reverse IPv6 address : {{ ipa6 | ipaddr('revdns') }}"
      #   - "Reverse IPv4 zone    : {{ (ipa4 | ipaddr('revdns')).split('.')[1:]  | join('.') }}"
      #   - "Reverse IPv6 zone    : {{ (ipa6 | ipaddr('revdns')).split('.')[16:] | join('.') }}"
      #
      # The reverse zones are split on '.' and only the last part is
      # used (in this example). The reverse for IPv4 assumes a '/24' network
      # and the '16' in the IPv6 zone conversion is for a '/64' network. Adapt these to your
      # own needs (e.g. '2' for a '/16' network on IPv4 or '20' for an IPv6 '/48' net.

      - name: Ensure the netaddr module is installed for Python 2
        pip:
          name: netaddr
          state: present
        when: ansible_facts['python_version'] is version('3', '<')
        become: true

      - name: Ensure the netaddr module is installed for Python 3
        pip:
          name: netaddr
          state: present
          executable: pip3
        when: ansible_facts['python_version'] is version('3', '>=')
        become: true

      - name: define custom properties for IP addresses
        mm_props:
          name: location
          state: present
          proptype: text
          dest: ipaddress
          provider: "{{ provider }}"

      # The above example defines just a single property.
      # Defining multiple properties can be achieved by using
      # the Ansible loop functionality.
      #
      # - name: Example of multiple properties
      #   mm_props:
      #      name: "{{ item.name }}"
      #      state: "{{ item.state }}"
      #      proptype: "{{ item.proptype }}"
      #      dest: "{{ item.dest }}"
      #  loop:
      #    - name: location
      #      state: present
      #      proptype: text
      #      dest: ipaddress
      #    - name: owner
      #      state: present
      #      proptype: text
      #      dest: ipaddress

      # When running an Ansible lookup plugin, this lookup action takes
      # place every time the variable is referenced. So it will not be
      # possible to claim an IP address for further reference, this way.
      # This has to do with the way Ansible works.  A solution for this
      # is to assign all collected free IP addresses to an Ansible fact,
      # but here you need to make sure the factname is not used over
      # multiple hosts.
      - name: get free IP addresses and set it as a fact
        set_fact:
          freeips: "{{ query('mm_freeip', provider, network, claim=60, excludedhcp=True) }}"

      - name: Get the free IP address and show info
        debug:
          msg:
            - "Free IPs           : {{ freeips }}"
            - "Queried network(s) : {{ network }}"

      # Make a DHCP reservation for this address
      # So claim it after DNS setting.
      - name: Reservation on IP address
        mm_dhcp:
          state: present
          name: testhost
          ipaddress: "{{ freeips }}"
          macaddress: "de:ad:be:ef:16:10"
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Set properties on IP
        mm_ipprops:
          state: present
          ipaddress: "{{ freeips }}"
          properties:
            claimed: false
            location: London
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Ensure the zone
        mm_zone:
          state: present
          name: thetestzone.com
          nameserver: mandm.example.com
          authority: mandm.example.net
          masters: mandm.example.net
          servtype: master
          provider: "{{ provider }}"
        delegate_to: localhost

      # The `mm_freeip` plugin always returns a list, but the request was for just 1
      # IP address. The `mm_dnsrecord` only needs a single IP address. That's why the
      # list-slice `[0]` is used.
      - name: Set a DNS record for the claimed IP
        mm_dnsrecord:
          dnszone: testzone
          name: testhost
          data: "{{ freeips[0] }}"
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Set a PTR DNS record for the claimed IP
        mm_dnsrecord:
          dnszone: "{{ (freeips[0] | ipaddr('revdns')).split('.')[1:]  | join('.') }}"
          name: "{{ freeips[0] | ipaddr('revdns') }}"
          data: "testhost.testzone."
          rrtype: PTR
          provider: "{{ provider }}"
        delegate_to: localhost

      # The `mm_ipinfo` returns all known information of an IP
      # address. This can be used to query certain properties, or
      # for debugging.
      - name: Get all info for this IP address
        debug:
          var: freeipinfo
        vars:
          freeipinfo: "{{ query('mm_ipinfo', provider, freeips[0]) | to_nice_json }}"

      - name: Renew properties on IP
        mm_ipprops:
          state: present
          ipaddress: "{{ freeips }}"
          properties:
            claimed: false
            location: Madrid
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Get all info for this IP address
        debug:
          var: freeipinfo
        vars:
          freeipinfo: "{{ query('mm_ipinfo', provider, freeips[0]) | to_nice_json }}"

      - name: Remove properties of IP
        mm_ipprops:
          state: present
          ipaddress: "{{ freeips }}"
          deleteunspecified: true
          properties:
            claimed: false
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Get all info for this IP address
        debug:
          var: freeipinfo
        vars:
          freeipinfo: "{{ query('mm_ipinfo', provider, freeips[0]) | to_nice_json }}"

      - name: Remove reservation on IP address
        mm_dhcp:
          state: absent
          name: testhost
          ipaddress: "{{ freeips }}"
          macaddress: "de:ad:be:ef:16:10"
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Get all info for this IP address
        debug:
          var: freeipinfo
        vars:
          freeipinfo: "{{ query('mm_ipinfo', provider, freeips[0]) | to_nice_json }}"

      - name: Remove DNS record for the claimed IP
        mm_dnsrecord:
          state: absent
          dnszone: testzone
          name: testhost
          data: "{{ freeips[0] }}"
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Remove the PTR DNS record for the claimed IP
        mm_dnsrecord:
          state: absent
          dnszone: "{{ (freeips[0] | ipaddr('revdns')).split('.')[1:]  | join('.') }}"
          name: "{{ freeips[0] | ipaddr('revdns') }}"
          data: "testhost.testzone."
          rrtype: PTR
          provider: "{{ provider }}"
        delegate_to: localhost

      - name: Get all info for this IP address
        debug:
          var: freeipinfo
        vars:
          freeipinfo: "{{ query('mm_ipinfo', provider, freeips[0]) | to_nice_json }}"

      - name: Ensure the zone absent
        mm_zone:
          state: absent
          name: thetestzone.com
          nameserver: mandm.example.com
          authority: mandm.example.net
          masters: mandm.example.net
          servtype: master
          provider: "{{ provider }}"
        delegate_to: localhost
