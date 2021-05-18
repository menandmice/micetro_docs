.. meta::
   :description: Managing DHCP reservations in Micetro
   :keywords: DHCP, management, reservations, Micetro, Ansible 

.. _ansible-mm_dhcp:

mm_dhcp
-------

Manage DHCP reservations in Micetro.

Options
^^^^^^^

ddnshost:
  The dynamic DNS host to place the entry in.

deleteunspecified:
  Clear properties that are not explicitly set.

filename:
  Filename to place the entry in.

ipaddress:
  (required) The IP address(es) to make a reservation on. When the IP address is changed a new reservation is made. It is not allowed to make reservations in DHCP blocks.

macaddress:
  (required) MAC address for the IP address.

name:
  (required) Name of the reservation

nextserver:
  Next server as DHCP option (bootp).

provider:
  (required) Definition of the Micetro API provider.

servername:
  Server to place the entry in.

state:
  The state of the reservation. (``absent``, ``present``)

Examples
^^^^^^^^

.. code-block:: yaml

  - name: Add a reservation for an IP address
    mm_dhcp:
      state: present
      name: myreservation
      ipaddress: 172.16.17.8
      macaddress: 44:55:66:77:88:99
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
