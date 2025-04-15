.. meta::
   :description: Setting services for appliances in Micetro
   :keywords: appliances, DNS/DHCP appliance, MDDS appliances, set services, enable services, disable services

.. _set-appliance-services:

Setting Appliance Services
==========================
You can enable or disable various appliance services, such as the DNS service and DHCP service, to configure your appliance. 

**To enable/disable appliance services**:

1. On the :guilabel:`Service Management` tab of the **Admin** page, select :guilabel:`Appliances` on the left sidebar.

   .. image:: ../../images/sidebar-appliances.png
      :width: 25%

2. Select the specific appliance for which you want to set services.
3. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Set appliance services`.
4. In the dialog, enable or disable the services by checking or unchecking the checkboxes:

   * **DNS service**: Enable this service to allow your appliance to participate in domain name resolution on the network. Enabled by default.
   * **DHCP service**: Enable this service to allow your appliance to manage dynamic IP address allocation on the network. Enabled by default.
   * **SSH service (Secure Shell)**: Enable this service if secure remote access is needed, e.g., for troubleshooting. Disabled by default.
   * **Firewall service**: Enable this service as a crucial security measure to protect your appliance against potential attacks. It's strongly recommended to keep the firewall enabled at all times to safeguard your server from threats.

   .. warning::
      Disabling the firewall is **NOT** recommended. Disabling the firewall temporarily should only be done in situations in which you have a deep understanding of the potential risks and have specific security measures in place to compensate for the loss of protection. Even in such cases, minimize the duration fo firewall disablement and reenable it as soon as possible.

4. Select :guilabel:`Save`.
