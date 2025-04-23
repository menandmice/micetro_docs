.. meta::
   :description: Using the Kea Control Agent to manage Kea DHCP servers and services in Micetro
   :keywords: Kea Control Agent, Kea DHCP, Micetro

.. _kea-control-agent:

Kea Control Agent
-----------------
The Kea Control Agent serves as a crucial component, operating as a daemon that provides a RESTful control interface for the seamless management of Kea servers. This agent can receive control commands via HTTP and can either forward them to the respective Kea servers or execute them on its own.

Using the Kea Control Agent, you can add Kea DHCP servers to Micetro without a DHCP agent running on every machine hosting Kea. One DHCP agent, installed on a machine with access to the Kea service instances, is sufficient and will communicate with all Kea servers on behalf of Micetro.

.. note::
  The default port for the Kea Control Agent is ``8000``.
