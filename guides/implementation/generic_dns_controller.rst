.. meta::
   :description: Using the Micetro Generic DNS agent in Micetro
   :keywords: DNS, DNS Server Controller, DNS agent, Micetro

.. _generic-dns-controller:

Generic DNS Agent
==================

The generic DNS agent is compatible with both native ISC BIND DNS and Windows DNS servers, providing increased flexibility and allowing communication with new types of DNS servers.

**To install and configure the Generic DNS agent**:

1. Install:

   * **Windows**: Run the agent installer (x32 or x64 - depending on your OS version). There is no separate installer for the generic agent - simply use the standard agent installer.

   * **Unix**: Run the agent installer with the parameter ``--generic-dns-controller``.

2. Install a script interpreter. We recommend using Python (version 2.7.x) script interpreter. Micetro provides example connector scripts for Python.

3. Add the ``GenericDNSScript`` XML tag to the ``preferences.cfg`` file. If the file doesn't exist, create it.

  .. note::
    On Windows 2008/2012 R2, the ``preferences.cfg`` file is located in the hidden directory ``C:\ProgramData\Men and Mice\DNS Server agent``.

4. Use the following example configuration for the Python interpreter and a connector script located on the C drive in the scripts sub-directory:

.. code-block::

  <GenericDNSScript value="python c:\scripts\genericDNS.py" />

  The `genericDNS.py <https://github.com/menandmice/micetro_docs/blob/10.1/guides/implementation/genericDNS.py>`_ script implements the generic API and interfaces with the DNS server.

5. Log in to Micetro and add a new generic DNS server. The name and optional IP address must point to the machine running the generic DNS agent.

Limitations
-----------

* The API does not yet support reading, modifying zone/server options, reading logs, clearing cache, or controlling the server itself.

* Depending on the connector script, only primary zones are currently supported. Secondary zones or special zones such as forward or stub zones are supported for Amazon Route53, but secondary zones are supported for :ref:`powerdns`.

.. note::
  The connector script can interface with a secondary zone and return an error when Central attempts to update the zone. However, the zone will appear as a "Primary" in Micetro. 

Available Connector Scripts
---------------------------

* Amazon Route53: see :ref:`aws-route53`.

* PowerDNS with MySQL database backend: see :ref:`powerdns`.
