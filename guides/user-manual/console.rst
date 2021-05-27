.. _console:

Management Console
******************

Overview
--------

Prior to starting the Men&Mice Management Console, make sure that you have installed and started the other Men&Mice Suite modules, as required. Refer to the Installation Guide for other components.
The Men&Mice Management Console boasts a very intuitive interface. It is the central organizational tool of the Men&Mice Suite and provides all the tools you need to oversee the management of your DNS and DHCP servers.

The Men&Mice Management Console is the GUI client of a client/server application that allows you to administer local DNS/DHCP servers and IP Addresses. Specifically, it provides a simple graphical user interface that allows you to manage your domain names and IP Addresses.

From the Management Console, you can simultaneously manage DHCP/DNS servers on different platforms.

.. note::
  Be aware that you will only be able to view the servers to which you have access. The administrator user has access to all servers.

Launching the Men&Mice Suite
----------------------------

When logging into the Men&Mice Management Console, you have the option to choose "Single Sign-on." This allows those users working on a Microsoft Network with Active Directory to sign on one time only to access all your resources.

.. note::
  If you are the system administrator, you can choose whether to enable this option. In the Management Console, move to the menu bar and select Tools, System Settings. In the System settings dialog box, click the General tab. Check in the checkbox next to Allow Single Sign-on to enable this option. Then click OK.

To start the Management Console, do the following:

1. Locate and launch the Men&Mice Management Console. The Men&Mice Management Console login dialog box displays.

.. image:: ../../images/console.png
  :width: 60%
  :align: center

2. In the Server name field, type the name or IP Address (IPv4 or IPv6) of the workstation on which Men&Mice Central is running. This is only required the first time you log in. After a successful connection, this field will be pre-filled with the server name you enter.

3. In the User and Password fields, type the applicable information. The default value for both fields is administrator.

4. If you want to enable Single Sign-on, click in the checkbox.

5. Click the Connect button. If this is the first time any user logs into this particular Men&Mice Central, the First Use Wizard launches. Otherwise, within a few moments, the Men&Mice Management Console will start, and the Manager window will display.

First Use Wizard
----------------

The First Use Wizard has been improved greatly in version 6.8. It is able to discover

* DNS Servers

* DHCP Server

* AD Subnets

When connecting the Management Console to a newly installed instance of Men&Mice Central or if this is the first time logging in, you will be presented by the First Use Wizard.

1. Log in using the default credentials (administrator:administrator). You will be presented by the figure below. Click 'Next' after having specified a new password for administrator user.

.. image:: ../../images/first_login.png
  :width: 60%
  :align: center

2. Complete each screen as you move through the wizard.

3. The wizard will finish after the user clicks the 'Finish' button and afterwords the changes will be applied.

Console functions
-----------------

.. toctree::
  :maxdepth: 2

  console_gui
  console_menus
  console_toolbars
  quickfilter
  console_actions
  console_health_bar
