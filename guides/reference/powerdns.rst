.. meta::
   :description: The PowerDNS connector script connects directly to the MySQL backend and allows management of zones in PowerDNS. Native mode and Master/Slave mode in the authoritative PowerDNS are currently supported.
   :keywords: PowerDNS, DNS

.. _powerdns:

Configuring PowerDNS
====================

The PowerDNS connector script connects directly to the MySQL backend, enabling zone management in PowerDNS. Native mode and Primary/Secondary mode are supported in the authoritative PowerDNS.

On Linux, include the ``--generic-dns-controller`` parameter when running the installer.

This will install the :ref:`generic-dns-controller`, but you'll need to make a couple of adjustments:

1. Create a working directory and a configuration for the connector script:

  .. code-block:: bash

    mkdir /var/mmsuite/dns_server_controller

  Set the correct ownership for this directory.

2. In the ``mmsuite`` directory, create a ``preferences.cfg`` file and configure the connector script using an XML-tag as described in the instructions for :ref:`generic-dns-controller`.

 For example, on Linux add the following line to ``preferences.cfg``:
 
 .. code-block:: bash

  <GenericDNSScript value="python /your/script/directory/genericDNSPowerDNS.py" />


 Download the script `from GitHub <https://github.com/menandmice/micetro_docs/blob/latest/scripts/genericDNSPowerDNS.py>`_.

3. Modify the ``systemd/init`` script for the agent. Using an editor, such as vi, open the ``mmremote`` init script located at ``/etc/init.d/mmremote``.

4. Search for the line containing ``PARAMS="...."``.

5. At the beginning of the parameter list, add your created agent working directory with the ``-d`` parameter:

.. code-block::

  PARAMS="-d /var/mmsuite/dns_server_controller  ...rest of the params"
