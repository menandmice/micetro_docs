.. _console-dns-zone-icons:

Zone Icons (Management Console)
-------------------------------

When viewing the zones, you will notice indicators that show the zone type.

.. |static| image:: ../../../images/console-dns-zone-static-icon.png
.. |dynamic| image:: ../../../images/console-dns-zone-dynamic-icon.png
.. |ad| image:: ../../../images/console-dns-zone-ad-icon.png
.. |stub| image:: ../../../images/console-dns-zone-stub-icon.png
.. |forward| image:: ../../../images/console-dns-zone-forward-icon.png
.. |controls| image:: ../../../images/console-dns-zones-zone-controls-icon.png
.. |analyze| image:: ../../../images/console-analyze.png

  The Management Console displays zone type with the following icons:

.. csv-table:: DNS zone icons in the Management Console
  :header: "Icon", "Description"
  :widths: 5, 95

  |static|, "An icon with a blue dot indicates a static master zone, which is always the original copy of the zone, and always present on that zone's master server."
  |dynamic|, "An icon with a gold dot indicates a dynamic master zone, which is always the original copy of the zone, and always present on that zone's master server."
  |ad|, "An icon with a purple dot indicates an Active Directory Integrated zone."
  |stub|, "A half page icon represents a stub zone."
  |forward|, "An icon with an arrow pointing to the right represents a forward zone."
  , "A faded icon without any color marking indicates a slave zone. A slave zone is a duplicate of a master zone that is made on the master zone's slave server(s). Slave zones bring redundancy and stability to the DNS system because it allows more than one server to process domain requests, and allows requests to be processed even if one of the servers becomes unavailable."

.. note::
  These indications are not related to which physical server on which the zone is created. Any server can be the master server. The terms master and slave are only relative to the zones. Whichever server the zone was created on is the master server for that zone. This means that a new zone is always created on the master server.
