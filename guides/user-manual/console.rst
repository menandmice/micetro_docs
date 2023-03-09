.. meta::
   :description: How to launch the Men&Mice Management Console
   :keywords: DNS management, DDI, Men&Mice Management Console

.. _console:

Management Console
******************

.. note::
  Migrating features from the Management Console to the Web Interface is ongoing, and new features are not added to the Console.

Overview
--------

Prior to starting the Men&Mice Management Console, make sure that you have installed and started the other Micetro components, as applicable. For more information about other components, see :ref:`implementation`.

The Men&Mice Management Console is a rich, Windows-only application that boasts a very intuitive interface. It is a central organizational tool of Micetro and provides all the tools you need to oversee the management of your DNS and DHCP servers and IP Addresses.

From the Management Console, you can simultaneously manage DHCP/DNS servers on any supported platform.

.. note::
  Be aware that you will only be able to view the servers to which you have access. The administrator user has access to all servers.

Launching the Management Console
--------------------------------

When logging into the Men&Mice Management Console, you have the option to choose "Single Sign-on." This allows those users working on a Microsoft Network with Active Directory to sign on one time only to access all your resources.

.. note::
  If you are the system administrator, you can choose whether to enable this option. On the :guilabel:`Tools` menu, select :guilabel:`System Settings`. On the :guilabel:`General` tab, select the :guilabel:`Allow Single Sign-on` checkbox to enable this option. Then click :guilabel:`OK`.

**To start the Management Console:**

1. Locate and launch the Men&Mice Management Console. The Men&Mice Management Console login dialog box displays.

.. image:: ../../images/console.png
  :width: 60%
  :align: center
|
2. In the **Server name** field, enter the name or IP Address (IPv4 or IPv6) of the workstation on which Men&Mice Central is running. This is only required the first time you log in. After a successful connection, this field will be pre-filled with the server name you enter.

3. In the **User** and **Password** fields, enter the applicable information. The default value for both fields is ``administrator``.

4. If you want to enable Single Sign-on, select the checkbox.

5. Click :guilabel:`Connect`. If this is the first time any user logs into this particular Men&Mice Central, the :ref:`first-use-wizard` launches. Otherwise, within a few moments, the Men&Mice Management Console will start, and the Manager window will be displayed.

First Use Wizard
----------------

The First Use Wizard opens when you connect the Management Console to a newly installed instance of Men&Mice Central or log in for the first time. The wizard is able to discover:

* DNS Servers

* DHCP Server

* AD Subnets

1. Log in using the default credentials (administrator:administrator). Enter a new password for the administrator user, and then click :guilabel:`Next`. 

.. image:: ../../images/first_login.png
  :width: 60%
  :align: center
|
2. Follow the instructions to complete each page, and then click :guilabel:`Finish`.

Console Features
----------------

.. toctree::
  :maxdepth: 1

  console_gui
  console_menus
  console_toolbars
  console/console_quickfilter
  console_actions
  console_health_bar
  console_dns_zones
  devices
 

