.. meta::
   :description: How to add new DNS server in the Men&Mice Management Console
   :keywords: DNS, DNS server, DNS management console

.. _console-new-dns-server:

New DNS Server (Management Console, obsolete)
-----------------------------------------------

You must be logged in as a user with privileges to administer DNS in order to add a DNS server.

.. note::
  For information on adding a DNS server on a Men&Mice Appliance, refer to :ref:`appliance-management`.

.. image:: ../../images/console-dns-add-server.png
  :width: 50%
  :align: center

To add a new DNS server, do the following:

1. From the menu bar, select :menuselection:`File --> New --> DNS Server`. The *Add DNS Server* dialog box displays.

Server Name
  Type the name (fully qualified host name) of the DNS server as the name is used for the MNAME field in the SOA record of new DNS zones. For Azure DNS the name does not really matter. If the name can't be resolved you want to specify the optional IP address.

Server address (optional)
  If desired, type the IPv4 or IPv6 address for the server. This is not required, but doing so allows the Management Console to connect to the server by IP Address instead of by name. The Server name will still be used when displaying server information and creating NS records.

Server Type
  Click the drop-down list, and select the desired server type.

  Microsoft with Agent Installed
    connects to a Microsoft DNS server that has a DNS Server Controller installed.

  Microsoft Agent-Free
    connects to a Microsoft DNS server that does not have a DNS Server Controller installed. For further information regarding this connection method, refer to :ref:`dns-remote-access`.

  BIND
    connects to BIND DNS server.

  Generic
    connects to a DNS Server Controller that is configured to support a generic DNS server.

  Azure DNS
    connects to a DNS Server Controller that is configured as Microsoft Azure DNS controller.

Use proxy server
  If you are adding a Microsoft DNS server you can specify the location of the DNS Server Controller by clicking the Use proxy server checkbox and entering the DNS name or IP Address of the machine running the DNS Server controller. This option allows the system to connect to DNS servers in different forests where a cross-forest trust does not exist. It also allows a non-Windows version of Men&Mice Central to manage Microsoft DNS servers.

2. Click :guilabel:`OK`. You are connected to the server. Once connected, the name of the newly added server displays under :guilabel:`DNS Servers` in the Object Section. (You may need to click the :guilabel:`+` sign next to DNS Servers to see it.)
