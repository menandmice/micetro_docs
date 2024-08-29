.. meta::
   :description: Required firewall ports for Micetro
   :keywords: firewall, ports, security, Micetro

.. _firewall-ports:

Networking Requirements
=======================

Certain ports need to be open for Micetro's different components to communicate with each other.

The following table lists all services and their respective ports to be opened for incoming communications from the source components.

.. csv-table::
  :header: "Service name", "Port", "Protocol", "Source(s)"
  :widths: 30, 10, 10, 60

  "Micetro Central",	1231,	"TCP",	"Management Console, Web Application, SOAP API"
  "Web Interface",	"80/443",	"TCP",	"User's browser"
  "PostgreSQL",	5432,	"TCP",	"Micetro Central"
  "PostgreSQL",	5000,	"TCP",	"PSQL HA nodes"
  "Kea", 8000, "TCP", "Kea Control Agent"
  "DNS Agents", 1337, "TCP", "Micetro Central"
  "DHCP Agents", 4151, "TCP", "Micetro Central"
  "Micetro Updater", 4603, "TCP", "Micetro Central"

Make sure that the servers running these services have the corresponding ports open in their firewalls.
