.. meta::
   :description: Adding DHCP servers (Microsoft DNS, ISC DHCP, Kea, Cisco) to Micetro
   :keywords: DHCP, Micetro, Microsoft DHCP, ISC DHCP, Kea, Cisco DHCP

.. _adding-dhcp:

Adding DHCP a service
=====================

DHCP servers require :ref:`install-controllers` and need to be added using their fully qualified names (such as ``dns1.europe.ad.mmdemo.local``).

.. note::
  Servers in Microsoft Active Directory environments can be added without installing an agent. Refer to :ref:`agent-free-dns-dhcp`.

.. note::
  ISC DHCP servers require a DHCP agent to be installed on each DHCP server. Kea servers require only one DHCP agent to be installed in the system, either on the machine running Kea or on a machine that can connect to the :ref:`kea-control-agent` through the network.

The following table demonstrates the different options when adding a DHCP Server.

.. csv-table::
  :header: "Server type", "Description"
  :widths: 20, 80

  "Microsoft Agent-free (use proxy not checked) [1]","The DHCP agent has been installed on the machine running Micetro Central and that machine will be used as a proxy. Micetro is not able to track lease history data."
  "Microsoft Agent-free (use proxy checked) [1]","The DHCP agent has been installed on the machine identified in the **Use proxy server** field and that machine will be used as a proxy. Micetro is not able to track lease history data."
  "Microsoft with Agent Installed", "The DHCP agent has been installed on the remote DHCP server. Micetro is able to track lease history data."
  "ISC DHCP", "Either a Unix server running the ISC DHCPD or a Micetro Appliance with the ``mm-dhcpd`` package installed."
  "ISC Kea Agent (Agent-free) [1]", "A server running ISC Kea with the :ref:`kea-control-agent` installed and accessible to the DHCP."
  "ISC Kea [2]", "A server running ISC Kea with a DHCP agnet and Control Agent installed."
  "Cisco (Use proxy not checked)", "The DHCP agent has been installed on the machine running Micetro Central and that machine will be used as a proxy."
  "Cisco (Use proxy checked)", "The DHCP agent has been installed on the machine identified in the **Use proxy server** field and that machine will be used as a proxy."

.. [1] See :ref:`agent-free-dns-dhcp`.

.. [2] Alternatively, you can configure a socket for communication in ``kea-dhcp4.conf``.

.. important::
  To add Kea servers to Micetro, they need to be configured with the ``libdhcp_lease_cmds.so`` library. Refer to :ref:`add-kea-hooks` for details.

Services are managed on the :guilabel:`Service Management` tab of the **Admin** page. To add a new server, select :guilabel:`Add Service` in the task bar.

For for information, refer to :ref:`adding-service` in the :ref:`Admin Guide<admin-overview>`.
