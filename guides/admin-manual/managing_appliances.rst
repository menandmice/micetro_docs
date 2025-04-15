.. meta::
   :description: Adding, editing, removing, shutting down, or restarting appliances in Micetro
   :keywords: appliances, DNS/DHCP appliance, MDDS appliances


.. _managing-appliances:

Managing Appliances
===================
Once you have configured the initial network settings for an appliance and added it to your :ref:`Services <webapp-server-management>`, you can interact with the services just as you would with other DNS and DHCP services within Micetro. 

In Micetro, you can add, edit, and remove appliances as needed based on your server operations.

Adding a New Appliance to Micetro
---------------------------------
.. note::
   Before adding a MDDS appliance to Micetro, ensure that the appliance is configured in Micetro-mode and that interfaces are appropriately configured.

   * To configure the appliance to be in Micetro-mode, follow the instructions for `Configuring DNS/DHCP Servers for Micetro <https://docs.bluecatnetworks.com/r/Address-Manager-Administration-Guide/Configuring-DNS/DHCP-Servers-for-Micetro/9.6.0>`_.

   * To configure interfaces on the appliance, follow the instructions for `Setting an IPv4 address <https://docs.bluecatnetworks.com/r/Address-Manager-Administration-Guide/Setting-an-IPv4-address/9.6.0>`_ and `Setting an IPv6 address <https://docs.bluecatnetworks.com/r/Address-Manager-Administration-Guide/Setting-an-IPv6-address/9.6.0>`_.

To add an appliance to Micetro, you must be assigned the Administrator role.

**To add an appliance**:

1. On the :guilabel:`Service Management` tab of the :guilabel:`Admin` page, select :guilabel:`Add Service`.

2. In the **Add Service** wizard, select :guilabel:`Appliance`.

   .. image:: ../../images/add-service-appliance.png
      :width: 90%

3. On the :guilabel:`Properties` tab, enter the hostname for the appliance in the **Appliance name** field, which will also be used for the DNS and DHCP services hosted on the appliance.

   .. note::
      If the appliance uses a separate management interface, enter a hostname that resolves to the service interface (eth0) in the **Appliance name** field.

4. If the appliance uses a separate management interface, enter the IP address of the management interface (eth2) in the :guilabel:`Management interface address` field. If the appliance only has a single interface configured, you can leave this field empty.
5. Enable or disable appliance services on the :guilabel:`Enabled Services` tab. By default, **DNS** and **DHCP** services are activated.  If you require remote access to your appliance for specific purposes, you can enable the **SSH** (Secure Shell) client. You can change the enabled or disabled appliance services at any time. Refer to :ref:`set-appliance-services`.
6. Select :guilabel:`Add`.

The appliance is added to the **Appliances** data grid and its associated services are listed under **DNS Services** and **DHCP Services**.

Editing Appliance Properties
----------------------------
If you need to refer to an appliance by another name, the IP address by which you're connecting to and managing the appliance has changed, or any other reason, Micetro allows you to change the name or IP address used to connect to your appliance. 

**To edit the appliance name**:

1. On the :guilabel:`Service Management` tab of the **Admin** page, select :guilabel:`Appliances` in the left sidebar. 
2. In the data grid, select the specific appliance you want to edit.
3. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Edit service properties`.
4. Edit the appliance's name, and/or the management interface address (optional).

   .. Note::
       Changing the name or management interface address only affects how you connect to the appliance. It does not alter the actual IP address of the appliance itself.

5. Select :guilabel:`Save`.

Moving Appliances to a Different Address Space
-----------------------------------------------
DNS servers, DHCP servers, IP address ranges, and individual IP address entries can be moved between address spaces. When an object is moved between address spaces, all properties for the object are retained, including its access settings and change history. For more information about moving objects between address spaces, refer to :ref:`moving-objects-address-spaces`.

You must have the relevant administrator privileges to move objects to a different address space.

Shutting Down or Restarting Appliances
--------------------------------------
If, for any reason, you need to shut down and/or restart an appliance, Micetro allows you to do so through the Web Application.

.. note::
   For appliances equipped with an Integrated Dell Remote Access Controller (iDRAC), the iDRAC continues running when the appliance is shut down. This means that it can be accessed via the local network to power on the appliance without requiring physical access.
   
   If you shut down an appliance that is not equipped with iDRAC, it will be turned off and you will need physical access to the appliance to turn it on again.
   Consult the specifications for your appliance for more information on its remote access capabilities.

**To shut down or restart appliances**:

1. In the data grid, select the appliance you want to restart or shut down.
2. Use the :guilabel:`Action` menu to select :guilabel:`Shut down appliance` or :guilabel:`Restart appliance`.
3. In the confirmation dialog, select :guilabel:`Yes`.

Depending on your select, the appliance will either shut down or restart.

Removing Appliances
-------------------
You can remove one or more appliances from Micetro at any time, if needed. When you remove an appliance from Micetro, the DNS and DHCP services hosted on the appliance are **not** removed or shut down.

.. note::
   Only users assigned the Administrator role can remove appliances from Micetro.

**To remove an appliance from Micetro**:

1. Select the appliance(s) you want to remove. To select multiple appliances, press/hold **Ctrl** (**Cmd** on Mac) while selecting appliances.
2. On the :guilabel:`Action` menu, select :guilabel:`Remove appliance`.
3. In the confirmation dialog, select :guilabel:`Yes`.
