.. meta::
   :description: Configuring DNS resolvers on appliances in Micetro
   :keywords: appliances, DNS resolvers, DNS/DHCP appliance, MDDS appliances

.. _configure-dns-resolvers:

Configuring DNS Resolvers
=========================
To ensure optimal performance of your appliance, you can add the IP addresses of DNS resolver servers. This can help your appliance efficiently resolve domain names and provide accurate network services.

**To set DNS resolvers**:

1. On the :guilabel:`Service Management` tab of the **Admin** page, locate the specific appliance for which you want to configure DNS resolvers. Make sure you select the correct appliance to avoid any disruptions in network services.
2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Configure DNS resolvers`.
3. In the **Configure DNS resolvers** dialog, enter the IP addresses of the DNS resolver servers you want to set.

    .. important::
       Make sure the the IP addresses are correct, as incorrect entries can lead to DNS resolution issues. You can set multiple DNS resolvers by listing their IP addresses on separate lines. This redundancy ensures uninterrupted DNS resolution even if one resolver becomes unavailable.

4. Select :guilabel:`Save`.
