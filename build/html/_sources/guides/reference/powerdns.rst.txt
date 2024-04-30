.. meta::
   :description: The PowerDNS connector script connects directly to the MySQL backend and allows management of zones in PowerDNS. Native mode and Master/Slave mode in the authoritative PowerDNS are currently supported.
   :keywords: PowerDNS, DNS

.. _powerdns:

Configuring PowerDNS
====================

The PowerDNS connector script connects directly to the MySQL backend and allows management of zones in PowerDNS. Native mode and Master/Slave mode in the authoritative PowerDNS are currently supported.

The installation works as described above. On Linux use the ``--generic-dns-controller`` parameter when executing the installer.

It will then install the base Generic DNS Server Controller, but there are two things you want to tweak:

1. Create working directory and connector script config:

.. code-block:: bash

  mkdir /var/mmsuite/dns_server_controller

and set the correct ownership.

2. Create a file ``preferences.cfg`` in the ``mmsuite`` directory and configure the connector script with a XML-tag as described in Generic DNS Server Controller.

E.g. on Linux:

.. code-block::

  <GenericDNSScript value="python /your/script/directory/genericDNSPowerDNS.py" />

Download the script `from GitHub <https://github.com/menandmice/micetro_docs/blob/latest/scripts/genericDNSPowerDNS.py>`_.

4. Edit the ``systemd/init`` script of the controller. Open with an editor, e.g. vi the ``mmremote`` init script, which should be ``/etc/init.d/mmremote``.

5. Search for the line ``PARAMS="...."``.

6. Add to the begin of the parameter list your created controller working directory with the ``-d`` parameter, .i.e.:

.. code-block::

  PARAMS="-d /var/mmsuite/dns_server_controller  ...rest of the params"
