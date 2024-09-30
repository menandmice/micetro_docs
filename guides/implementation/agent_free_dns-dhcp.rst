.. meta::
   :description: Agent-free management of DNS (Microsoft DNS) and DHCP (Microsoft DHCP, ISC Kea) servers in Micetro
   :keywords: DNS management, DHCP management, DNS, DHCP, agent-free, Micetro

.. _agent-free-dns-dhcp:

Agent-free Management of DNS/DHCP Servers
=========================================

.. _kea-agent-free:

Kea
---

Kea DHCP servers can be configured agent-free, without a DHCP Server Controller running on every Kea machine. The :ref:`kea-control-agent` needs to be installed, and available for communication through its defined port (default: 8000). A single DHCP Server Controller is sufficient to communicate with and handle all Kea servers on the network.

.. _ms-agent-free:

Microsoft
---------

Microsoft DNS and DHCP servers in Active Directory environments can be managed agent free, i.e. without running a Micetro server controller locally on the DNS/DHCP server.

While agent free management of DHCP servers is possible with any 6.x version of Micetro, version 6.3 or newer is required for agent free management of DNS servers.

Although it is not required to install an agent on the DNS/DHCP server itself, an agent must be installed somewhere in the same domain as the server resides. This agent will be used as a proxy that will handle all communications to the remote DNS/DHCP server(s). Usually, this proxy agent is installed on the same server as Micetro Central, assuming the Micetro Central server is a member in the domain. If the DNS/DHCP servers are widely distributed geographically, it can also be of performance benefit to install one agent in each geographic location. For instance, if there are datacenters in Iceland, India, and the United States, it is probably best to install one proxy agent in each datacenter that each handles communications with the DNS/DHCP servers in its datacenter. The proxy agent then in turn feeds all the information back to Micetro Central, eventually reaching the end-user in one of the Micetro user interfaces.

Naturally, the Micetro proxy agent must adhere to the security imposed by the Active Directory. Therefore, the proxy agent service must be running with a service account that has sufficient privileges for DNS and/or DHCP management in the domain. If the privileges are restricted, that will translate to the same restriction in Micetro. For instance, if the service account only has privileges to view DNS zones and records but not do any changes what so ever, the zones and records will show up in Micetro, but all changes to those zones will be denied by Micetro. The same applies to the DHCP server management, if the service account has read-only privileges to the scopes, the scopes will show up in Micetro but the end-user will not be able to do any changes.

Limitations:
^^^^^^^^^^^^

DNS:
""""

With agent-free management of MS DNS servers, as opposed to using a locally installed agent, you will lose the following ability in static zones only:

* Disable resource record

* Enable resource record

* View and edit resource record comments

* Disable zone

DHCP:
"""""

Collection of lease history is only possible when the agent is installed locally. No lease history will be collected from servers that are managed agent-free.

If ``netsh`` with full dhcp functionality is not installed properly, no scopes will show up in Micetro regardless of the privileges of the service account running the proxy DHCP agent. The proxy DHCP agent must be installed on a machine that has ``netsh`` with full dhcp capability. This is always the case if the DHCP role service is installed. If not, it can be installed (on Win2008R2) by :menuselection:`Server Manager --> Features --> Remote Server Administration --> Role Administration Tools -- >DHCP Server Tools`.

It's recommended (but not required) that Windows 2003 DHCP servers are managed by proxy DHCP agents installed on Windows 2003 servers, and Windows 2008/R2 DHCP servers are managed by proxy DHCP agents installed on Windows 2008/R2 servers, due to some minor differences in the ``netsh`` between these two operating systems.
