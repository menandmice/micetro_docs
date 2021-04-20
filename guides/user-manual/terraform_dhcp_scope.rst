.. _terraform-dhcp-reservations:

menandmice_dhcp_scope
---------------------

Schema
^^^^^^

Required
""""""""

cidr
  (String) The cidr of the DHCP scope.

Optional
""""""""

dhcp_server
  (String) The DHCP server of this scope.

id
  (String) The ID of this resource.

Read-Only
"""""""""

available
  (Number) Number of available addresses in the address pool(s) of the scope.

description
  (String) A description for the DHCP scope.

enabled
  (Boolean) If this scope is enabled.

name
  (String) The name of the DHCP scope you want to query.

ref
  (String) Internal reference to this DHCP reservation.

superscope
  (String) The name of the superscope for the DHCP scope.

  .. note::
    Only applicable for MS DHCP servers.

Example
^^^^^^^

.. code-block::
  :linenos:

  terraform {
    required_providers {
      menandmice = {
        # uncomment for terraform 0.13 and higher
        version = "~> 0.2",
        source  = "local/menandmice",
        }
      }
  }

  data menandmice_dhcp_scope scope1{
    dhcp_server= "micetro.example.net."
    cidr = "192.168.2.0/24"
  }
