.. meta::
   :description: How Micetro counts the IP Addresses.Calculating IP Usage + Cleanup Tips
   :keywords: IPAM, IP address, Micetro, IP usage

.. _ip-count:

License Management - Calculating IP Usage
-----------------------------------------

Connecting to Services
^^^^^^^^^^^^^^^^^^^^^^

As the administrators connect to the services and enable discovery, the tool reads the data coming in and begins calculating usage. It will then do a comparison with the keys provided at time of purchase and display the number of IPs in use to the number that is encoded in the keys. At times, the customer is not 100% sure of their IP count, so the number is negotiated (best effort) with the Sales team.  

.. note::
  M&M does not lock the tool in any way if the license count is exceeded. Sustaining services is our top priority.

.. image:: ../../images/license-management-ip-usage.png
   :width: 65%

How Micetro Calculates IPs
^^^^^^^^^^^^^^^^^^^^^^^^^^
  
In the **System Settings**, there is a section called **Determine address usage**. 
An IP is counted as “in use” by Micetro when:

1.	There is a DNS record assigned to the IP address (data from the DNS server).

2.	There is an active lease in a DHCP pool (this will cause usage to fluctuate in the license count).

3.	There is a DHCP reservation configured on the IP.

4.	If the IP address has a custom property configured and it is populated.

5.	The IP address has been explicitly claimed (using the “Claim IP” feature).

6.	Discovery is enabled and there is an active client on the IP (configurable by # of days).

.. note::
   Micetro will only count dual-stacked clients as one IP (IPV4/IPV6).

.. image:: ../../images/system-settings-address-usage.png
   :width: 65%

By deault, the address usage settings are all selected upon installation.

Micetro allows Administrators to toggle the license count configuration on and off to get a more granular picture of where the usage is coming from, which will then allow them to focus on clean-up.

Common Reasons for Excessive IP Usage:

*	Stale DNS records (static or missed by AD scavenging)
*	Old automation tools that were using the Custom Properties on the IPs, but were not cleaned up
*	Old claims that were not cleaned up
*	DHCP reservations that are not in use
*	DHCP lease times need to be adjusted


