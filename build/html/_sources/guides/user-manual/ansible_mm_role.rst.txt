.. meta::
   :description: Managing roles in Micetro by Men&Mice
   :keywords: Micetro, DDI, Ansible

.. _ansible-mm_role:

mm_role
-------

Manage roles in Micetro.

Options
^^^^^^^

descr:
  Description of the role.

groups:
  List of groups to add to this role

name:
  (required) Name of the role to create, remove or modify.

provider:
  (required) Definition of the Micetro API provider.

state:
  Should the role exist or not. (``absent``, ``present``)

users:
  List of users to add to this role

Examples
^^^^^^^^

.. code-block:: yaml

  - name: Add the 'local' role
    mm_role:
      name: local
      desc: A local role
      state: present
    provider:
      mmurl: http://micetro.example.net
      user: apiuser
      password: apipasswd
    delegate_to: localhost

.. code-block:: yaml

  - name: Remove the 'local' role
    mm_role:
      name: local
      state: absent
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
