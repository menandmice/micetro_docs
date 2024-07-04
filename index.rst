.. meta::
   :description: Product documentation for Micetro
   :keywords: Micetro, documentation, user guide, admin guide, installation guide

Micetro 11.1
#############

Welcome to Micetro, a backend-agnostic DDI orchestration software for complex enterprise network environments.

.. image:: images/micetro.png
  :width: 70%
  :alt: Micetro
  :align: center
|
Deployed in any on-premises, hybrid, or multicloud network environment, Micetro acts as a non-disruptive overlay that unifies server management under a single GUI and API. Micetro is a modular, software-defined DDI solution built around a number of components, and accessed through a unified user interface and API.

This documentation is divided into four parts:

1. **Installation Guide**: Get acquainted with Micetro's architecture and follow step-by-step installation procedures tailored for various platforms.
2. **User Guide**: Explore the comprehensive coverage of Micetro's functionalities to maximize your user experience.
3. **Admin Guide**: Tailored for system administrators, this guide equips you with the knowledge needed to effectively manage Micetro.
4. **Reference Guide**: Find detailed how-to articles and troubleshooting tips to address any challenges that may arise. 

.. tip::
  Use the search function to quickly locate the information required.

The documentation is open-source, under a modified MIT license (see :ref:`docs-license`), and you're welcome to file issues and improvements `on GitHub <https://github.com/menandmice/micetro_docs>`_.

Table of Contents
-----------------

.. toctree::
    :caption: Micetro
    :maxdepth: 1

    release_notes
    support
    opensource

.. toctree::
     :caption: Micetro Installation Guide
     :maxdepth: 1

     guides/implementation/implementation
     guides/implementation/configuration
     guides/implementation/advanced_config
     guides/implementation/updates

.. toctree::
     :caption: Micetro User Guide
     :maxdepth: 1

     guides/user-manual/webapp_user_guide
     guides/user-manual/dns
     guides/user-manual/dhcp_scopes
     guides/user-manual/ipam
     guides/user-manual/folder_management     
     guides/user-manual/webapp_reporting
     guides/user-manual/webapp_workflows
     guides/user-manual/view_change_history
     guides/user-manual/automation
     

.. toctree::
    :caption: Micetro Admin Guide
    :maxdepth: 1
    
    guides/admin-manual/admin_license
    guides/admin-manual/access_control
    guides/admin-manual/webapp_server_management
    guides/admin-manual/failover_management
    guides/admin-manual/snmp_profiles
    guides/admin-manual/admin_event_hooks
    guides/admin-manual/address_spaces
    guides/admin-manual/admin_custom_properties
    guides/admin-manual/admin_system_settings
    guides/admin-manual/admin_object_history
    guides/admin-manual/webapp_sso
    guides/admin-manual/webapp_appliance_management
    guides/implementation/updates

.. toctree::
    :caption: Reference
    :maxdepth: 1

    guides/reference/reference

.. toctree::
    :caption: Management Console
    :maxdepth: 1

    guides/management-console/management_console
    guides/user-manual/console
    guides/implementation/first_login
    guides/implementation/central_logging
