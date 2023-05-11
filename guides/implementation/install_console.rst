.. meta::
   :description: How to install the Men&Mice Management Console, the Windows client for Micetro by Men&Mice
   :keywords: Micetro, Windows client, installation

.. _install-console:

Installing the Management Console
===================================

Men&Mice Management Console is a soon-to-be deprecated, Windows-based user interface of Micetro. As a Windows-based application it needs to be installed on a Windows machine.

.. note::
  Functionality from the Management Console is in the process of being migrated to the :ref:`web-application`.

Run the Men&Mice Management Console installer (with Administrative privileges). Once installed, launch the application:

.. image:: ../../images/console.png
  :width: 50%
  :align: center

Log in with the default credentials:

* username: ``administrator``
* password: ``administrator``

The “Server name” field requires the domain or the IPv4/v6 address of the server running the Men&Mice Central application. (This only needs to be defined once, and will autofill on subsequent logins.)
Successful login confirms that Men&Mice Central is running, connected to the database, and accessible for the Management Console.

.. note::
  You can disable the "Server name" field: see :ref:`webapp-fixed-central`.
