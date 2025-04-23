.. meta::
   :description: Access permissions needed to manage DNS and DHCP services in Micetro
   :keywords: DNS servers, DHCP servers, DNS server management, DHCP server management, permissions, Access

.. _service-management-access:

Service Management Access Permissions
=====================================
Depending on user permissions and available license keys, DNS and DHCP services and functions may be disabled or hidden in the Web Application.

Micetro has a granular role-based :ref:`access-control` system. It's recommended that DNS and DHCP administrators be assigned the built-in **DNS Administrators** and/or **IPAM Administrators** roles. To manage appliances, it's recommended that a user is assigned the built-in **Administrators** role. 

When not using the built-in roles, users must be assigned a role with the following permissions to manage the respective services:

* To manage DNS services: **Administer DNS servers**

* To manage DHCP services: **Administer DHCP servers**

* To manage cloud services: **Access to manage clouds**

* To manage appliance services: **Administer appliances**

.. note::
    Additional permissions may be necessary for comprehensive service management. For more information about Micetro's granular role-based access controls, refer to :ref:`access-control`. 
