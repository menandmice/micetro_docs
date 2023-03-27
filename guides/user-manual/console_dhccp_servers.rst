.. meta::
   :description: Maintaining DHCP servers in the Micetro by Men&Mice Management Console
   :keywords: DHCP servers, DHCP management console, DHCP Kea

.. _console-dhcp-servers:

DHCP servers - Management Console (obsolete)
============

Overview
--------

This section shows you how to perform specific actions in Micetro associated with maintaining your DHCP servers, such as adding and deleting servers and setting DHCP server options. In order to use the DHCP functionality of Micetro you need to have a valid DHCP license key.

.. note::
  The functions for this menu option are listed alphabetically after the New DHCP Server section.

This page describes the process for adding new DHCP servers, and generic DHCP management information. For detailed information about the different DHCP platforms, refer to:

* :ref:`dhcp-windows`

* :ref:`dhcp-kea`

* :ref:`dhcp-isc`

* :ref:`dhcp-cisco`


Inherited Access (Management Console)
-------------------------------------

You can manage access to scopes just as you can for other object types in Micetro, but there is one important distinction: you can set *Inherited Access* for scopes. When you open the *Access* dialog box for a scope, the dialog box has an extra section for inherited access.

Checking the :guilabel:`Inherit Access` checkbox will have the selected scope inherit all access bits from its parent range. This means that whenever the access privileges for the parent range are changed, they will be applied to the scope as well.

Clicking the :guilabel:`Apply access inheritance in child ranges` button will enable access inheritance for all descendants of the scope. This means that whenever the access privileges in the scope are changed, the changes will be applied of all descendants of the scope.

Regarding other access settings, refer to :ref:`access-control`.

Remove
------

.. note::
  To remove a DHCP server in the Management Console, see :ref:`console-delete-dhcp-server`.

.. _dhcp-server-options:

Options
-------

.. note::
  To manage DHCP server option in the Management Console, see :ref:`console-dhcp-options`.

Properties
-----------

Refer to the applicable section based upon the server type: :ref:`console-ms-dhcp-properties`, :ref:`console-isc-dhcp-properties`, :ref:`console-kea-dhcp-poperties` or :ref:`console-cisco-dhcp-properties`.

.. _kea-advanced-options:

Advanced ISC Kea Server Properties
----------------------------------

.. note::
  To edit advanced DHCP configuration in the Management Console, see :ref:`console-dhcp-advanced-options`.

Reload Scope List (Management Console)
--------------------------------------

Reloads the list of scopes to view additions and/or deletions made by another user.

----

.. toctree::
  :maxdepth: 1

  dhcp_windows
  dhcp_kea
  dhcp_isc
  dhcp_cisco
