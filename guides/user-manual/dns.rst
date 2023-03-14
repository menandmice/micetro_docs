.. meta::
   :description: DNS servers, zones, records, policies 
   :keywords: DNS servers

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
   
 
Using the DNS page
-------------------
The DNS page shows a list of all DNS zones across your network. The left pane provides filtering options for the zones and in the right pane you can see the properties for the selected zone.

Use the toolbar to manage zones, such as creating, editing, and migrating zones. You can also search, filter, and configure the list. 


.. toctree::
  :maxdepth: 2

  dns_zones
  dns_records
 
