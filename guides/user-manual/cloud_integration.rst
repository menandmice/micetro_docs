.. meta::
   :description: Micetro native integration with cloud based DNS services, IP address related data management for Azure and AWS  
   :keywords: Micetro by Men&Mice, multicloud, multicloud integration 

.. _cloud-integration:

Overview
========

Micetro now can integrate natively with cloud based DNS services as well as manage IP address related data for Azure and AWS, including virtual networks and subnets that exist in cloud accounts.

In previous versions to version 8.2, only Azure DNS was natively supported and Amazon Route 53 was supported through the Men&Mice Generic DNS Controller, but as of 8.2 all cloud services are natively supported and all are easily added to Micetro as cloud instances. In version 8.3 partial support for Akamai Fast DNS was added. In version 9.2 support for managing multiple AWS cloud accounts using the same credentials was added.

Supported Cloud Services
------------------------

.. csv-table::
  :header: "Cloud service", "DNS", "IPAM"
  :widths: 10, 30, 30

  "Akamai",	"Yes (Akamai Fast DNS)", "N/A"
  "Azure", "Yes (Azure DNS [1]_)", "Yes"
  "Amazon Web Services (AWS)", "Yes (Amazon Route 53)", "Yes"
  "OpenStack", "No", "Yes"
  "NS1", "Yes", "N/A"
  "Dyn", "Yes",	"N/A"

.. [1] see :ref:`configure-azure-dns`

DNS
---

The use of a cloud DNS service in Micetro is transparent to the user. Adding DNS zones, DNS records, or modifying the two is done in the same way as with other DNS servers in Micetro.  Currently only master zones can be created on cloud DNS services.

IPAM
----

Configure Cloud Integration
---------------------------

To start using the available cloud services, they need to be added and configured through the Men&Mice Management Console.

For detailed instructions on how to configure Men&Mice Cloud integration, see :ref:`configuring-cloud`.

Using Cloud Integration
-----------------------

Using the available cloud services in Micetro is as easy as using DNS Zones, records, or subnets as before.

For detailed instructions on how to use Men&Mice Cloud integration, see :ref:`using-cloud`.
