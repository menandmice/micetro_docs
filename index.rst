.. meta::
   :description: Product documentation for Micetro by Men&Mice
   :keywords: Micetro, Micetro by Men&Mice, Men&Mice, documentation, user guide, admin guide

Micetro by Men&Mice 10.5
########################

Welcome to Micetro by Men&Mice, a backend-agnostic DDI orchestration software for complex enterprise network environments.

.. image:: images/micetro.png
  :width: 70%
  :alt: Men&Mice
  :align: center

Deployed in any on-premise, hybrid, or multicloud network environment, Micetro acts as a non-disruptive overlay that unifies server management under a single GUI and API. Micetro is a modular, software-defined DDI solution built around a number of components, and accessed through a unified user interface and API.

This documentation is divided into four parts:

1. :ref:`implementation`
2. :ref:`manual-introduction`
3. :ref:`admin-overview`
4. :ref:`reference`

Use the :ref:`implementation` to familiarize yourself with Micetro's architecture and installation procedures for components on different platforms. The :ref:`manual-introduction` covers all of Micetro's functionality. :ref:`admin-overview` is aimed at system administrators managing Micetro.

.. tip::
  Use the search function for quickly locating the information required.

.. note::
  For how-to articles and troubleshooting, see :ref:`reference` or visit the `Knowledge Base <https://kb.menandmice.com/display/MM/Knowledge+base>`_.

.. image:: images/menandmice.png
  :width: 60%
  :alt: Micetro by Men&Mice
  :align: center

.. note::
  If you’re using version **9.2 or older** of the Men&Mice Suite, refer to the documentation on https://cdocs.menandmice.com/display/MM/Documentation+Home.

The documentation is open-source, under a modified MIT license (see :ref:`docs-license`), and you're welcome to file issues and improvements `on GitHub <https://github.com/menandmice/micetro_docs>`_.

Table of Contents
-----------------

.. toctree::
    :caption: Micetro by Men&Mice
    :maxdepth: 1

    release_notes
    security_announcements
    support
    opensource

.. toctree::
     :caption: Micetro Install Guide
     :maxdepth: 3

     guides/implementation/implementation
     guides/implementation/configuration
     guides/implementation/advanced_config
     guides/implementation/updates

.. toctree::
     :caption: Micetro User Guide
     :maxdepth: 3

     guides/user-manual/introduction
     guides/user-manual/ui
     guides/user-manual/folder_management
     guides/user-manual/dns
     guides/user-manual/dhcp
     guides/user-manual/ipam
     guides/user-manual/devices
     guides/user-manual/active_directory
     guides/user-manual/automation

.. toctree::
    :caption: Micetro Admin Guide
    :maxdepth: 3
    
    guides/admin-manual/webapp_server_management
      guides/admin-manual/webapp_service_management_actions
    guides/admin-manual/access_control
    guides/admin-manual/snmp_profiles
    guides/admin-manual/admin_license
    guides/admin-manual/admin_event_hooks
    guides/admin-manual/admin_custom_properties
    guides/admin-manual/admin_system_settings
    guides/admin-manual/webapp_sso
    guides/admin-manual/admin_updates   
    guides/admin-manual/admin_maintenance
    guides/admin-manual/appliance_management
    guides/admin-manual/caching_appliance

.. toctree::
    :caption: Reference
    :maxdepth: 1

    guides/reference/reference
