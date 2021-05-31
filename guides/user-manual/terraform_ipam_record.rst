.. meta::
   :description: Terraform IPAM record in Micetro by Men&Mice
   :keywords: terraform, IPAM, IPAM record

.. _terraform-ipam-record:

menandmice_ipam_record
----------------------

Schema
^^^^^^

Required
""""""""

address
  (String) The IP address.

Optional
""""""""

id
  (String) The ID of this resource.

Read-Only
"""""""""

claimed
  (Boolean) If the IP address is claimed. Default: ``true``.

custom_properties
  (Map of String) Map of custom properties associated with this IP address.

  .. note::
    You can only assign properties that are already defined in Micetro.

device
  (String) The device associated with the object.

discovery_type
  (String) The discovery method of the IP address. For example: ``None``, ``Ping``, ``ARP``, ``Lease``, ``Custom``.

extraneous_ptr
  (Boolean) Contains ``true`` if there are extraneous PTR records for the record.

hold_info
  (List of Object) Contains information about who holds the otherwise free IP, and for how long. (See :ref:`terraform-nestedatt-hold_info`.)

interface
  (String) The interface associated with the object.

last_discovery_date
  (String) The date when the system last performed IP address discovery for this IP address.

last_known_client_identifier
  (String) The last known MAC address associated with the IP address discovery information.

last_seen_date
  (String) The date when the address was last seen during IP address discovery.

ptr_status
  (String) PTR record status. For example: ``Unknown``, ``OK``, ``Verify``.

ref
  (String) Internal reference for the IP address.

state
  (String) state of IP address. For example: ``Free``, ``Assigned``, ``Claimed``, ``Pending``, ``Held``.

usage
  (Number) IP address usage bitmask.

..

  free_ip
    (Block List, Max: 1) Find a free IP address to claim (see :ref:`terraform-ipam-nested`).

.. _terraform-nestedatt-hold_info:

Nested Schema for ``hold_info``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Read-Only:
""""""""""

expiry_time
  (String)

username
  (String)

..

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

  terraform {
    required_providers {
      menandmice = {
        # uncomment for terraform 0.13 and higher
        version = "~> 0.2",
        source  = "local/menandmice",
      }
    }
  }
  data menandmice_ipam_record ipam1 {
    address = "192.168.2.2"
  }
