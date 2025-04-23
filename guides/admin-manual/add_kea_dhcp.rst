.. meta::
   :description: Adding Kea DHCP servers and services to Micetro
   :keywords: DHCP, Kea DHCP, Kea hook library, Kea hooks, Micetro

.. _add-kea-hooks:

Adding Kea to Micetro
=====================
Because Micetro uses the Kea API to communicate with the DHCP server(s), it requires the Kea hook library ``libdhcp_lease_cmds.so`` in addition to the DHCP agent.

.. note::
  On certain distributions, such as RHEL, it's essential to verify the installation of the ``kea-hooks`` package.

Configuring the Kea Hook Library
--------------------------------
After installing the Kea hook library, open ``kea-dhcp4.conf`` and locate the ``hooks-libraries`` array. Add the hook to ``libdhcp_lease_cmds.so``:

.. code-block::

  "hooks-libraries":[
      {
        "library" : "/lib64/kea/hooks/libdhcp_lease_cmds.so",
        "parameters" : {}
      }
  ]

The location of the ``libdhcp_lease_cmds.so`` library may vary depending on your distribution. To locate it, you can use the command ``whereis libdhcp_lease_cmds.so``.

After adding the library, restart Kea and the Kea Control Agent.

Enabling Premium Hooks
----------------------
If you have access to Kea Premium Hooks from ISC, you can enable support for the ``subnet_cmds`` and ``class_cmds`` hooks. These two hooks allow for Create, Read, Update, and Delete (CRUD) functions via the API, facilitating management of scopes, pools, and client classes.

To enable these hooks, you must add a preference attribute to your DHCP agent's preference file:

1. Locate the ``preferences.cfg`` file, which contains your DHCP agent's preferences.
2. Add the following preference attribute to the file: ``<UseKeaPremiumHooks value="1" />```. 
3. If your Kea server operates in a failover relationship, ensure to enable the hooks on both the primary and secondary servers for synchronized functionality.

Remember to restart your Kea services after making changes to the configuration for them to take effect.
