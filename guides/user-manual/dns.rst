.. meta::
   :description: DNS management in Micetro 
   :keywords: DNS servers, zones, records, policies

.. _dns:

DNS
====

Micetro's :ref:`access control` system provides granular control over who can access DNS information. The system includes the following built-in roles that provide varying levels of access to the DNS page. 

* **DNS Administrators**
* **DNS viewers** (allows viewing of DNS information)

To grant other roles access to DNS information, make sure that they include the following permissions:

* **Access DNS module**
* **List (or view) DNS server**
* **List (or view) zone**

.. note::
   To fully manage zones, additional permissions may be required, and specific access might be defined on individual zones.
   

.. toctree::
  :maxdepth: 1

  dns_zones
  dns_records
  webapp_import_dns_records
  webapp_import_ipam_data
 
