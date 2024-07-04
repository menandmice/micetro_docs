.. meta::
   :description: address space management in the Micetro
   :keywords: address space, configuration

.. _address-spaces:

Address Space Management
=======================

Multiple Address Spaces
-----------------------

.. note::
  For managing address spaces through the Management Console, see :ref:`console-address-spaces`.

Micetro supports multiple address spaces, each containing its unique set of network components, such DNS servers, DNS zones, DHCP servers, DHCP scopes, IP address ranges (including both IPv4 and IPv6 root ranges), IP address entries, and folders.

Shared elements across all address spaces include:

* Users, groups, and roles.

* Custom property definitions (for more information about custom properties, see :ref:`admin-custom-properties`).

.. note::
  Any changes made to data in one address space will not affect data in any other address space.

Switching Between Address Spaces
---------------------------------

You can only work in one address space at a time. The current address space is visibly indicated in the lower-right corner of the screen. 

**To switch to a different address space**:

1. Click the **User** icon in the upper-right corner.

2. Hover over the current address space, then select your desired address space.

   .. image:: ../../images/address-space-Micetro.png
     :width: 50%

Address Space Management
-------------------------
Users with sufficient permissions are allowed to create, modify, or delete address spaces as well as setting access privileges for existing address spaces.

Go to :menuselection:`Admin --> Configuration --> Address Spaces`.

.. image:: ../../images/address-spaces-10.5.png
  :width: 90%
|
* To **create** a new address space, click :guilabel:`Add` at the top of the view, and then enter the name and description for the address space.

* To **edit** the name or description for an address space, select the address space, and then select :guilabel:`Edit address space` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)**.

* To **delete** an address space, select the address space, and then select :guilabel:`Remove address space` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)**.

  .. danger::
     When you delete an address space, all objects contained within the address space are removed (DNS servers, DHCP servers, IP address ranges, IP address entries, and folders). This action cannot be undone.

* To **see and edit the access controls** for an address space, select the address space, and then select :guilabel:`Access` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)**.

.. note::
  The first address space is always named ``<default>``. It is not possible to rename or delete the *<default>* address space.

  The *<default>* address space is the only address space that shows AD sites if *AD Site and Subnet* integration is enabled.

Moving Objects to a Different Address Space
-------------------------------------------
You can move DNS servers, DHCP servers, and IP Address ranges between address spaces. When an object is moved between address spaces, all properties for the object are retained, including its access settings and change history. You must have the relevant administrator privileges to move objects to a different address space.

**To move an object**:

1. Select the object you want to move, and then select :guilabel:`Move to address space` on the :guilabel:`Action` menu. You can also select this option on the **Row menu (...)**.

2. Select a different address space in the dropdown list, and then click :guilabel:`Confirm`.

   .. image:: ../../images/address-space-move.png
      :width: 70%
    
.. note::
   Moving servers in an xDNS profile to separate address spaces, is NOT supported in the Web app. This is also not possible for DHCP servers in a failover relationship.
