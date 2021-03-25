.. _terraform-dns-zone:

menandmice_dns_zone
-------------------

Schema
^^^^^^

Required
""""""""

authority
  (String) the DNS authoritive server for this zone.

name
  (String) fully qualified (with the trailing dot ``.``) name of DNS zone.


Optional
""""""""

adintegrated
  (Boolean) If DNS zone is intergrated with Active Directory. Default: ``False``.

adpartition
  (String) The Active Directory partition if the zone is AD-integrated.

adreplicationtype
  (String) Replication types for an AD-integrated zone.

custom_properties
  (Map of String) Map of custom properties associated with this DNS zone.

displayname
  (String) A name that can distinguish the zone from other zone instances with the same name.

dnssecsigned
  (Boolean)

dynamic
  (Boolean) If DNS zone Dynamic, default: ``False``.

id
  (String) The ID of this resource.

kskids
  (String) A comma separated string of IDs of KSKs, starting with active keys, then inactive keys in parenthesis ``()``.

masters
  (List of String) List of all masters IP address, for slave zones.

type
  (String) the DNS zone type. For example: ``Master``, ``Slave``, ``Hint``, ``Stub``, ``Forward``.

view
  (String) Name of the view this DNS zone is in.

zskids
  (String) A comma separated string of IDs of ZSKs, starting with active keys, then inactive keys in parenthesis ``()``.

Read-Only
"""""""""

created
  (String) Date when zone was created in Micetro.

dnsviewref
  (String) Internal references to views.

dnsviewrefs
  (Set of String) Internal references to views.

  .. note::
    Only used with Active Directory.

lastmodified
  (String) Date when zone was last modified Micetro.

ref
  (String) Internal references to this DNS zone.

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

  resource menandmice_dns_zone zone2{
    name    = "zone2.net."
    authority   = "micetro.example.net."
    adintegrated = false
    custom_properties = {"place" = "city","owner" = "me"}

    view = ""             # default ""
    type = "Master"       # default "Master"
    dnssecsigned = false  # default false
  }
