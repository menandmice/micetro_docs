.. _firewall-ports:

Networking requirements
=======================

Certain ports need to be open for Micetro’s different components to communicate with each other.

The following table lists all services and their respective ports to be opened for incoming communications from the source components.

.. csv-table::
  :header: "Service name", "Port", "Protocol", "Source(s)"
  :widths: 30, 10, 10, 60

  "DNS Server Controller(s)",	1337,	"TCP",	"Men&Mice Central"
  "Men&Mice Central",	1231,	"TCP",	"Management Console, Web Application"
  "Web Application",	"80/443",	"TCP",	"User’s browser"
  "PostgreSQL",	5432,	"TCP",	"Men&Mice Central"
  "PostgreSQL",	5000,	"TCP",	"PSQL HA nodes"

Make sure that the servers running these services have the corresponding ports open in their firewalls.
