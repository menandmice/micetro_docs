.. _operations:

Operations Guide
################

.. toctree::
  :maxdepth: 2

  webapp
  att_data
  dns
  server_management

Overview
********

This document is intended to familiarize you with the basic concepts and workflows of working with the Men&Mice Suite (the Management Console and the Web Application) in your environments.

Methods of operation
====================

DNS operations are done via the main Web Application. The Windows-based Management Console should only be used for higher level administrative tasks.

Management Console
------------------

The Management Console is only intended to be used occasionally, and for high-level system administration such as access control management and updates.

Information on the must-have to run the system is available in the Implementation Guide.

.. note::
  For more in-depth information on the administrative functions in the Management Console, see the relevant sections in the documentation: https://docs.menandmice.com/current/Administration+Functions

Web Application
---------------

The Web Application contains the Server Group Management (see the Server Group Guide) and the custom workflows that Men&Mice has created for AT&T.

.. csv-table::
  :header: "Feature", "Description"
  :widths: 30, 70

  "Manage DNS zones and DNS records", "Ability to manage DNS zones and DNS records."
  "Manage users, groups, and roles", "Ability to create, modify, and delete users/groups/roles."
  "Server administration", "Manage DNS servers in the system."
  "Reports", "Create and view reports."

The following table describes the contexts (sections of the user interface) of the Web Application and the relevant tasks:

.. csv-table::
  :header: "Context", "Description"
  :widths: 30, 70

  :guilabel:`DNS`, "Day-to-day management of DNS zones and DNS records that reside on specific master DNS servers."
  :guilabel:`Reports`, "Allows to create reports and schedule reports to be created periodically."
  :guilabel:`AT&T --> Server groups`, "Management of server groups."
  :guilabel:`AT&T --> Requests`, "Management of DNS change requests."
  :guilabel:`Admin --> Server management`, "System overview and DNS admin functions"
  :guilabel:`Admin --> Configuration`, "User, group, and roles management"
