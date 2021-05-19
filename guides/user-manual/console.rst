.. meta::
   :description: How to launch the Men&Mice Management Console
   :keywords: management, console, Men&Mice

.. _console:

Management Console
******************

Overview
--------

Prior to starting the Men&Mice Management Console, make sure that you have installed and started the other Micetro components as applicable. Refer to the :ref:`implementation` for other components.

The Men&Mice Management Console is a rich, Windows-only application that boasts a very intuitive interface. It is a central organizational tool of Micetro and provides all the tools you need to oversee the management of your DNS and DHCP servers and IP Addresses.

From the Management Console, you can simultaneously manage DHCP/DNS servers on any supported platform.

.. note::
  Be aware that you will only be able to view the servers to which you have access. The administrator user has access to all servers.

Launching the Management Console
--------------------------------

When logging into the Men&Mice Management Console, you have the option to choose "Single Sign-on." This allows those users working on a Microsoft Network with Active Directory to sign on one time only to access all your resources.

.. note::
  If you are the system administrator, you can choose whether to enable this option. In the Management Console, move to the menu bar and select :menuselection:`Tools --> System Settings`. In the **System settings** dialog box, click the *General* tab. Check in the checkbox next to :guilabel:`Allow Single Sign-on` to enable this option. Then click :guilabel:`OK`.

To start the Management Console, do the following:

1. Locate and launch the Men&Mice Management Console. The Men&Mice Management Console login dialog box displays.

.. image:: ../../images/console.png
  :width: 60%
  :align: center

2. In the Server name field, type the name or IP Address (IPv4 or IPv6) of the workstation on which Men&Mice Central is running. This is only required the first time you log in. After a successful connection, this field will be pre-filled with the server name you enter.

3. In the **User** and **Password** fields, type the applicable information. The default value for both fields is ``administrator``.

4. If you want to enable Single Sign-on, click in the checkbox.

5. Click the :guilabel:`Connect` button. If this is the first time any user logs into this particular Men&Mice Central, the :ref:`first-use-wizard` launches. Otherwise, within a few moments, the Men&Mice Management Console will start, and the Manager window will display.

First Use Wizard
^^^^^^^^^^^^^^^^

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

.. toctree::
  :maxdepth: 1
  :hidden:

  console_gui
  console_menus
  console_toolbars
  console_quickfilter
  console_actions
  console_health_bar
