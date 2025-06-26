.. meta::
   :description: Configuring cloud integration
   :keywords: network cloud, integration

.. _cloud:

Integrating cloud services
==========================
Micetro provides native integration with cloud-based DNS and DHCP services, managing IP address data for Azure and AWS, including virtual networks and subnets within cloud accounts.

Using a cloud DNS service in Micetro is similar to working with other DNS services. The process of adding DNS zones, DNS records, or modifying them is identical to that of other DNS servers in Micetro.  

.. note::
   Currently, cloud DNS services only support the creation of primary zones.

Supported cloud services
------------------------

.. important::
  To use cloud services, the DNS and DHCP agents must be installed on the same machine as Micetro Central. For information about how to install DNS agents, refer to :ref:`dns-agent-windows` or :ref:`dns-agent-linux`.

.. csv-table::
  :header: "Cloud service", "DNS", "IPAM"
  :widths: 10, 30, 30

  "Akamai",	"Yes (Akamai Edge DNS)", "N/A"
  "Azure", "Yes (Azure DNS)", "Yes"
  "Amazon Web Services (AWS)", "Yes (Amazon Route 53)", "Yes"
  "NS1", "Yes", "N/A"
  "Meraki", "N/A", "Yes"


Adding cloud services
---------------------

.. important::
    Before integrating cloud services, Micetro requires several prerequisites. Refer to :ref:`cloud-prereqs-windows` or :ref:`cloud-prereqs-linux` to make sure that these prerequisites are met.

You must have permission to administer DNS or DHCP to add a new service to Micetro.

**To add a cloud service**:

1.	On the **Admin** page, select the :guilabel:`Service Management` tab.
2.	Select :guilabel:`Add Service` in the task bar.
3.	Select the cloud provider you want to use, enter the required information, and select :guilabel:`Add`.

   .. image:: ../../images/add-servive-dialog.png
     :width: 50%

Refer to the tabs below for details on each specific cloud provider.

.. tabs::

   .. tab:: Akamai Edge DNS

      Enter the information required to connect to Akamai Edge DNS:

         .. image::  ../../images/add-edge-dns.png
            :width: 70%
      
      **Obtaining Access Credentials**: For information about how to create API Access Credentials for Micetro, refer to `Create EdgeGrid authentication credentials <https://developer.akamai.com/introduction/Prov_Creds.html>`_.

      .. warning:: 
         Akamai OPEN APIs are time-sensitive! It is crucial to synchronize the system your client operates on with a Stratum 2 or higher time source.

      .. danger::
         If the time on the server running the DNS Agent differs significantly from Coordinated Universal Time (UTC), authentication will fail, preventing access/updating of zones through Micetro.

   .. tab:: AWS

      Enter the information required to connect to Amazon Web Services (AWS):

         .. image:: ../../images/add-aws.png
            :width: 70%
      
      **Obtaining Access Credentials**: For information about how to create API Access Credentials for use by Micetro, refer to `AWS security credentials <https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html>`_.

      For information about how to add multiple AWS cloud accounts using single credentials, refer to :ref:`aws-multi-account`.
       
      For information about the minimum permissions required for adding AWS accounts, refer to :ref:`cloud-minimum-permissions`.
   
   .. tab:: Azure DNS

      Enter the information required to connect to Azure:

         .. image:: ../../images/add-azure-dns.png
            :width: 70%
      
      For information about how to configure Azure DNS, refer to :ref:`configure-azure-dns`.
   
   .. tab:: Cisco Meraki

      To manage Meraki with Micetro, you must have an operational instance of the Micetro DHCP Agent. For additional details about the DHCP Agent, refer to :ref:`dhcp_agents_windows` or :ref:`dhcp_agents_linux`.

      When connecting to Meraki, specify the location of the running DHCP Agent. You must also provide Micetro with a display name for the service and the API key to connect to Meraki.

      Additionally, in the **Ignore list** field, enter the Meraki Organization or Network IDs that Micetro should exclude from synchronization. List one ID per line.

         .. image:: ../../images/add-service-meraki.png
            :width: 100%
        
      **Obtaining Access Credentials**: For information about how to create API Access Credentials for use by Micetro, refer to  `Cisco Meraki Dashboard API <https://documentation.meraki.com/General_Administration/Other_Topics/Cisco_Meraki_Dashboard_API>`_.

      Synchronization parameters, e.g., network client synchronization interval, can be configured under :ref:`Advanced System Settings <admin-advanced>`.

   .. tab:: NS1

      Enter the information required to connect to NS1:

         .. image:: ../../images/add-ns1.png
            :width: 70%
      
      **Obtaining Access Credentials**: For information about how to create API Access Credentials for use by Micetro, refer to  `IBM NS1 Connect <https://ns1.com/knowledgebase/creating-and-managing-api-keys>`_.

4. The service and any subnets defined will be displayed under DNS Services or DHCP Services and IP Ranges, respectively.

Editing cloud services
----------------------

**To edit the properties of a cloud service**:

1.	On the **Service Management** tab, locate the service you want to edit.
2.	Double-click the service or select it, and then use the :guilabel:`Action` menu to select :guilabel:`Edit service properties`.
3.	Make the necessary changes and select :guilabel:`Save`.

Removing cloud services
-----------------------
.. warning::
  By removing a cloud service, the associated DNS service and the corresponding zones will be removed. Additionally, any subnets and cloud networks will also be removed.

**To remove a cloud service**:

1.	On the **Service Management** tab, select the service you want to remove.
2.	On the :guilabel:`Action` menu, select :guilabel:`Remove DNS service`.


Removing cloud networks
-----------------------

**To remove a cloud network**:

1. On the **IPAM** page, select the specific cloud network.
2. On the :guilabel:`Action` menu, select :guilabel:`Delete network`.

|
**Related topics**:

* :ref:`aws-multi-account`

* :ref:`cloud-minimum-permissions`

* :ref:`configure-azure-dns`
