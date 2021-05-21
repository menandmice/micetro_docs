.. meta::
   :description: Terraform Men&Mice DNS record 
   :keywords: Terraform, DNS, record  

.. _terraform-dns-record:

menandmice_dns_record
---------------------

Schema
^^^^^^

Required
""""""""

name
  (String) The name of the DNS record.

server
  (String) The DNS server where this DNS record is stored.

  .. note::
    Requires FQDN, with the trailing dot ``.``.

zone
  (String) The DNS zone where the record is stored.

  .. note::
    Requires FQDN, with the trailing dot ``.``.

type
  (String) The DNS recod type. This can be: ``A``, ``AAAA``, ``CNAME``, ``DNAME``, ``DLV``, ``DNSKEY``, ``DS``, ``HINFO``, ``LOC``, ``MX``, ``NAPTR``, ``NS``, ``NSEC3PARAM``, ``PTR``, ``RP``, ``SOA``, ``SPF``, ``SRV``, ``SSHFP``, ``TLSA``, ``TXT``. Default: ``A``.

Optional
""""""""

id
  (String) The ID of this resource.

view
  (String) The optional view where this DNS record is in. For example: ``internal``.

Read-Only
"""""""""

ttl
  (Number) The DNS record's Time To Live value in seconds, setting how long the record is allowed to be cached.

aging
  (Number) The aging timestamp of dynamic records in AD integrated zones. Hours since January 1, 1601, UTC.

  .. note::
    Providing a non-zero value creates a dynamic record.

comment
  (String) Comment string for this record.

  .. note::
    Only records in static DNS zones can have a comment string.

    Some cloud DNS provides do not support comments.

enabled
  (Boolean) If this DNS record should enabled. Default: ``True``.

data
  (String) The data stored in the DNS record.

dns_zone_ref
  (String) Internal reference to the zone where this DNS record is stored.

ref
  (String) Internal reference to this DNS record.

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
  }

  data menandmice_dns_record rec1 {
    name = "test"
    zone = data.menandmice_dns_zone.zone1.name  # "zone1.net."
    server = "micetro.example.net."
    type = "A"
  }
