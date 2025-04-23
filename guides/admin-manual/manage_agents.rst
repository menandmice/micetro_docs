.. meta::
   :description: How Micetro uses Agents to handle communication with services
   :keywords: DNS servers, DHCP servers, Agents

.. _service-management-agents:

Managing Services with Micetro Agents
=====================================
Micetro requires an agent to handle communication with external services. The installation location of the agent depends on the service type and whether it operates on-premises or in the cloud. Agents are installed on the respective machine, the machine running Micetro Central, or on any machine with the same domain as the DNS/DHCP servers.

A single agent can manage communication with multiple servers. For more information about agents and how to install them, refer to :ref:`install-controllers`.

.. note::
   When managing Microsoft DNS servers on remote computers using the DNS Agent, some actions for static zones may not be available, such as:

   * Disable resource record

   * Enable resource record
   
   * View and edit record comments

   * Disable zone

   To perform these actions, you need to install the DNS Agent on the server and use that connection when adding the server.
   