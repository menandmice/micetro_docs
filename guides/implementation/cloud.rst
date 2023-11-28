.. meta::
   :description: Configuring cloud integration
   :keywords: network cloud, integration

.. _cloud:

Cloud Integration
*****************
Micetro provides native integration with cloud-based DNS services and can manage IP address-related data for Azure and AWS, including virtual networks and subnets that exist in cloud accounts.

Using a cloud DNS service in Micetro is similar to the process of working with other DNS services. The process of adding DNS zones, DNS records, or modifying them is identical to that of other DNS servers in Micetro.  It's worth noting that, at present, cloud DNS services only support the creation of primary zones.

Supported Cloud Services
------------------------

.. important::
  To use cloud services, the DNS Server Controller must be installed on the same machine as Men&Mice Central. For information about how to install DNS controllers, see :ref:`install-dns-controllers`.

.. csv-table::
  :header: "Cloud service", "DNS", "IPAM"
  :widths: 10, 30, 30

  "Akamai",	"Yes (Akamai Fast DNS)", "N/A"
  "Azure", "Yes (Azure DNS)", "Yes"
  "Amazon Web Services (AWS)", "Yes (Amazon Route 53)", "Yes"
  "NS1", "Yes", "N/A"
|

**See also**:

* :ref:`cloud_integration`

* :ref:`aws_multi_account`

* :ref:`cloud_minimum_permissions`

* :ref:`configure_azure_dns`
