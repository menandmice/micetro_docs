.. meta::
   :description: Defining options on DHCP servers in Micetro
   :keywords: DHCP, DHCP servers, DHCPv4, DHCPv6, DHCP options, custom options

.. _admin-dhcp-options:

Defining Options on DHCP Services
=================================
In Micetro, you can manage your DHCP services by defining DHCPv4 and/or DHCPv6 options, as well as custom options. When defining DHCP options, standard options for your DHCP service reside in the *Standard* :guilabel:`Vendor class`.

To define options on your DHCP service

1. On the **Admin** page, select the :guilabel:`Service Management` tab. 

2. Locate the applicable service in the data grid.

   .. tip::
      Use the filters in the left sidebar to filter the data grid for a specific service type.

3. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select either :guilabel:`Manage DHCPv4 options` or :guilabel:`Manage DHCPv6 options`. 

4. In the **Manage DHCP Options** dialog, use the dropdown to select the option(s) you want to define and enter the appropriate value in the provided field.

   .. note::
      The **Manage DHCP Options** dialog displays all options defined on the DHCP server.

   .. image:: ../../images/manage-dhcpv4-options.png
      :width: 80%
 
   To delete an option, hover over its field, and then select the trash can icon next to it.

7. Select :guilabel:`Save` to save the updated options.

.. _dhcp-custom-options:

Defining Custom DHCP Options
----------------------------
You can also define custom options on your DHCP service. To define custom options:

1. Locate the applicable service in the data grid.

2. Use the :guilabel:`Action` or the Row :guilabel:`...` menu to select either :guilabel:`Manage custom DHCPv4 options` or :guilabel:`Manage custom DHCPv6 options`.

3. In the **Manage Custom DHCP Options** dialog, select the appropriate :guilabel:`Vendor class` in the dropdown.

   .. image:: ../../images/manage-custom-dhcpv4-options.png
      :width: 80%

4. To add a new custom option, select :guilabel:`Add Custom Option` and enter the required information in the provided fields:

   * **ID** --- Enter an ID for the custom option, for which numbers 1--120 are predefined.
   * **Name** --- Give the custom option a name.
   * **Type** --- Use the dropdown to select a Type, e.g., String, Hexadecimal, IP address, Number (32-bit, 16-bit, or 8-bit).
   * **Array** --- If the option is an array, select the :guilabel:`Array` checkbox.

   Select :guilabel:`Add` to add the new custom option.

   To remove a custom option, use the Row :guilabel:`...` menu to select :guilabel:`Remove`. Then confirm by selecting :guilabel:`Yes`.

5. Select :guilabel:`Save`.


Once an option has been defined, you can set its value in the `Manage DHCP Options <admin-dhcp-options>`_ task.

.. _edit-dhcp-options:

Editing Custom DHCP Options
---------------------------
When needed, you can edit the custom options on your DHCP service(s). Custom options can only be edited on the following service types:

* ISC DHCP
* ISC Kea DHCP
* Appliance

To edit custom DHCP options on MS DHCP services, you must remove the existing option and add it anew in the `Manage DHCP Custom Options <admin-dhcp-options>`_ task.

**To edit custom options on ISC DHCP and ISC Kea DHCP**:

1. In the data grid, locate the DHCP service whose custom options you want to edit.

2. Use the the :guilabel:`Action` or the Row :guilabel:`...` menu to select either :guilabel:`Manage custom DHCPv4 options` or :guilabel:`Manage custom DHCPv6 options`.

3. In the dialog, select the custom option you want to edit and use the Row :guilabel:`...` menu to select :guilabel:`Edit`.

4. Edit the custom option's **ID** number and select :guilabel:`Save`.


.. _remove-custom-dhcp-option:

Removing Custom DHCP Options
----------------------------
Micetro enables you to remove a custom DHCP option from your DHCP service, if needed.

**To remove a custom DHCP option**:

1. In the data grid, locate the DHCP service from which you want to remove a custom option.

2. Use the :guilabel:`Action` or the Row :guilabel:`...` menu to select either :guilabel:`Manage custom DHCPv4 options` or :guilabel:`Manage custom DHCPv6 options`.

3. In the dialog, select the custom option you want to remove and use the Row :guilabel:`...` menu to select :guilabel:`Remove`.

4. Confirm the removal of the custom option by selecting :guilabel:`Yes`.
