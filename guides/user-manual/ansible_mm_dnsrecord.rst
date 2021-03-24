.. _ansible-mm_dnsrecord:

mm_dnsrecord
------------

Manage DNS records in Micetro.

In DNS it is very common to have multiple entries with the same name, as the example below shows.

::

  mail01.example.net.   7200   IN   A      192.0.2.25
  mail01.example.net.   7200   IN   A      192.0.2.143
  mail01.example.net.   7200   IN   AAAA   2001:db8::25
  mail01.example.net.   7200   IN   AAAA   2001:db8::587

.. tip::
  To enable multiple records with the same name in the Ansible modules, there is no possibility to change a record, the only way is to add the new record with the updated data and remove the old one after that.

Options
^^^^^^^

aging:
  The aging timestamp of dynamic records in AD integrated zones. Hours since January 1, 1601, UTC. Providing a non-zero value creates a dynamic record.

comment:
  Comment string for the record. Note that only records in static DNS zones can have a comment string

data:
  (required) The data that is added to the DNS record. The record data is a space-separated list, when the resource type is one of: ``MX``, ``SRV``, ``NAPTR``, ``CAA``, ``CERT``, ``HINFO`` or ``TLSA``.

  Example: data: ``"100 10 U E2U+sip !^.*$!sip:customer-service@example.com! ."``

dnszone:
  (required) The DNS zone where the action should take place.

enabled:
  True if the record is enabled. If the record is disabled the value is false

name:
  (required) The name of the DNS record. Can either be partially or fully qualified.

provider:
  (required) Definition of the Micetro API provider.

rrtype:
  Resource Record Type for this DNS record. Default is ``A``.

state:
  The state of the properties. (``absent``, ``present``)

ttl:
  The Time-To-Live of the DNS record.

Examples
^^^^^^^^

.. code-block:: yaml 

  - name: Set DNS record in zone for a defined name
    mm_dnsrecord:
      state: present
      name: beatles
      data: 172.16.17.2
      rrtype: A
      dnszone: example.net.
      provider:
        mmurl: http://mmsuite.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost

.. code-block:: yaml

  - name: Set PTR record in zone for a defined name
    mm_dnsrecord:
      state: present
      name: "2.17.16.172.in-addr.arpa."
      data: beatles.example.net.
      rrtype: PTR
      dnszone: "17.16.172.in-addr.arpa."
      provider:
        mmurl: http://mmsuite.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
