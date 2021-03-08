.. _admin-system-settings:

System Settings
===============

From the menu bar, select Tools, System Settings.

The System Settings dialog box displays and includes these tabs:

  * :ref:`admin-general`

  * :ref:`admin-logging`

  * :ref:`admin-error-checking`

  * :ref:`admin-comments`

  * :ref:`admin-external-commands`

  * :ref:`admin-dns`

  * :ref:`admin-ipam`

  * :ref:`admin-monitoring`

.. _admin-general:

General
-------

Through this function, you can specify the following:

  * Whether to allow single sign-on

  * Settings for AD Sites and Subnets integration

  * Rules to determine when an IP address is considered as being in use

  * Advanced system settings

To display the General Settings dialog box, do the following:

1. From the menu bar, select Tools, System Settings.

.. image:: ../../images/console-system-settings.png
  :width: 90%
  :align: center

2. In the System settings dialog box, click the General tab.

3. Allow Single Sign-on. When selected, Active Directory users do not have to authenticate when logging in through the Management Console or the Command Line Interface.

4. Allow single sign-on through web interface on IIS. To enable single sign-on in the web interface, the web server needs to be configured. Refer to Appendix C – Active Directory Single Sign-on .

5. Enable AD sites and subnets integration . Check this checkbox to enable the integration feature. When the integration is active, all sites and their corresponding subnets in Active Directory displays in the Men & Mice Suite and you can add and remove subnets in sites and move subnets to different sites. Once Sites and Subnets integration has been enabled, an  AD Sites  object displays in the object list on the left hand side of the Manager window and a new column,  AD Site  displays in the range list in the Manager window. If you want to synchronize the  Location  and  Description  fields of the subnets in Active Directory against custom properties in the Men & Mice Suite, choose the custom properties to synchronize against. When synchronization is active, any changes made to the fields in Active Directory will update the corresponding fields in the Men & Mice Suite and vice versa.

6. Enforce AD site inheritance.  Select this checkbox if you want to enforce site inheritance in AD. When site inheritance is enforced, child subnets must reside in the same site as the parent subnet. If site inheritance is not enforced, child subnets can be placed in different sites than the parent subnet.

7. Determine Address in use . This section contains several checkboxes that determine whether an IP Address should be considered as being in use. Check the appropriate checkboxes to specify which rules should be applied to the IP Addresses.

8. Advanced system settings . Click this button to display the dialog box for entering advanced system settings. For more information about the contents of this dialog box, see the Men & Mice Knowledge Base.

9. When the desired selections/entries are made, click  OK .
