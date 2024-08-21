.. meta::
   :description: How to import IP address ranges or IP addresses into Micetro
   :keywords: IPAM, IPAM data, Micetro

.. _webapp-import-ipam-data:

Importing IPAM Data
===================

Prerequisites
-------------

You must have acess to the IPAM module import IPAM data:

For more information about access controls, see :ref:`permissions-reference`.

Importing Data
--------------

The Import wizard is accessed by selecting :guilabel:`Import` on the :guilabel:`Action` menu in the list of Networks.

You can import the following IPAM data into Micetro:

* Networks

* IP addresses (and DNS hosts)

* Devices and interfaces

* DHCP reservations

The data can either be pasted directly into the import wizard or by using a file that is uploaded.

.. image:: ../../images/import.png
  :width: 90%
  :align: center

The text lines for import, or the file contents selected, must contain lines with columns/fields separated by a comma ``,``, semicolon ``;``, pipe ``|``, or tab character.

For example, if you select and copy spreadsheet cells, they will be tab-separated when you paste them into the text area of the Import Data wizard. This is probably the easiest way to tranfer a significant number of rows from an Excel spreadsheet into the Import Data wizard.

.. note::
  Only plaintext CSV/TSV/TXT files are accepted when selecting files. Excel spreadsheets must be converted to one of these formats before importing.

Clearing Values
^^^^^^^^^^^^^^^

By default, if the value in a particular column is empty, it is not automatically cleared. Instead, it is excluded from the import. This allows you to selectively update certain fields while leaving others unchanged within the same import process.

To clear a value for a custom property, such as "Responsible Person", insert one of the following clearing tokens in plce of an empty value: ``$null``, ``%clear``, ``<none>``, ``<blank>``, or ``<empty>``.

These tokens will clear the field only if the field contains the token and nothing else. For example, if the field value is "This is <none>" in the import text, the field would not be cleared, but assigned that specific value.

See :ref:`import-ipam-example-5`.

Header Line
^^^^^^^^^^^

The first line of the data must be the header line, containing the name of the fields in the follwoing columns. Some fields refer to built-in system fields and vary depending on the contents of the import. The remaining fields should match the custom properties defined for the object type. Only fields that you want to import or update need to be included, except for those that are mandatory or required for object identification.

Field names in the header are not case-sensitive. For example, "title" matches the custom property "Title".

Action Field
""""""""""""

The Action field is an optional column that defines whether to add, remove, or modify the object specified in the line, with Add being the default action unless otherwise specified.

This column is identified by the fieldnames "Action", "Operation", or "ActionType". If a custom field name conflicts with one of these, it will take precedence and the column won't be recognized as the action column. In that case, use one of the provided alternatives for the action column that does'nt conflict with custom property names.

The Action field can have one of three values:

* **Add**: The default for Range Import. **Create**, **New**, and **Import** are equivalent alternatives.

* **Update**: the default for IP Address Import. **Modify** and **Mod** are equivalent alternatives.

* **Delete**: **Remove** and **Del** are equivalent alternatives.

Ranges
^^^^^^

Range Column:
"""""""""""""

Ther are tree ways to identify the range to import. The first option is recommended. The other two options are offered for convenience when the date ranges span across two columns in the original spreadsheet.

* Include a "Range" column (alternatives: "Name", "Network", "Network range", "IP range", "IP Address range", or "IPRange") and provide the range in CIDR format (for example, 192.168.1.0/24) or from-to format (for example, 192.168.1.0-192.168.1.255)

* Include a "Network_address" and "Network_mask" columns, with the network address (for example, 192.168.1.0) and network mask (for example, 255.255.255.0) as values. This will be converted automatically to the CIDR format, and displayed in a single Range column in the next step.

* Include a "from" and "to" columns, with the from and to address of the range to import.

Built-in Fields:
""""""""""""""""

* **Container?** Identified in header line by either "isContainer", "is_Container" or "is Container"

  If set to Yes, then the range will be marked as container, or as Range/Scope when set to "No" (or not updated if blank). See :ref:`ipam-containers` for more information on the Container property.

* **Locked?**: Identified in header line by: "Locked", "isLocked", "is_Locked" or "is Locked"

  If set to Yes, locks the range. No unlocks it (blank does not update). See :ref:`ipam-range-config` for more information on Locked.

* **Allow auto-assignment of IP Addresses?**: Identified in the header line by: "AutoAssign", "Auto-Assign", "Auto_Assign" or "Auto Assign".

  Set to Yes or No to set or unset the property. Leave blank to not update. See :ref:`ipam-range-config` for more information on Allow auto-assignment of IP Addresses.

* **Reserve Network and Broadcast Address?**: Identified in the header line by: "Subnet", "isSubnet", "is_Subnet" or "is Subnet"

  Set to Yes or No to set or unset the property. Leave blank to not update. See :ref:`ipam-range-config` for more information on Reserve Network and Broadcast Address.

* **AD site**: Identified in the header line by: "ADSite", "AD Site" or "ADSiteRef"

  Associates the Range with the given AD Site, provided either as the name of the AD site (if unique) or the internal reference id of the AD Site (e.g. "{#12-#1009}"). See :ref:`active-directory` for more information on this property.

Custom Fields:
""""""""""""""

In addition to the built-in fields for ranges, any custom fields defined for ranges can be populated with values.

If there is a conflict between the custom fields and the built-in fields, the custom field names take precedence. In such cases, an alternative must be selected for the built-in fields.

IP Addresses
^^^^^^^^^^^^

IP addresses can be imported when the Import Data wizard is opened from within a specific network, or from the networks overview page, where networks can be imported using the same wizard.

IP Address Column:
""""""""""""""""""

To specify which IP addresses to import, include a column with the header labeled as "IP Address", "IPAddress", "IP", "IP-Address", or "Name", and provide the IP addresses to importdin this column

Built-in Fields:
""""""""""""""""

