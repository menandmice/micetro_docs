.. meta::
   :description: Configuring cloud integration
   :keywords: network cloud, integration

.. _cloud:

Cloud Integration
*****************
Micetro provides native integration with cloud-based DNS services and can manage IP address-related data for Azure and AWS, including virtual networks and subnets that exist in cloud accounts.

Using a cloud DNS service in Micetro is similar to the process of working with other DNS services. The process of adding DNS zones, DNS records, or modifying them is identical to that of other DNS servers in Micetro.  It's worth noting that, at present, cloud DNS services only support the creation of primary zones.

Supported Cloud Services
------------------------

.. important::
  To use cloud services, the DNS agent must be installed on the same machine as Micetro Central. For information about how to install DNS agents, see :ref:`install-dns-controllers`.

.. csv-table::
  :header: "Cloud service", "DNS", "IPAM"
  :widths: 10, 30, 30

  "Akamai",	"Yes (Akamai Fast DNS)", "N/A"
  "Azure", "Yes (Azure DNS)", "Yes"
  "Amazon Web Services (AWS)", "Yes (Amazon Route 53)", "Yes"
  "NS1", "Yes", "N/A"
  "Meraki", "N/A", "Yes"


Setting Up Cloud Integrations
-----------------------------

Prerequisites
^^^^^^^^^^^^^^^
For IP Address Management (IPAM), Micetro connects with the cloud service through Micetro Central, and for DNS management, the Micetro DNS agent is required. Before proceeding with any actions related to Micetro and its interaction with cloud services, two essential requirements must be met:

1. **DNS Agent Installation and Setup**:

   * Ensure that the DNS agent is installed on the machine where Micetro Central is running.
   * For instructions on installing DNS agents, see :ref:`install-controllers`.

2. **Network Connectivity**:

   * Verify that the machine running Micetro Central can establish a connection to the specific cloud instance.
   * The connection should be established on port 443/TCP. This is a specific network port used for secure communication.
   * For detailed networking requirements, see :ref:`firewall-ports`.


If you intend to add multiple AWS cloud accounts using a single set of credentials, see :ref:`aws-multi-account`.

Adding Cloud Services
^^^^^^^^^^^^^^^^^^^^^^

You must have permission to administer DNS to add a new service to Micetro.

**To add a cloud service**:

1.	On the **Admin** page, select :guilabel:`Service Management` in the upper-left corner.
2.	Select :guilabel:`Add Service`.
3.	Select the cloud provider you want to use, fill in the required information, and select :guilabel:`Add`.

   .. image:: ../../images/add-servive-dialog.png
     :width: 50%

4. The DNS service and any subnets defined will be displayed under DNS Services and IP Ranges, respectively.

Akamai Fast DNS
""""""""""""""""

Fill in the fields required to connect to Akamai Fast DNS:

.. image:: ../../images/add-edge-dns.png
   :width: 50%

* **Obtaining Access Credentials**: For information about how to create API Access Credentials for Micetro, see https://developer.akamai.com/introduction/Prov_Creds.html

.. warning:: 
  Akamai OPEN APIs are time sensitive! Ensure that the system your client runs on is synchronized to a Stratum 2 or better time source.

.. danger::
  If the time on the server running the DNS Remote differs significantly from Coordinated Universal Time, authentication will fail preventing access/updating of zones through Micetro.

.. _connect-azure:

Azure DNS
""""""""""
Fill in the  fields required to connect to Azure:

.. image:: ../../images/add-azure-dns.png
   :width: 50%

* For information about how to configure Azure DNS, see :ref:`configure-azure-dns`.

.. _connect-aws:

Amazon Web Services
"""""""""""""""""""
Fill in the fields required to connect to AWS:

.. image:: ../../images/add-aws.png
   :width: 50%

* **Obtaining Access Credentials**: For information about how to create API Access Credentials for use by Micetro, see: https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html

* For information about how to add multiple AWS cloud accounts using single credentials, see: :ref:`aws-multi-account`.
* For information about the minimum permissions required for adding AWS accounts, see :ref:`cloud-minimum-permissions`.


.. _connect-ns1:

NS1
"""

Fill in the fields required to connect to NS1:

.. image:: ../../images/add-ns1.png
   :width: 50%

*	**Obtaining Access Credentials**: For information about how to create API Access Credentials for use by Micetro, see https://ns1.com/knowledgebase/creating-and-managing-api-keys.

.. _connect-meraki:

Cisco Meraki
""""""""""""
A prerequisite for managing Meraki with Micetro is that the user needs to have a running instance of the Micetro DHCP Agent somewhere. 
For more information about the DHCP Agent, see :ref:`install-dhcp-controllers`. The user that is adding Meraki must also be a DHCP administrator.

When connecting to Meraki, the user must first fill in where the DHCP agent that should be used is running. Then the user must give Micetro a display name for the Service along with the API key used to connect to Meraki. 

.. image:: ../../images/add-meraki.png
   :width: 50%

* **Obtaining Access Credentials**: For information about how to create API Access Credentials for use by Micetro, see https://documentation.meraki.com/General_Administration/Other_Topics/Cisco_Meraki_Dashboard_API.

Editing Cloud Services
-----------------------

**To edit the properties of a cloud service**:

1.	In the **Service Management** area, locate the service you want to edit.
2.	Double-click the service or select it, and then select :guilabel:`Edit service` on the :guilabel:`Action` menu.
3.	Make the necessary changes and select :guilabel:`Confirm`.

Removing Cloud Services
------------------------
.. warning::
  By removing the cloud service, the associated DNS service and the corresponding zones will be removed. Additionally, any subnets and cloud networks will also be removed.

**To remove a cloud service**:

1.	In the **Service Management** area, select the service you want to remove.
2.	On the :guilabel:`Action` menu, select :guilabel:`Remove DNS service`.


Removing Cloud Networks
------------------------

**To remove a cloud network**:

1. On the **IPAM** page, select the specific cloud network.
2. On the :guilabel:`Action` menu, select :guilabel:`Delete network`.
|

**Related topics**:

* :ref:`aws-multi-account`

* :ref:`cloud-minimum-permissions`

* :ref:`configure-azure-dns`

