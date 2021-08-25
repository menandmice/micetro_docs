.. meta:: 
   :description: Server states in the Micetro web application
   :keywords: DNS server, DHCP server, DNS service, DHCP service, server controller

.. _server-states:

Server states 
-------------

On the :menuselection:`Admin --> Server management` page Micetro displays an indicator of the state of the individual servers configured in the system.

.. image:: ../images/server-states.jpg
    :width: 80%
    :align: center 

The inidcators can refer to either the Server Controller (see :ref:`install-controllers`) running on the DNS/DHCP server, or the DNS/DHCP server service itself. 

Use the following table for more information on the indicators:

.. csv-table::
    :header: "Indicator", "Component", "Explanation"
    :width: 10, 10, 80

    "Unknown", "Controller", "The status of the DNS/DHCP Server Controller is unknown."
    "OK", "Server, Controller", "The DNS/DHCP Server Controller and service are both OK."
    "Unreachable", "Controller", "The DNS/DHCP Server Controller is offline or otherwise unreachable."
    "Out of date", "Controller", "The DNS/DHCP Server Controller has a different version than Central."
    "Updating", "Controller", "The DNS/DHCP Server Controller is being updated."
    "Uninitialized", "Server", "The DNS/DHCP server is uninitialized and needs to be manually initialized."
    "Detached", "Server", "The DNS/DHCP server has been detached without removing it from Micetro."
    "Service Down", "Server", "The DNS/DHCP server is down and not responding to queries."
    "Service Impaired", "Server", "The DNS/DHCP server is running but impaired. [1]_"

.. [1] In Kea HA configurations. See :ref:`dhcp-kea-ha`.