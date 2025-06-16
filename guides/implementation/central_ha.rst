.. meta::
   :description: Configuring High Availability for Micetro's server component
   :keywords: high availability, failover, Micetro

.. _central-ha:

Configuring High Availability for Micetro Central
=================================================

Failover instances of Micetro Central can be configured to build a High Availability (HA) cluster. For information about fine-tuning the settings for the Central High Availability cluster, refer to :ref:`ha-tweaks-central`.

.. note::
  * To run Micetro in High Availability mode, you must be using the MS SQL or PostgreSQL database backend for Micetro. High Availability mode is not available for other database types.
  
  * All participating Micetro Central HA servers should have NTP configured. Clocks that are out-of-sync can cause unwanted failovers.

When there are no HA members defined or if Micetro Central has not been configured for HA, a message will appear, indicating further configuration is necessary. This documentation provides instructions on how to configure HA in Micetro for versions 10.2 and above. If you need to use the management console (thick client), please refer to the `documentation for version 10.1 <https://docs.menandmice.com/en/10.1/guides/implementation/central_ha/>`_.


.. tabs::

   .. tab:: Windows

    1. On the existing (or designated as *primary*) server running Micetro Central, edit the Micetro Central preferences file ``C:\ProgramData\Men and Mice\Central\preferences.cfg`` by adding the following XML-tag to the file:

      .. code-block::

        <ClusterMemberName value="somename" />

      ``somename`` is the unique name that will identify the Micetro Central instance in the High Availability cluster, e.g., "1", “primary”, or "central1". Here's an example:

      .. code-block::
        
        <ClusterMemberName value="primary" />

    2. Restart the primary Central application from the command line:

      * Open the **Services** window, e.g., by selecting **Win + R**, entering **services.msc**, and selecting **OK**.
      * Locate the **Men and Mice Central service**, right-click on it, and select **Start** or **Restart**.

    3. Log into the Micetro Web Application as "administrator" and go to :menuselection:`Admin --> Configuration`.

    4. Select :guilabel:`High Availability`.

    5. Enter the name of the first member server to match the name previously given and set the priority to **10**. The name must match the name in the XML-tag ``ClustMemberName``, e.g., as in the example above as **primary**.

    6. Select :guilabel:`Add Member`.

       .. image:: ../../images/ha-add-member.jpg
        :width: 100%
  
    7. Restart Micetro Central from the command line or through the ``services.msc``:

      * Open the **Services** window, e.g., by selecting **Win + R**, entering **services.msc**, and selecting **OK**.
      * Locate the **Men and Mice Central service**, right-click on it, and select **Start** or **Restart**.

    8. Log into the Web Application and navigate to :menuselection:`Admin --> Configuration --> High Availability` to verify that the current server is running with state **Active**.

       .. image:: ../../images/ha-cluster.png
        :width: 100%

    9. Repeat steps 3--6 to add another member to the HA configuration, but now use a priority of **20** or higher, e.g., add a secondary server with the name "secondary" and a priority of **20**.

       This adds the secondary server to the database. The configuration of the secondary Micetro Central server itself is done in the next steps.

    10. On the newly added secondary server, install Micetro Central. If it's already installed, make sure it's stopped:

      * Open the **Services** window by selecting **Win + R**, entering **services.msc**, and selecting **OK**.
      * Locate the **Men and Mice Central service**, right-click on it, and select **Stop** to make sure it's not running.

    11. Copy the ``C:\ProgramData\Men and Mice\Central\preferences.cfg`` file from the first server (the **Active** one) to the new secondary server to replace the secondary server's existing ``preferences.cfg`` file.

        * Change the XML-tag ``ClusterMemberName`` value to the name of the secondary that was set up in Step 9 and save the changed file.

      .. note::
        The only difference between the primary (Active) and secondary server's ``preferences.cfg`` files should be the value of ``ClusterMemberName``, e.g., *secondary* instead of *primary*.

    12. Start Micetro Central on the secondary server:

      * Open the **Services** window by selecting **Win + R**, entering **services.msc**, and selecting **OK**.
      * Locate **Men and Mice Central service**, right-click on it, and select **Start** to make sure it's running.

    13. In the Web Application, navigate to :menuselection:`Admin --> Configuration --> High Availability` and verify that you now have two servers: one **Active** and one in a **Standby** state.

    14. Create a round robin DNS name for the High Availability setup. This involves creating two A records with the same name, each with the IP address of the primary and secondary server. For example:

      .. code-block::
        
        micetrocentral.example.com A 192.168.2.53
        micetrocentral.example.com A 192.168.2.54
  
      in which ``192.168.2.53`` is the primary and ``192.168.2.54`` is the secondary. 

      * Check whether the round robin name can be resolved, e.g., with ``Resolve-DNSName`` or ``nslookup`` on the Micetro Central servers.

    15. Edit your Web Application ``C:\ProgramData\Men and Mice\Web Services\preferences.cfg`` file and add the following XML-tag:

      .. code-block::
        
        <DefaultCentralServer value="your round robin record" />

      For example:

      .. code-block::

        <DefaultCentralServer value="micetrocentral.example.com" />

    16. Restart the **Men and Mice Web Services** service through the **services.msc**.

    .. note::
      Repeat these steps for each High Availability failover relationship you'd like to add. The priority for each failover member should be unique and higher than the primary.

    Proceed to :ref:`dns-agent-windows`.

   .. tab:: Linux
    
    1. On the existing (or designated as *primary*) server running Micetro Central, edit the Micetro Central preferences file in ``/var/mmsuite/mmcentral/preferences.cfg`` by adding the following XML-tag to the file:

      .. code-block::
        
        <ClusterMemberName value="somename" />

      ``somename`` is the unique name that will identify the Micetro Central instance in the High Availability cluster, e.g., "1", “primary”, or "central1". Here's an example:

      .. code-block::
        
        <ClusterMemberName value="primary" />

    2. Restart the primary Micetro Central application:

      .. code-block:: bash
        
        systemctl restart mmcentral

    3. Log into the Micetro Application as "administrator" and go to :menuselection:`Admin --> Configuration`.

    4. Select :guilabel:`High Availability`.

    5. Enter the name of the first member server to match the previously given name given and set the priority to **10**.

    6. Select :guilabel:`Add Member`.

      .. image:: ../../images/ha-add-member.jpg
        :width: 100%

    7. Restart Micetro Central:

      .. code-block:: bash
        
        systemctl restart mmcentral

    8. Log into the Micetro Web Application and navigate to :menuselection:`Admin --> Configuration --> High Availability` to verify that the current server is running with state **Active**.

      .. image:: ../../images/ha-cluster.png
        :width: 100%

    9. Repeat steps 3--6 to add another member to the HA configuration, but now use a priority of **20** or higher, e.g., add a secondary server with the name "secondary" and a priority of **20**.

    10. On the newly added secondary server, install Micetro Central. If it's already installed, make sure the ``mmcentral.service`` is stopped:
    
      .. code-block:: bash
        
        systemctl stop mmcentral
        systemctl status mmcentral

    11. Copy the ``/var/mmsuite/mmcentral/preferences.cfg`` file from the first server (the **Active** one) to the new secondary server to replace the secondary server's existing ``preferences.cfg`` file.

      * Change the XML-tag ``ClusterMemberName`` value to the name of the secondary server that was set up in Step 9 and save the changed file.

      .. note::
        The only difference between the primary (Active) and secondary server's ``preferences.cfg`` files should be the value of ``ClusterMemberName``, e.g., *secondary* instead of *primary*.

    12. Start Micetro Central on the secondary server:
    
      .. code-block:: bash
        
        systemctl start mmcentral

    13. In the Web Application, navigate to :menuselection:`Admin --> Configuration --> High Availability` and verify that you now have two servers: one **Active** and one in **Standby** state.

    14. Create a round robin DNS name for the High Availability setup. This involves creating two A records with the same name, each with the IP address of the primary and secondary server. For example:

      .. code-block::
        
        micetrocentral.example.com A 192.168.2.53
        micetrocentral.example.com A 192.168.2.54

      in which ``192.168.2.53`` is the primary and ``192.168.2.54`` is the secondary. 

      * Check whether the round robin name can be resolved, e.g., with ``dig`` on the two Micetro Central servers.

    15. Edit your Web Application ``/var/mmsuite/mmcentral/preferences.cfg`` file and add the following XML-tag:

      .. code-block::
        
        <DefaultCentralServer value="your round robin record" />
  
      For example:

      .. code-block::

        <DefaultCentralServer value="micetrocentral.example.com" />

    16. Restart the **Men and Mice Web Services** service:

      .. code-block::

        systemctl start mmws

    .. note::
      Repeat these steps for each High Availability failover you'd like to add. The priority for each failover member should be unique and higher than the primary.

    Proceed to :ref:`dns-agent-linux`.


Editing HA member options
-------------------------

1. Log into the Micetro Web Application and go to :menuselection:`Admin --> Configuration`.

2. Select :guilabel:`High Availability`.

3. Hover over the server member and use the Row :guilabel:`...` menu to select one of the following options:

  * **Edit member**: Change the name or priority of the server member in the HA cluster.
   
  * **Set active**: Manually set the server to be the Active member of the HA cluster.
   
  * **Remove member**: Remove the server member from the HA cluster.

Proceed to :ref:`dns-agent-windows` or :ref:`dns-agent-linux`.
