.. meta::
   :description: Ansible credentials matrix
   :keywords: ansible, credentials, module, plugin, administrator

.. _ansible-credentials:

Credential matrix
=================

.. csv-table:: Module and plugin credentials needed
  :header: "", "[1]_", "[2]_", "[3]_", "[4]_", "[5]_", "[6]_", "[7]_"
  :widths: 20, 10, 10, 10, 10, 10, 10, 10

  "``mm_claimip.py``", "", "", "", "**\***", "", "", ""
  "``mm_dhcp``", "", "", "**\***", "**\***", "", "", ""
  "``mm_dnsrecord``", "", "**\***", "", "", "", "", ""
  "``mm_group``", "", "", "", "", "**\***", "", ""
  "``mm_ipprops``", "", "", "**\***", "", "", "", ""
  "``mm_props``", "**\***", "**\***", "**\***", "**\***", "**\***", "", ""
  "``mm_role``", "", "", "", "", "**\***", "", ""
  "``mm_user``", "", "", "", "", "**\***", "", ""
  "``mm_zone``", "", "**\***", "", "", "", "", ""
  "``mm_inventory``", "", "", "", "**\***", "", "", ""
  "``mm_freeip``", "", "", "", "**\***", "", "", ""
  "``mm_ipinfo``", "", "", "", "**\***", "", "", ""


.. [1] Administrators (built-in)

.. [2] DNS Administrators (built-in)

.. [3] DHCP Administrators (built-in)

.. [4] IPAM Administrators (built-in)

.. [5] User Administrators (built-in)

.. [6] Approvers (built-in)

.. [7] Requesters (built-in)

.. note::
  The ``mm_props`` module manages custom properties for all types, like DNS servers, DHCP servers, zones, IP ranges etc. When using the module for a type when no modify rights are granted, an error will occur. It is possible to grant less rights and allow only to modify a subset of the record types.
