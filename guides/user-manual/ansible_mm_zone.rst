.. meta::
   :description: Managing DNS zones in Micetro
   :keywords: DNS zones, Micetro, Ansible

.. _ansible-mm_zone:

mm_zone
-------

Manage DNS zones in Micetro.

Options
^^^^^^^

adintegrated:
  True if the zone is Active Directory integrated.

adpartition:
  The AD partition if the zone is Active Directory integrated.

adreplicationtype:
  Type of the AD replication.

authority:
  Name of the DNS server that contains the zone or the string ``[Active Directory]`` if the zone is integrated in the Active Directory.

customproperties:
  Custom properties for the zone. These properties must already exist. See also :ref:`ansible-mm_props`.

dnssecsigned:
  True if the zone is a DNSSEC signed zone.

dynamic:
  Dynamic DNS zone.

kskids:
  A comma separated string of IDs of KSKs, starting with active keys, then inactive keys in parenthesis

masters:
  The IP addresses of the primary servers if the new zone is not a primary zone.

name:
  (required) Name of the zone.

nameserver:
  Nameserver to define the zone on. Required if ``state=present``.

provider:
  (required) Definition of the Micetro API provider.

servtype:
  Type of server.

state:
  The state of the zone. (``absent``, ``present``)

zskids:
  A comma separated string of IDs of ZSKs, starting with active keys, then inactive keys in parenthesis.

Examples
^^^^^^^^

.. code-block:: yaml

  - name: Create a new zone
    mm_zone:
      state: present
      name: example.com
      nameserver: ns1.example.com
      authority: micetro.example.net
      customproperties:
        location: London
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost

.. code-block:: yaml

  - name: Release a zone
    mm_zone:
      state: absent
      name: example.com
      provider:
        mmurl: http://micetro.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
