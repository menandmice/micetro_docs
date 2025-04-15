.. meta::
   :description: Configuring NTP on appliances in Micetro
   :keywords: appliances, DNS/DHCP appliance, MDDS appliances, Network Time Protocol, NTP

.. _ntp-appliances:

Configuring NTP on Appliances
=============================
Through Micetro, you can configure the  Network Time Protocol (NTP) service on appliances to maintain precise time synchronization across your network infrastructure. Accurate timekeeping ensures proper coordination of network events, security protocols, and compliance with reporting requirements.

**To configure NTP**:

1. In the data grid, locate the specific appliance for which you wish to configure NTP. 
2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Configure NTP`. 
3. Select the :guilabel:`Enable NTP service` checkbox to activate the NTP service on your appliance.
4. In the text box, enter the hostnames or IP addresses of the NTP servers from which you want to synchronize your appliance's clock. 

   .. tip::
      Consider using multiple NTP servers for redundancy and increased reliability, ensuring continued time synchronization even if one server becomes inaccessible. 

5. Select :guilabel:`Save`.
