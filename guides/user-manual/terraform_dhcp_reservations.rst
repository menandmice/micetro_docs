.. meta::
   :description: The Micetro by Men&Mice DHCP reservation 
   :keywords: Terraform, DHCP reservation 

.. _terraform-dhcp-reservations:

menandmice_dhcp_reservation
---------------------------

Schema
^^^^^^

Required
""""""""

name
  (String) The name of DHCP reservation you want to query.

Optional
""""""""

id
  (String) The ID of this resource.

Read-Only
"""""""""

addresses
  (List of String) A list of IP addresses used for the reservation.

client_identifier
  (String) The ``client_identifier`` of this reservation.

ddns_hostname
  (String) Dynamic DNS host name for reservation.

  .. note::
    Only applicable for ISC DHCP servers.

description
  (String) Description for the reservation.

  .. note::
    Only applicable for MS DHCP servers.

filename
  (String) The filename DHCP option.

  .. note::
    Only applicable for ISC DHCP servers.

next_server
  (String) The next-server ISC DHCP option.

  .. note::
    Only applicable for ISC DHCP servers.

reservation_method
  (String) DHCP reservation method, For example: ``HardwareAddress``, ``ClientIdentifier``. Default: ``HardwareAddress``.

servername
  (String) The server-name DHCP option.

  .. note::
    Only applicable for ISC DHCP servers.

type
  (String) The type of this DHCP reservation. For example: ``DHCP``, ``BOOTP``, ``BOTH``.

owner_ref
  (String) Internal reference to the DHCP group scope or server where this reservation is made.

ref
  (String) Internal reference to this DHCP reservation.

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
  data menandmice_dhcp_reservation reservation1 {
     name = "reserved1"
  }
