.. meta::
   :description: Handling external changes with Kea DHCP servers in Micetro
   :keywords: External changes, Kea DHCP, Micetro

.. _kea-external-changes:

Handling External Changes with Kea
==================================

.. warning::
  You should always edit the Kea DHCP server's configuration file through Micetro to ensure instant the synchronization between Micetro and the Kea DHCP server is instant, where any modifications made are immediately updated in the database and reflected in the user interface.

Micetro uses the in-memory configuration of the Kea server. If external changes must be made to a Kea DHCP server's configuration file, the changes to the configuration file aren't processed by the server until forced to parse the file to its *in-memory* structure, so Micetro can be made aware of these changes.

.. note::
  All changes made to the configuration file through Micetro will automatically and instantly be propagated to the secondary/backup servers in a :ref:`dhcp-kea-ha` setup.


To make the Kea DHCP server process changes to its configuration file a call has to be made to either the :ref:`kea-control-agent` or the socket that Kea uses.

Here is an example of the call to the control agent:

.. code-block:: bash

  curl -X POST -H "Content-Type: application/json" -d '{ "command": "config-reload", "service": [ "dhcp4" ] }' localhost:8000

If successful, the result looks like this:

.. code-block::

  [ { "result": 0, "text": "Configuration successful." } ]

After the changes to the configuration file have been accepted and parsed into the Kea DHCP servers memory structure, you can display them in Micetro through the :guilabel:`Edit Configuration` action for the server.

External Changes and Kea High Availability
------------------------------------------
For information about making external changes to Kea in High Availability setup, refer to :ref:`dhcp-kea-ha-external-changes`.
