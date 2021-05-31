.. meta::
   :description: Terraform Micetro by Men&Mice DNS zone 
   :keywords: Terraform, DNS zone

.. _terraform-dns-zone:

menandmice_dns_zone
-------------------

Schema
^^^^^^

Required
""""""""

name
  (String) Fully qualified (with the trailing dot ``.``) name of DNS zone.

server
  (String) Fully qualified name of the DNS server where the record is stored, ending with the trailing dot ``.``.


Optional
""""""""

id
  (String) The ID of this resource.

view
  (String) Name of the view this DNS zone is in.

Read-Only
"""""""""

adintegrated
  (Boolean) If the DNS zone is AD integrated. Default: ``False``.

authority
  (String) The authoritative DNS server for this zone. Requires FQDN with the trailing dot ``.``.

custom_properties
  (Map of String) Map of custom properties associated with this DNS zone.

displayname
  (String) A name that can distinguish the zone from other zone instances with the same name.

dnssecsigned
  (Boolean) If DNS signing is enabled.

dnsviewref
  (String) Internal references to views.

dnsviewrefs
  (Set of String) Internal references to views.

  .. note::
    Only used with Active Directory.

dynamic
  (Boolean) If DNS zone Dynamic, default: ``False``.

kskids
  (String) A comma separated string of IDs of KSKs, starting with active keys, then inactive keys in parenthesis ``()``.

lastmodified
  (String) Date when zone was last modified Micetro.

ref
  (String) Internal references to this DNS zone.

type
  (String) the DNS zone type. For example: ``Master``, ``Slave``, ``Hint``, ``Stub``, ``Forward``.

zskids
  (String) A comma separated string of IDs of ZSKs, starting with active keys, then inactive keys in parenthesis ``()``.

..

  masters
    (List of String) List of all masters IP address, for slave zones.

  adpartition
    (String) The Active Directory partition if the zone is AD-integrated.

  adreplicationtype
    (String) Replication types for an AD-integrated zone.

  created
    (String) Date when zone was created in Micetro.

Import
^^^^^^

Import is supported using the following syntax:

.. code-block::
  :linenos:

  # import with dnszone ref
  terraform import menandmice_dns_zone.resourcename DNSZones/659

  # import with readable name
  terraform import menandmice_dns_zone.resourcename micetro.example.net::zone1  #<server>:<view>:<dnszone name>

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
  data menandmice_dns_zone zone1 {
    name = "zone1.net."
    server = "micetro.example.net."
