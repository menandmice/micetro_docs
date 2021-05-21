.. meta::
   :description: ISC DHCP servers in the Men&Mice Management Console 
   :keywords: ISC, DHCP, management, console 
   
.. _dhcp-isc:

ISC DHCP
--------

.. note::
  To manage ISC DHCP servers in the Management console, see :ref:`console-dhcp-isc`.

.. _dhcp-isc-define-options:

Defining Options on ISC DHCP Servers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. In :menuselection:`Admin --> Server Management` select the applicable DHCP Server and select :guilabel:`Edit DHCP options` from the ellpisis menu or use :menuselection:`Actions --> Edit DHCP options`. The *Edit DHCP Options* box displays. The dialog box shows all custom options defined on the DHCP server. The available ISC DHCP options can be selected from the dropdown menu.

2. To add an option, select it from the option list. The option field is added to the dialog.

3. To delete an option, hover over its field and click the trash button next to it.

4. Click :guilabel:`Save` to save the changed option definitions.

.. _isc-dhcp-properties:

ISC Server Properties
"""""""""""""""""""""

Authoritative
  Specifies whether the server is authoritative to determine if a DHCP request from a client is valid

DDNS Domain Name
  Specifies the DNS domain name to use to store the A record for a DHCP client.

DDNS Reverse Domain Name
  Specifies the DNS reverse domain name to use to store the PTR record for a DHCP client.

DDNS Update Style
  Specifies how the DHCP server does DNS updates. The available styles are:

  None
    Dynamic DNS updates are not performed

  Ad-hoc

    .. warning::
      This update scheme is deprecated

  Interim
    This is the recommended scheme for dynamic DNS updates

DDNS Updates
  Specifies whether to perform DNS updates. This setting has no effect unless DNS updates are enabled globally with the DDNS Update Style setting.

DDNS TTL
  Specifies (in seconds) the TTL value to use when performing a DNS update.

Default Lease Time
  Specifies (in seconds) the default lease time to use for DHCP leases.

Log Facility
  Specifies which syslog facility to use when logging DHCP server messages. All possible facilities are listed; however, not all of these facilities are available on all system.

Max/Min Lease Time
  Specifies (in seconds) the maximum/minimum lease time to use for DHCP leases.

Get Lease Hostnames
  Specifies whether the DHCP server should perform a reverse DNS lookup for each address assigned to a client and send the result to the client in the hostname option.

One Lease per Client
  Specifies whether the DHCP server should free any existing leases held by a client when the client requests a new lease.

Ping Check
  Specifies whether the DHCP server should send an ICMP echo message to probe an IP Address before offering it to a DHCP client.

Ping Timeout
  Specifies for how many seconds the DHCP server should wait for an ICMP echo response when Ping Check is active.

Filename
  Specifies the name of the initial boot file to be used by a client.

Server Name
  Specifies the name of the server from which the client should load its boot file.

Next Server
  Specifies the host address of the server from which the initial boot file (that is specified by Filename) is to be loaded.

Restart
-------

See :ref:`console-dhcp-isc-restart`.
