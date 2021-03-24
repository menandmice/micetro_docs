.. _record-policies:

DNS record policies
*******************

DNS record policies are a powerful and flexible tool that allows administrators to define record naming conventions and rules to be enforced when users make changes.

By default, DNS changes through Men&Mice are only validated syntactically, when changes are applied to the DNS service.
However, there are often other rules and conventions that must be followed, making input prone to human error.

To reduce the chance for such mistakes, DNS administrators can use record policies to define rules that can apply to some set of records, defined by target.

DNS record policy logic and fail condition
==========================================

* A record is said to **pass** a policy if matches its *target* and *passes* the rule defined by that policy.
* A record is *valid* **if and only if** it passes *all* policies that capture it as a target. If a policy's target doesn't apply to a record then it won't have to pass the rule.
* A record policy can be defined as an error or as a warning:

  error
    will prevent the record from being created through our solution

  warning
    will allow it to be created but the record will be marked as having failed a policy and the user will be notified.

Configuring Men&Mice Central for DNS record policies
====================================================

To use DNS record policies in the Men&Mice Suite, the following are required:

* ``toml`` Python package (Install with ``pip2.7 install toml``)
* policies file ``/var/mmsuite/mmcentral/scripts/policies.toml`` (Example file will be provided by Men&Mice.)
* ``/var/mmsuite/mmcentral/scripts/set_policies.py``: script used to synchronize policies.toml with Central. Once ran, the policies will persist in the database. (Provided by Men&Mice.)

Managing DNS record policies
============================

The configuration file for DNS record policies are defined using `TOML <https://learnxinyminutes.com/docs/toml/>`_.

In order to add new or make changes to existing policies:

