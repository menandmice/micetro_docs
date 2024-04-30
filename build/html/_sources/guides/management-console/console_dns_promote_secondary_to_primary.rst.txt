.. meta::
   :description: The Promote Zone feature in Micetro by Men&Mice makes it possible to change a slave zone to a master zone
   :keywords: Men&Mice, dns server

.. _console-dns-promote-secondary-to-primary:

Promote Slave to Master (Management Console, obsolete)
--------------------------------------------------------

The Promote Zone feature makes it possible to change a slave zone to a master zone. This might be necessary in emergency situations, for example if the master zone becomes unavailable for an extended period of time. This feature is only available for DNS Administrators.

When a slave zone is promoted, the following actions are performed:

* Micetro checks whether the most recent copy of the zone is found in its internal database or on the server hosting the slave zone and uses the copy that is more recent.

* The server hosting the slave zone is configured so that the zone is saved as a master zone on the server.

* The zone history and access privileges from the old master zone are applied to the new master zone.

* The configurations of other instances of the slave zone are modified so that they will get the updates from the new master zone.

To promote a slave zone to a master zone, do the following:

1. Select the DNS server that contains the slave zone.

2. Right-click the slave zone you want to promote and, from the shortcut menu, select :guilabel:`Promote to master`. An information message displays:

.. image:: ../../../images/console-dns-zones-promote.png
  :width: 30%
  :align: center

3. Click :guilabel:`Yes` to continue, or :guilabel:`No` to discontinue the process.
