.. meta::
   :description:
   :keywords:

.. _security-announcements:

Security announcements
======================

April 29th, 2021
----------------

Vulnerabilities were found in the BIND software running on our virtual appliances.

* `CVE-2021-25214 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-25214>`_: A broken inbound incremental zone update (IXFR) can cause named to terminate unexpectedly

* `CVE-2021-25215 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=2021-25215>`_: An assertion check can fail while answering queries for DNAME records that require the DNAME to be processed to resolve itself

We have updated the Men&Mice Virtual Appliances with the appropriate patches, and recommend all customers to update to the latest 10.0.1 version as soon as possible.

The appliances can be easily upgraded using the Automatic Updates feature of Micetro.

For details on how to update Micetro, see :ref:`updates`.

For more information regarding the upgrade, contact Men&Mice Customer Care. See :ref:`support`.
