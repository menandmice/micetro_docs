.. meta::
   :description: Resolving conflicts and synchroinizing configuration and changes to ISC Kea DHCP servers in Micetro
   :keywords: DHCP Kea, DHCP, conflicts, synchronization, Micetro

.. _kea-sync-conflicts:

Resolving Synchronization Conflicts
-----------------------------------
Micetro synchronizes all data between your Kea DHCP servers and its database regularly. The default synchronization interval is 15 minutes. To overwrite the default value, change the ``DHCPSyncInterval`` variable in Micetro Central's ``preferences.cfg`` file.

.. note::
  The ``DHCPSyncInterval`` values are set in seconds.

Synchronization occurs based on the configuration to update the database and the Web Application. To prevent overwriting external changes before synchronization is complete, Micetro checks for conflicts with the Kea server's in-memory configuration before writing changes to the server.

**Example**:

If a scope with subnet 1.3.3.0/29 is manually added to the Kea DHCP server's configuration file, and ``config-reload`` is successfully called, the Kea server will have parsed the change and added the scope to its in-memory data structure. Micetro may not have executed synchronization yet, and the externally added scope is not yet visible in Micetro.

If another user tries to add the same or otherwise conflicting scope through Micetro, they will receive a message stating "*A scope with address "1.3.3.0" already exists on the server*", because the configuration file is validated against the Kea DHCP server's in-memory config before each change is applied.
