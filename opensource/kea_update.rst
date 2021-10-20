.. meta::
   :description:
   :keywords:

.. _kea-update:

Updating ISC Kea with Micetro 10.0
==================================

Micetro 10.0 is compatible with versions 1.6.0 and 1.8.0 of the ISC Kea DHCP server. Older versions are no longer supported for use with Micetro.

.. danger::
  Upgrading Micetro to 10.0 will render communication with old Kea servers unusable. Although the DHCP servers will continue to function, Micetro will no longer be able to recognize them.

Updating from older versions
----------------------------

When upgrading from an older ISC Kea DHCP version to version 1.6 or 1.8, old versions of Kea should be removed from Micetro, and then updated and their configuration adjusted before being added again into Micetro.

Using Kea in High Availability configuration with Micetro
---------------------------------------------------------

Configuration of High Availability setups should be completed before adding the Kea DHCP Server that is acting as a primary to Micetro. Secondary Kea DHCP Servers in High Availability relationships should not be added to Micetro. The Controller for the primary Kea server will communicate with the secondary members directly when needed.
