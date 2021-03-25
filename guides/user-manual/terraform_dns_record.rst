.. _terraform-dns-record:

menandmice_dns_record
---------------------

Schema
^^^^^^

Required
""""""""

data
  (String) The data stored in the DNS record.

name
  (String) The name of DNS record.

server
  (String) The DNS server where this DNS record is stored.

  .. note::
    Needs to be the FQDN, with the trailing dot ``.``.

zone
  (String) The DNS zone were record is in.

Optional
""""""""

aging
  (Number) The aging timestamp of dynamic records in AD integrated zones. Hours since January 1, 1601, UTC.

  .. note::
    Providing a non-zero value creates a dynamic record.

comment
  (String) Comment string for this record.

  .. note::
    Only records in static DNS zones can have a comment string.

enabled
  (Boolean) If this DNS record should enabled. Default: ``True``.

id
  (String) The ID of this resource.

ttl
  (Number) The DNS recod Time To Live. How long (in seconds) the record is allowed to be cached.

type
  (String) The DNS recod type. This can be: ``A``, ``AAAA``, ``CNAME``, ``DNAME``, ``DLV``, ``DNSKEY``, ``DS``, ``HINFO``, ``LOC``, ``MX``, ``NAPTR``, ``NS``, ``NSEC3PARAM``, ``PTR``, ``RP``, ``SOA``, ``SPF``, ``SRV``, ``SSHFP``, ``TLSA``, ``TXT``. Default: ``A``.

view
  (String) The optional view where this DNS record is in. For example: ``internal``.

Read-Only
"""""""""

dns_zone_ref
  (String) Internal reference to the zone the record is in.

ref
  (String) internal reference to this DNS record.

Example
^^^^^^^

.. code-block::

  data menandmice_dns_zone zone1 {
    name = "zone1.net."
    server = "micetro.example.net."
  }

  resource menandmice_dns_record rec2 {
    name    = "test"
    zone    = data.menandmice_dns_zone.zone1.name   # "zone1.net."
    server  = data.menandmice_dns_zone.zone1.server # "micetro.example.net."
    data    = "192.168.2.2" # this will asign/claim  "192.168.2.2" ipam records
    type    = "A"
  }
