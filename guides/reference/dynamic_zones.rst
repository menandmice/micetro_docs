.. _dynamic-zones:

Dynamic Zones
=============

Overview
--------

The Men and Mice Suite allows you to work with dynamic zones on BIND and the Windows DNS server.

This section describes how the Men&Mice Suite handles dynamic zones and how to configure your DNS server to allow the program to work with dynamic zones.

Static vs. Dynamic Zones
------------------------

Due to the nature of dynamic zones, the Management Console must handle such zones differently from static zones. Below, you will find information on how the software handles dynamic zones compared to static zones.

.. csv-table::
  :header: "Static zones", "Dynamic Zones"
  :widths: 50, 50

  "The zone content is read from disk on the server.", "The zone content is retrieved from the server via a zone transfer."
  "Records can be enabled and disabled. Disabled records are commented out in the zone files.", "Disabling records is not possible."
  "Specifying a TTL value for individual records is optional.", "Every record must have a TTL explicitly set."
  "Every resource record can have a comment associated with it.", "Comments are not supported for records."

BIND Server Configuration
-------------------------

The Management Console only supports TSIG signed dynamic updates. Therefore, you will have to create a TSIG key on each of your master DNS servers. If a TSIG key already exists, the program will use the first key it finds in the server configuration files (usually in /var/named/conf/user_before)

To create a TSIG key to use with BIND:

1. Check if there is a key already created in /etc/rndc.key (or its equivalent). If there is, simply copy its contents into the file user_before. Then skip the rest of these instructions.

2. Create a new key using the command rndc-confgen, like this: rndc-confgen -a This will create a file named rndc.key, typically in either /etc or /etc/bind. The contents of the file will look something like this:

  .. code-block::
    :linenos:

    key rndc-key { algorithm hmac-md5; secret "Qqn05iUpjzmNoXxLJi5vXw=="; };

3. (Re)start named (or signal it with either kill –HUP <pid> or rndc reconfig) in order to have it reload its configuration files.

4. Restart mmremoted:

  .. code-block:: bash

  /etc/init.d/mmremote stop /etc/init.d/mmremote start

When you have configured the server, you can change the zone type from static to dynamic by opening the zone options in the Management Console and changing the zone type to dynamic.

As dynamic zones are transferred from the DNS server using a zone transfer, you should make sure that zone transfers are allowed to localhost.

Windows DNS Server Configuration
--------------------------------

* The Men and Mice Management Console can work with dynamic zones on the Windows DNS server, both AD integrated zones and file-based zones.

* A new column, Record timestamp, is shown for dynamic zones that are hosted on Windows DNS servers. The Record timestamp column will show the creation time for records that are added dynamically (dynamic records).
Static records will not have a record timestamp.

* Dynamic zones are transferred from the DNS server using a zone transfer. If you restrict zone transfers from your DNS server, you should make sure that zone transfers are allowed to the IP Address of the DNS server itself.

* It is not possible to disable dynamic zones that are hosted on the Windows DNS server. This is the only limitation.