1. Edit policies.toml
"""""""""""""""""""""

Each policy entry must start with [[policies]] and define title, target, rule.

Defining description is optional. Set the value of onlyWarn to true to turn the policy into a warning.

2. Run ./set_policies.py
""""""""""""""""""""""""

The script will prompt for your Men&Mice administrator password, and checks the ``policies.toml`` file for any syntax errors.

If successful:

.. code-block:: bash

  [central-machine /var/mmsuite/mmcentral/scripts]# ./set_policies.py
  Enter administrator password: ********
  Successfully updated policies

All policies defined in the file are now applied and persist in the database:

* previously defined policies no longer defined in policies.toml are removed
* new policies are added
* modified policies overwrite previous policies

.. note::
  Any violations due to the updated policies will be shown in the Men&Mice Web Application the first time the relevant server group is prepared.

.. warning::
  Policies that have been successfully applied system-wide, including all HA instances, and persist and maintained in the database in case of failover.
  However, the ``policies.toml`` file is **not** automatically transferred to the HA Central partner(s) and therefore should be manually backed up and synchronized between server instances.

Policy enforcement
=================

DNS record policies are validated every time a user submits a queued change, and violations are displayed with error and warning messages next to the violating records.

.. note::
  **Disabled records** are not validated against active policies. If policies are changed, re-enabled records are validated when added to the Request Queue or starting a prepare operation for the server group.

.. note::
  *Errors* will prevent proceeding with the queued changes. *Warnings* can be ignored and the changes queued.

.. image:: ../../images/policy_error_queue.png
  :width: 90%
  :align: center

DNS record policies and Server Groups
-------------------------------------

DNS record policies are also enforced when initiating a :ref:`Prepare <server-groups-prepare>` operation for the Server Group .

All records in the group are checked against the active policies in the system. Any errors will cause the prepare operation to fail, and display a list of violations:

.. image:: ../../images/policy-error.png
  :width: 80%
  :align: center

API operations that modify DNS records (such as ``AddDNSRecord`` or ``AddChangeRequest``) will also return errors in case of a policy violation.

.. code-block:: XML

  POST: DNSZones/99191/DNSRecords

  {
  "dnsRecord": {
    "name": "sgw.nz1a.nz1.aln.int",
    "type": "NAPTR",
    "data": "1000\t999\tU\tx-3gpp-sgw:x-s11:x-s4\t\tsgw-s11-s4.nz1a.nz1.aln.int"
    }
  }

.. code-block:: XML

  400 BAD REQUEST RESPONSE

  {
  "error": {
    "code": 65535,
    "message": "Policy \"NAPTR flag field should be A\" failed: Record \"sgw.nz1a.nz1.aln.int  IN NAPTR 1000 999 \"U\" \"x-3gpp-sgw:x-s11:x-s4\" \"\" sgw-s11-s4.nz1a.nz1.aln.int\" violates policy:\nnaptr.flag = A."
    }
  }

.. warning::
  Changes made outside of the Men&Mice Suite are synchronized normally. Any policy violations they might cause will be displayed when the group is next prepared.

DNS record policy syntax
========================

A DNS record policy is made up of the following properties:

.. csv-table::
  :header: "Property", "Description"
  :widths: 10, 90

  "Title", "Short description of the policy."
  "Description", "(Optional) Longer description that is displayed when the policy fails."
  "Target", "A criteria that describes the set of records the policy applies to."
  "Rule", "A criteria used to verify if the policy failed, or pass."
  "Only Warn", "BOOL; if true, the record that violate the policy can still be created but a warning will be displayed and logged. Default is ``false``."

The ``target`` and ``rule`` fields use the Men&Mice filters, which support multiple fields, operators, and regular expressions.

The fields supported in policies are:

+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| Field             | Examples                                                                                                                                            |
+===================+=====================================================================================================================================================+
| zone.name         | ``zone.name = apn.db.`` matches zones with name ``apn.db.``                                                                                         |
|                   +-----------------------------------------------------------------------------------------------------------------------------------------------------+
|                   | ``zone.name =^ epc`` matches zones with names starting with ``epc``                                                                                 |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| record            | ``record = "abc IN A 213.44.22.91"``                                                                                                                |
|                   +-----------------------------------------------------------------------------------------------------------------------------------------------------+
|                   | ``record =~ "(?>sgw\.)?(.*) IN NAPTR \d+ \d+ "\w" ".+" "" sgw-s11-s4\.\1"`` matches NAPTR records whose replacement field matches the record's name |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| record.name       | ``record.name =$ east`` matches records with names the *end* with ``east``                                                                          |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| record.ttl        | ``record.ttl >= 3600`` matches records that have TTL greater or equal than 3600                                                                     |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| record.type       | ``record.type = A, record.type in (NAPTR, A)``                                                                                                      |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| record.data       | ``record.data = 213.44.22.91``                                                                                                                      |
|                   +-----------------------------------------------------------------------------------------------------------------------------------------------------+
|                   | ``record.data = "\d+ \d+ "\w" "[^"]+" "" sgw-s11-s4\.test"``                                                                                        |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| naptr.order       | ``naptr.order >= 999 AND naptr.order <= 3000`` matches NAPTR records with order between 999 and 3000                                                |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| naptr.pref        | ``naptr.pref = 5000``                                                                                                                               |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| naptr.flag        | ``naptr.flag = a``                                                                                                                                  |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| naptr.service     | ``naptr.service in (x-3gpp-mme:x-gn, x-3gpp-mme:x-s10, x-3gpp-mme:x-s3)``                                                                           |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| naptr.regex       | ``naptr.regex = ""`` matches NAPTR records with empty regex fields                                                                                  |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+
| naptr.replacement | ``naptr.replacement =~ topoff\.mmec\w{2}\.mmegi\w{4}\.mme``                                                                                         |
+-------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------+

.. note::
  A list of all the allowed operators and their meaning can be found at http://api.menandmice.com/9.3.0/#Filtering.

DNS record policy examples
==========================

Enforce consistent NAPTR fields in zone sgw-s11.db.
---------------------------------------------------

All NAPTR records in the zones should have the same values in the order, preference, and service fields.

.. code-block:: TOML
  :linenos:

  [[policies]]
  # The name of the policy
  title = "NAPTR data field constants"

  # This policy will only be validating NAPTR records in zone `sgw-s11.db.`
  target = "zone.name = sgw-s11.db. AND record.type = NAPTR"

  # If a record doesn't pass this filter, it's violating the policy
  rule = '''
  (naptr.order = 1000 OR naptr.order = 2000)
      AND naptr.pref = 999
      AND naptr.service = x-3gpp-sgw:x-s11:x-s4
  '''

  # If this would be set to true, users could still make the change but they would be warned
  onlyWarn = false

.. warning::
  All zones and include files have their names stored as fully qualified domain names.
  When using ``zone.name`` make sure that the zone name the policy is matched against ends with a period, i.e.: ``zone.name = sgw-s11.db``.

Warn if change contains record names deviating from template
------------------------------------------------------------

.. code-block:: TOML
  :linenos:

  [[policies]]
  target = "zone.name = sgw-s11.db. AND record.type = NAPTR"
  title = "Domain name syntax"
  description = "Domain name syntax issue - deviation from template"
  rule = '''
    record.name =~ "[^\.]+\.sdn\.(cent|east|west|test)"
  OR record.name =~ "nim[^\.]+\.[^\.]+\.ims\.(cent|east|west)"
  OR record.name =~ "nz\d(a|b)?\.[^\.]+\.ims\.(cent|east|west)"
  OR record.name =~ "sgw\.nz\d(a|b)\.nz\d\.[^\.]+\.int(\.roam)?"
  OR record.name =~ "sgw\.nz\d(a|b)?\.nz\d\.[^\.]+\.(ent2?|ims|int)"
  OR record.name =~ "sgw\.sdn\d\.[^\.]+\.(cent|west|east)\.sdn"
  OR record.name =~ "sgw\.nz\d\.[^\.]+\.(int|ims)"
  OR record.name =~ "alp\d(a|b)\.vtc\.ims\.east"
  '''
  onlyWarn = true

Records that will pass:

* ``sgw.nz1a.nz1.abc.int IN NAPTR 100 99 "a" "myservice" "" sgw-s11-s4.foo``
* ``alp4a.vtc.ims.east IN NAPTR 44 12 "u" "myservice" "" test``

Records that will produce a warning:

* ``sgw.nza.nz1.abc.int IN NAPTR 100 99 "a" "myservice" "" sgw-s11-s4.foo``
* ``alpa.vtc.ims.east IN NAPTR 44 12 "u" "myservice" "" test``

Consistency between NAPTR record name and replacement field
-----------------------------------------------------------

This policy has a regular expression which uses a back-reference to match the same text again.
This is especially useful for a common pattern where an NAPTR record's name must match the replacement field.

.. code-block:: TOML
  :linenos:

  [[policies]]
  target = "zone.name = sgw-s11.db. AND record.type = NAPTR"
  title = "NAPTR record name and replacement consistency"
  description = "NAPTR replacement field should match the record name"
  rule = '''
  record =~ "(?>sgw\.)?(.*) IN NAPTR \d+ \d+ "\w" ".+" "" sgw-s11-s4\.\1"
  '''

.. note::
  ``(?>sgw\.)?`` means that the record may start with ``sgw.`` but it’ll be ignored.

Records that will pass:

* ``sgw.abc IN NAPTR 100 99 "a" "myservice" "" sgw-s11-s4.abc``
* ``foo IN NAPTR 44 12 "u" "myservice" "" sgw-s11-s4.foo``

Records that will violate the policy:

* ``sgw.abc IN NAPTR 100 99 "a" "myservice" "" sgw-s11-s4.def``
* ``foo IN NAPTR 100 99 "a" "myservice" "" sgw-s11-s4.bar``

.. warning::
  When matching against ``record`` or ``record.data`` be aware of the quotation marks included in the record’s data. For example, NAPTR record flag, service, and regex fields are quoted.

Ensure all NAPTR records in every zone have an empty regex field
----------------------------------------------------------------

This policy does not specify ``zone.name`` in the target field so it will be checked for all NAPTR records in the system.

.. code-block:: TOML
  :linenos:

  [[policies]]
  target = "record.type = NAPTR"
  title = "NAPTR regex field should be empty"
  rule = 'naptr.regex = ""'
