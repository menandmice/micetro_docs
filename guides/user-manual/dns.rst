.. meta::
   :description: DNS management in Micetro 
   :keywords: DNS servers, zones, records, policies

.. _dns:

DNS
====

On the **DNS** page, manage your DNS information, including zones and resource records all in one place. Here, you can create and delete zones, migrate zones between servers, edit zone options, manage zone records, and more.

.. image:: ../../images/DNS-Micetro.png
   :width: 90%

Micetro's role-based and centralized :ref:`Access Management<access-control>` system provides granular control over who can access DNS information. The system includes the following built-in roles that provide varying levels of access to the **DNS** page: 

* **DNS Administrators**
* **DNS viewers** (can only view DNS information)

To grant other roles access to DNS information, make sure that they include the following permissions:

* **Access DNS module**
* **List (or view) DNS server**
* **List (or view) zone**

.. note::
   To fully manage zones, additional permissions may be required. Specific access might be defined on individual zones and require explicit permissions.
   
.. toctree::
  :maxdepth: 1

  dns_zones
  managing_dns_zones
  dns_records
  webapp_import_dns_records
