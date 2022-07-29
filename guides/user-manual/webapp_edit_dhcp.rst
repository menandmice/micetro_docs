.. meta::
   :description: Viewing, adding, removing DHCP options in the Micetro by Men&Mice Web Application  
   :keywords: DHCP options, DDI
   
   
.. Note::
   DHCPv4 and DHCPv6 scopes inherit DHCP and DDNS Options from the parent DHCP server. DHCPv4 and DHCPv6 reservation inherit DHCP and DDNS options from the DHCP scope. However these options may be changed by editing the options for the specific scope or reservation.
   
.. _webapp-edit-dhcp:

Edit DHCP Options
=================

View the configured DHCP options for a DHCP scope
-------------------------------------------------

1. Select the DHCP scope in the network list

2. Click on the :guilabel:`Edit DHCP options` task.

3. A dialog is displayed. Note that in order to see the options that have inherited values, the :guilabel:`Show inherited options` checkbox needs to be checked.

.. image:: ../../images/blackstar-edit-dhcp.png
  :width: 70%
  :align: center

Add a new DHCP option
---------------------

1. Start typing into the :guilabel:`Add an option` field. Either type in the name of the option or the option number.

2. A list of available options will be displayed as you type.

.. image:: ../../images/blackstar-edit-dhcp-autocomplete.png
  :width: 70%
  :align: center

3. Select the option you want to add.

4. The option is now shown in the list and you can add values to the option.

Configuring DHCPv6 and DDNS Options (Microsoft Only)
-------------------------------------------

1. Go to :guilabel:`Admin` in the web UI and click on :guilabel:`Server Management`

2. Expand :guilabel:`DHCP Servers` and select :guilabel:`Microsoft DHCP`

3. Select one or multiple servers, hover over the selected server(s) and click on the ellipsis (or meatball) menu

4. Click on the :guilabel:`Edit DHCPv6 Options` task

5. Under the Options tab, select the appropriate options

.. image:: ../../images/dhcpv6-options.png
  :width: 70%
  :align: center


6. Click on the DNS tab and select whether you'd like to 
   Enable DNS dynamic updates according to the settings below
      i. Always dynamically update DNS records
      ii. Discard AAAA and PTR records when lease is deleted
      
.. image:: ../../images/ddns-dhcpv6-options.jpg
  :width: 70%
  :align: center
  
7. Click :guilabel:`Save` to save your settings
      
Removing a DHCP option
----------------------

Hovering over an option will display a trashcan icon to the right of the option.

Clicking on the trashcan will remove the option.

HEX and ASCII representation
----------------------------

Some DHCP options, such as DHCP option 43 (Vendor specific info) require the value to be in HEX format. In this case the UI offers the value to be viewed both as HEX and ASCII by selecting each option in tabs above the field, as seen in the figure below.

.. image:: ../../images/blackstar-edit-dhcp-ascii-hex.png
  :width: 70%
  :align: center
