.. image:: images/menandmice.png
  :width: 100 %
  :alt: Men&Mice
  :align: center

Micetro by Men&Mice 9.4.5 (AT&T)
================================

Welcome to Micetro by Men&Mice, a backend-agnostic DDI orchestration software for complex enterprise network environments.

Deployed in any on-premise, hybrid, or multicloud network environment, Micetro acts as a non-disruptive overlay that unifies server management under a single GUI and API. Micetro is a modular, software-defined DDI solution built around a number of components:

* Men&Mice Central
* Men&Mice Management Console for Windows
* Men&Mice Web Application
* Men&Mice server controllers for DNS and DHCP
* (optional) virtual appliances for DNS and DHCP

This reference documentation is divided into three parts:

1. Implementation Guide
2. Operations Guide
3. Maintenance Guide

Use the Implementation Guide to familiarize yourself with Micetro's architecture and installation procedures for components on different platforms. The Operations Guide (divided into DNS, DHCP, and IPAM) covers Micetro's functionality. The Maintenance Guide details the update procedures and other maintenance-related operations (such as concepts of high availability and dealing with failovers).


.. toctree::
    :caption: Micetro by Men&Mice 9.4.5 for AT&T
    :maxdepth: 1
    :hidden:

    changelogs/changelog

.. toctree::
     :caption: Implementation Guide
     :maxdepth: 3
     :hidden:

     guides/implementation-guide/config-files
     guides/implementation-guide/implementation
     guides/implementation-guide/updates

.. toctree::
     :caption: Operations Guide
     :maxdepth: 2
     :hidden:

     guides/operations-guide/operations
     guides/server-groups/server-groups
     guides/custom-workflows/workflows
