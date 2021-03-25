.. _terraform-ipam-record:

menandmice_ipam_record
----------------------

Schema
^^^^^^

Optional
""""""""

address
  (String) The IP address to claim.

claimed
  (Boolean) If address should be claimed. Default: ``true``.

custom_properties
  (Map of String) Map of custom properties associated with this IP address. You can only assign properties that are already defined via properties definition.

free_ip
  (Block List, Max: 1) Find a free IP address to claim (see :ref:`terraform-ipam-nested`).

id
  (String) The ID of this resource.

Read-Only
"""""""""

device
  (String) The device associated with the record.

discovery_type
  (String) Way IP address use is dicovered. For example: ``None``, ``Ping``, ``ARP``, ``Lease``, ``Custom``.

extraneous_ptr
  (Boolean) Contains ``true`` if there are extraneous PTR records for the record.

interface
  (String) The interface associated with the record.

last_discovery_date
  (String) The date when the system last performed IP address discovery for this IP address.

last_known_client_identifier
  (String) The MAC address associated with the IP address discovery info.

last_seen_date
  (String) The date when the address was last seen during IP address discovery.

ptr_status
  (String) PTR record status. For example: ``Unknown``, ``OK``, ``Verify``.

ref
  (String) Internal reference to IPAM record.

state
  (String) state of IP address. For example: ``Free``, ``Assigned``, ``Claimed``, ``Pending``, ``Held``.

usage
  (Number) IP address usage bitmask.

.. _terraform-ipam-nested:

Nested Schema for free_ip
^^^^^^^^^^^^^^^^^^^^^^^^^

Required
""""""""

range
  (String) pick IP address from range with name.

Optional
""""""""

exclude_dhcp
  (Boolean) Exclude IP address that are Assigned via DHCP.

ping
  (Boolean) Verify ip is free with ``ping``.

start_at
  (String) Start searching for IP from.

temporary_claim_time
  (Number) Time in seconds to temporary claim IP address. So it won't be claimed by others, when the claim is in progress.

Example
^^^^^^^

.. code-block::

  resource menandmice_ipam_record ipam2 {
    address = "192.168.2.3"
    custom_properties = {"location":"here"}
    claimed = true
  }
