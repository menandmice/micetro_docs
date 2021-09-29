.. meta::
   :description: Access control on objects in Micetro by Men&Mice
   :keywords: Micetro access model

.. _acl-object-access:

Object access
-------------

Single objects in the DNS, IPAM, and Admin contexts can be selected to examine and adjust access with the :guilabel:`Action --> Access` task from the top bar or the ellipsis menu.

.. image:: ../../images/object-access.png
  :width: 90%
  :align: center

Here you can add :ref:`acl-specific-roles` to the object using the dropdown menu.

.. note::
  Only specific roles that have the necessary access enabled are shown in the list.

Exclude roles from object access
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If needed, :ref:`acl-general-roles` can be excluded from access to the single object.

.. image:: ../../images/object-access-exclude.png
  :width: 90%
  :align: center

The excluded role will still be shown in the list, but greyed out and struck through.

.. information::
  Specific roles cannot be excluded, as they're set on single objects. The 'exclude role' function is available to manage object access on a case-by-case basis for general roles.
