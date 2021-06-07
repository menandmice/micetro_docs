.. meta::
   :description: Managing user accounts and user properties in Micetro by Men&Mice
   :keywords: User properties in Micetro, Micetro by Men&Mice, DNS administrator, IPAM administrator, DHCP administrator
   
.. _ansible-mm_user:

mm_user
-------

Manage user accounts and user properties in Micetro.

Options
^^^^^^^

authentication_type:
  Authentication type to use. e.g. Internal, AD. Required if ``state=present``.

descr:
  Description of the user.

email:
  The users email address.

groups:
  Make the user a member of these groups.

name:
  (required) Name of the user to create, remove or modify.

password:
  Users password (plaintext). Required if ``state=present``.

provider:
  (required) Definition of the Micetro API provider.

roles:
  Make the user a member of these roles.

state:
  Should the users account exist or not. (``absent``, ``present)``

Examples
^^^^^^^^

.. code-block:: yaml

  - name: Add the user 'mauricem' as an admin
    mm_user:
      username: mauricem
      password: password
      full_name: John Doe
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
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost

.. code-block:: yaml

  - name: Remove user 'mauricem'
    mm_user:
      username: mauricem
      state: absent
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