* **Claimed?**: Identified in header line by "Claimed" and "is_Claimed".

  If set to "Yes", the IP is claimed permanently. "No" waives the claim, if claimed.

* **DNS Hosts**: Identified in header line by: "DNS Hosts" or "DNS Records" (plural or singular, space can be removed or replaced with "_").

  The column should be a list of fully qualified hostnames that should be added to the IP, space or comma separated, or that need to be removed from the IP. To remove specific hostnames, prefix the hostname with a hyphen "-". To clear all DNS records from the IP, use the value "$null" or "%clear". Otherwise, the hostnames are added to the IP, if they don't exist already. This means these DNS records are created in the appropriate DNS Zones during the import.

Custom Fields:
""""""""""""""

Same applies here as for ranges; all the custom properties defined for IP addresses can be imported.

DHCP Reservations
^^^^^^^^^^^^^^^^^

DHCP reservations can be imported when the Import wizard is opened from within a particular network, or from the networks overviwe page.
   
.. Note::
   DHCP reservations can only be imported within a DHCP scope.

Examples
--------

Example 1
^^^^^^^^^

This example creates imports two ranges, 1.2.3.0/24 and 1.2.4.0/24 with the respective titles and descriptions.

.. code-block::

  Range,Title,Description
  1.2.3.0/24, My range, My first range to import
  1.2.4.0/24, My range2, My second range to import

Example 2
^^^^^^^^^

This example creates deletes two ranges, 1.2.3.0/24 and 1.2.4.0/24.

.. code-block::

  Action,Range
  Delete,1.2.3.0/24
  Delete,1.2.4.0/24

Example 3
^^^^^^^^^

This example updates properties on the, 1.2.3.0/24 and 1.2.4.0/24. Notice how the mandatory Title column can be omitted during update, and will be left as is, whether currently empty or not.

.. code-block::

  Action,Range,Location
  Update,1.2.3.0/24, US
  Update,1.2.4.0/24, US

Example 4
^^^^^^^^^

This example updates information on two IP addresses.

.. code-block::

  IP, Responsible Person
  1.2.3.10, Jon
  1.2.4.11, Snow

.. _import-ipam-example-5:

Example 5
^^^^^^^^^

This example clears Responsible Person property on two IP addresses.

.. code-block::

  IP, Responsible Person
  1.2.3.10, $null
  1.2.4.11, $null

Example 6
^^^^^^^^^

This example Adds DNS records to two IP addresses, and clears from the third.

.. code-block::

  IP, DNS Hosts
  1.2.3.10, hostname.company.com hostname.company2.com
  1.2.4.11, -hostname2.comany.com hostname3.company.com
  1.2.4.12, $null

Example 7
^^^^^^^^^

This example shows how to set properties and add reservations to IPs, both DHCPv4 and DHCPv6

.. code-block::

   DHCPv4
   IP Address, Name, Method, ClientIdentifier, Type, DDNS hostname (optional)
   1.1.4.1, Test, HardwareAddress, 00:00:00:00:00:01, DHCP, ddi.com
   1.1.4.4, Test, ClientIdentifier, 00:00:00:00:00:04, BOOTP,

.. code-block::

   MS DHCPv6
   IP Address, Name, DUID, IAID
   2001::df07, Test, 0001ac2378bc0987, 1337

.. code-block::

   Kea DHCPv6
   IP Address, Method, Clientidentifier, DDNS hostname (optional)
   2002::df27, HardwareAddress, 12:56:00:22:34:22, ddi.com
   2002::df28, ClientIdentifier, 67:48:21:99:59:11

Example 8
^^^^^^^^^

This example shows how to modify an already existing reservation.

.. code-block::

   DHCPv4
   Action,IPAddress,ClientIdentifier,Name
   Update, 1.1.4.1,00:00:00:00:00:10, new name
   Update, 1.1.4.2,00:00:00:00:00:20, also a new name

.. code-block::

   MS DHCPv6
   Action,IPAddress,DUID,IAID,Name
   Update, 2001::df07, 0001ac2378bc0987, 1337, new name

.. code-block::

   Kea DHCPv6
   Action,IPAddress,ClientIdentifier,DDNSHostname (optional)
   Update, 2001:db8:6:0:e0f3:edc6:4dc0:df07, 78:00:77:66:55:55, hus.com

Example 9
^^^^^^^^^

This example shows how to remove a reservation from an IP address.

.. code-block::

   DHCPv4
   Action,IPAddress
   Del,1.1.4.1

.. code-block::

   DHCPv6
   Action,IPAddress
   Del,2010::b897:2aaa:b854:c10c
