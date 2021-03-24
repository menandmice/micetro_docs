.. _ansible-mm_group:

mm_group
--------

Manage groups in Micetro.

Options
^^^^^^^

descr:
  Description of the group.

name:
  (required) Name of the group to create, remove or modify.

provider:
  (required) Definition of the Micetro API provider.

roles:
  List of roles to add to this group.

state:
  Should the role exist or not. (``absent``, ``present``)

users:
  List of users to add to this group.

Examples
^^^^^^^^

.. code-block:: yaml

  - name: Add the 'local' group
    mm_group:
      name: local
      desc: A local group
      state: present
      users:
        - johndoe
      roles:
        - IPAM Administrators (built-in)
    provider:
      mmurl: http://mmsuite.example.net
      user: apiuser
      password: apipasswd
    delegate_to: localhost

.. code-block:: yaml

  - name: Remove the 'local' group
    mm_group:
      name: local
      state: absent
      provider:
        mmurl: http://mmsuite.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
