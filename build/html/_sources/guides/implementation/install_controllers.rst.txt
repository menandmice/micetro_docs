.. meta::
   :description: Installing server controllers for Micetro by Men&Mice
   :keywords: Micetro, server controller, DNS, DHCP, Active Directory

.. _install-controllers:

Server controllers
==================

Micetro uses *server controllers* to connect with DNS and DHCP servers in the network.

.. _controller-non-standard-install:

.. important::
  The installer was designed to be quick and straightforward. Pay attention to the steps, if you'd like to customize your installation. (Such as installing Central to a different path.)

.. toctree::
  :maxdepth: 1

  install_dns_controllers
  install_dhcp_controllers
  agent_free_dns-dhcp

.. note::
  Servers in Active Directory environments can be connected without using a controller. See :ref:`ms-agent-free`.
