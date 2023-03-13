.. meta::
   :description: Installing Micetro agents for Micetro by Men&Mice
   :keywords: Micetro, server controller, DNS, DHCP, Active Directory, agents

.. _install-controllers:

Micetro Agents
===============

Micetro uses agents, also know as server controllers, to handle communication between Micetro and the external service. Depending on the type of service and whether it is located on-premises or cloud, the agent is installed on the respective machine, the machine running Men&Mice central or, in some cases, any machine within the same domain as the DNS/DHCP servers. A single agent can handle communication with multiple servers.

.. _controller-non-standard-install:

.. important::
  The installer was designed to be quick and straightforward. Pay attention to the steps, if you would like to customize your installation, such as installing Central to a different path.

.. toctree::
  :maxdepth: 1

  install_dns_controllers
  install_dhcp_controllers
  agent_free_dns-dhcp

.. note::
  Servers in Active Directory environments can be connected without using an agent. For more information, see :ref:`ms-agent-free` in *Agent-free management of DNS/DHCP servers*.
