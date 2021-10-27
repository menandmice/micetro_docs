.. meta::
   :description:
   :keywords:

.. _security-announcements:

Security announcements
======================

October 27th, 2021
------------------

Vulnerabilities were found in the BIND software running on our virtual appliances.

* `CVE-2021-25219 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-25219>`_: malicious actors can exploit a flaw in the response processing of affected authoritative servers that can cause degradation in BIND resolver performance.

We have updated the Men&Mice Virtual Appliances with the appropriate patches, and recommend all customers to update to the latest 10.0.6 version as soon as possible.

The appliances can be easily upgraded using the Automatic Updates feature of Micetro.

For details on how to update Micetro, see :ref:`updates`.

For more information regarding the upgrade, contact Men&Mice Customer Care. See :ref:`support`.


May 28th, 2021
--------------

Vulnerabilities were found in the ISC DHCP software running on our virtual appliances.

* `CVE-2021-25217 <https://kb.isc.org/docs/cve-2021-25217>`_: code used by the ISC DHCP package can be exploited by an attacker to read a stored lease that contains option information which will trigger a bug in the option parsing code. Due to shared code, multiple components like ``dhcpd`` and ``dhclient`` are affected.

We have updated the Men&Mice Virtual Appliances with the appropriate patch, and recommend all customers to update to the latest 10.0.2 version as soon as possible.

The appliances can be easily upgraded using the Automatic Updates feature of Micetro.

For details on how to update Micetro, see :ref:`updates`.

For more information regarding the upgrade, contact Men&Mice Customer Care. See :ref:`support`.

April 29th, 2021
----------------

Vulnerabilities were found in the BIND software running on our virtual appliances.

* `CVE-2021-25214 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-25214>`_: A broken inbound incremental zone update (IXFR) can cause named to terminate unexpectedly

* `CVE-2021-25215 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=2021-25215>`_: An assertion check can fail while answering queries for DNAME records that require the DNAME to be processed to resolve itself

We have updated the Men&Mice Virtual Appliances with the appropriate patches, and recommend all customers to update to the latest 10.0.1 version as soon as possible.

The appliances can be easily upgraded using the Automatic Updates feature of Micetro.

For details on how to update Micetro, see :ref:`updates`.

For more information regarding the upgrade, contact Men&Mice Customer Care. See :ref:`support`.
