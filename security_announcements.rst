.. _security-announcements:

Security announcements
======================

October 27th, 2021
------------------

Vulnerabilities were found in the BIND software running on our virtual appliances.

* `CVE-2021-25219 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-25219>`_: malicious actors can exploit a flaw in the response processing of affected authoritative servers that can cause degradation in BIND resolver performance.

We have updated the Men&Mice Virtual Appliances with the appropriate patches, and recommend all customers to update to the latest 9.3.14 version as soon as possible.

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

Vulnerabilities were found in the BIND software running on the Men&Mice Virtual Appliances.

* `CVE-2021-25214 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-25214>`_: A broken inbound incremental zone update (IXFR) can cause named to terminate unexpectedly

* `CVE-2021-25215 <https://cve.mitre.org/cgi-bin/cvename.cgi?name=2021-25215>`_: An assertion check can fail while answering queries for DNAME records that require the DNAME to be processed to resolve itself

We have updated the Men&Mice Virtual Appliances with the appropriate patches, and recommend all customers to update to the latest 9.3.11 version as soon as possible.

The appliances can be easily upgraded using the Automatic Updates feature of the Men&Mice Suite.

For details on how to update the Men&Mice Suite, see :ref:`updates`.

For more information regarding the upgrade, contact Men&Mice Customer Care. See :ref:`support`.

August 21st, 2020
-----------------

Men&Mice is releasing versions 9.3.6 and 9.2.11 for the Men&Mice Virtual DNS/DHCP appliances to patch three vulnerabilities found in BIND:

* CVE-2020-8622: A truncated TSIG response can lead to an assertion failure

* CVE-2020-8623: A flaw in native PKCS#11 code can lead to a remotely triggerable assertion failure in pk11.c

* CVE-2020-8624: "update-policy" rules of type "subdomain" were enforced incorrectly

The new releases now run BIND 9.11.22, which contains patches from ISC to close these vulnerabilities.

Men&Mice customers are highly encouraged to update their software, easily done using the Automatic Updates feature of the Men&Mice Suite.

For details on how to update the Men&Mice Suite, see :ref:`updates`.

For more information regarding the upgrade, contact Men&Mice Support: :ref:`support`.

June 25th, 2020
---------------

Due to vulnerabilities found in BIND and Unbound, 3rd-party softwares running on the Men&Mice Virtual DNS/DHCP appliances, Men&Mice has released a security update for the Men&Mice Suite.

* a Denial of Service (DoS) vulnerability is possible, although unlikely due to the limited attack vector, due to the RFC design of handling a wildcard character. The vulnerability has been documented on `CVE-2020-8619 <https://kb.isc.org/docs/cve-2020-8619>`_ and patched.

* a vulnerability in Unbound made the software exploitable for amplification attacks (a single incoming query resulting in a disproportionate amount of outgoing queries) to use in DDoS attacks, as per `CVE-2020-12662 <https://nlnetlabs.nl/downloads/unbound/CVE-2020-12662_2020-12663.txt>`_. Another issue in the Unbound code, filed under `CVE-2020-12663 <https://nlnetlabs.nl/downloads/unbound/CVE-2020-12662_2020-12663.txt>`_ also made it possible for attackers to force Unbound to enter into an infinite loop and crash.

Developers of BIND and Unbound have issued updates to fix these issues, and Men&Mice has updated the DNS/DHCP appliances to include these patches. Versions 9.2.10 and 9.3.5 contain the fixes.

Men&Mice customers are highly encouraged to update their software, easily done using the Automatic Updates feature of the Men&Mice Suite.

For details on how to update the Men&Mice Suite, see :ref:`updates`.

For more information regarding the upgrade, contact Men&Mice Support: :ref:`support`.
