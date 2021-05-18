.. meta::
   :description: Claiming IP addresses in DHCP in Micetro
   :keywords: IP, IP address, DHCP, Micetro 

.. _ansible-mm_claimip:

mm_claimip
----------

Claim IP addresses in DHCP in Micetro.

Options
^^^^^^^

customproperties:
  Custom properties for the IP address. These properties must already exist. See also :ref:`ansible-mm_props`.

ipaddress:
  (required) The IP address(es) to work on.

provider:
  (required) Definition of the Micetro API provider.

state:
  The state of the claim. (``absent``, ``present``)

Examples
^^^^^^^^

.. code-block:: yaml

  - name: Claim IP address
    mm_claimip:
      state: present
      ipaddress: 172.16.12.14
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost

.. code-block:: yaml

  - name: Release claim on IP addresses
    mm_claimip:
      state: present
      ipaddress:
        - 172.16.12.14
        - 172.16.12.15
        - 172.16.12.16
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
