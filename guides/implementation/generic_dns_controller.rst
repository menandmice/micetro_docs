.. meta::
   :description: Using the Micetro Generic DNS agent in Micetro
   :keywords: DNS, DNS Server Controller, DNS agent, Micetro

.. _generic-dns-controller:

Generic DNS Agent
==================

Micetro manages DNS servers. Native ISC BIND DNS and Windows DNS is supported. As a result of an increase in other DNS servers showing up in production environments, as well as DNS offered as a service by Cloud providers, from Version 6.7 of Micetro, new functions have been added to the DNS agent. This makes the agent much more flexible and enables Micetro to communicate with such new DNS server types.

How to install and configure the Generic DNS agent:

1. Install:

   * On Windows, run the agent installer (x32 or x64 - depending on the OS version). There is no special Generic agent installer - just use the normal agent installer.

   * On Unix run the agent installer with the parameter ``--generic-dns-controller``.

2. Install a script interpreter. We recommend using Python as we provide example connector scripts for Python (2.7.x).

3. Add the GenericDNSScript XML tag to the preferences.cfg file. If the preferences.cfg file is not present, please create it.

  .. note::
    On Windows 2008/2012 R2 the preferences.cfg file is located under the hidden directory C:\ProgramData\Men and Mice\DNS Server agent

4. Following an example config for the python interpreter and a connector script located on the C drive in the scripts sub-directory:

.. code-block::

  <GenericDNSScript value="c:\python27\python.exe c:\scripts\genericDNS.py" />

The `genericDNS.py <https://github.com/menandmice/micetro_docs/blob/10.1/guides/implementation/genericDNS.py>`_ script implements the generic API and interfaces with the DNS server itself.

5. Log in to the M&M Management Console and add the new generic DNS server. Select as Server Type "*Generic*". The name and optional IP address must point to the machine that runs the Generic DNS agent.

Limitations
-----------

Reading, modifying zone/server options, reading logs, clearing cache, controlling the server itself is not possible by the API yet. Depending on the connector script, only primary zones are currently supported. That means no secondary zones or special zones like forward or stub zones are supported for Amazon Route53, but secondary zones are supported for :ref:`powerdns`.

Of course, the connector script could interface with a secondary zone and return an error when Central tries to update the zone. However, the zone will show up as zone of the type "Primary" in the M&M Suite. In other words, everything else than reading/writing/updating primary zones and their zone data is currently not supported.

Available Connector Scripts
---------------------------

Amazon Route53: see :ref:`aws-route53`.

PowerDNS with MySQL database backend: see :ref:`powerdns`.
