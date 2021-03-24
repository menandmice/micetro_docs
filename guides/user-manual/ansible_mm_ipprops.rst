.. _ansible-mm_ipprops:

mm_ipprops
----------

Set properties on an IP address in Micetro.

Options
^^^^^^^

deleteunspecified:
  Clear properties that are not explicitly set.

ipaddress:
  (required) The IP address(es) to work on.

properties:
  (required) Custom properties for the IP address. These properties must already be defined.

provider:
  (required) Definition of the Men&Mice suite API provider.

state:
  Property present or not. (``absent``, ``present``)

Examples
^^^^^^^^

.. code-block:: yaml

  - name: Set properties on IP
    mm_ipprops:
      state: present
      ipaddress: 172.16.12.14
      properties:
        claimed: false
        location: London
      provider:
        mmurl: http://mmsuite.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
