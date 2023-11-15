.. meta::
   :description: Micetro native integration with cloud-based DNS services, IP address-related data management for Azure and AWS
   :keywords: Micetro by Men&Mice, multicloud, multicloud integration

.. _cloud-integration:

Configuring Cloud Integrations
==============================
Micetro communicates with the cloud services through Men&Mice Central (IPAM) and the Men&Mice DNS controller (DNS).

Before continuing, make sure that:

   * The DNS controller is installed and set up on the machine running Men&Mice Central. For information about how to install DNS controllers, see :ref:`install-controllers`.

   * The machine running Central can connect to the specific cloud instance on port 443/TCP. For specific networking requirements, see :ref:`firewall-ports`.

If you intend to add multiple AWS cloud accounts using a single set of credentials, see:ref:`aws-multi-account`.

Adding Cloud Services
----------------------

You must have permission to administer DNS to add a new service to Micetro.

**To start using a cloud service in Micetro**:

1.	On the **Admin** page, select :guilabel:`Service Management` in the upper-left corner.
2.	Select :guilabel:`Add Service`.
3.	Select the cloud provider you want to use, fill in the required information, and select :guilabel:`Add`.

   .. image:: ../../images/add-servive-dialog.png
     :width: 50%

4. The DNS service and any subnets defined will be displayed under DNS Services and IP Ranges, respectively.

Akamai Fast DNS
^^^^^^^^^^^^^^^

Fill in the fields required to connect to Akamai Fast DNS:

.. image:: ../../images/add-edge-dns.png
   :width: 50%

•	**Obtaining Access Credentials**: For information about how to create API Access Credentials for Micetro, see https://developer.akamai.com/introduction/Prov_Creds.html

.. warning:: 
  Akamai OPEN APIs are time sensitive! Ensure that the system your client runs on is synchronized to a Stratum 2 or better time source.

.. danger::
  If the time on the server running the DNS Remote differs significantly from Coordinated Universal Time, authentication will fail preventing access/updating of zones through Micetro.

.. _connect-azure:

Azure DNS
^^^^^^^^^
To successfully configure Central and the DNS Controller with Azure services, ensure the following requirements are met:

1.	**Connectivity to Azure Services**: Ensure that the machine hosting Central and the DNS Controller can establish connections to the following Azure service endpoints:

   *	https://management.azure.com
   *	https://login.microsoftonline.
   *	https://management.core.windows.net

2.	**Azure Service Principal**: Create an Azure service principal with the necessary permissions to manage Azure resources through Micetro. Grant the following built-in Azure roles at either the subscription level or specific resource groups that you intend to manage:

   *	DNS Zone Contributor
   *	Network Contributor

3.	**Service Principal Details**: You will need specific information about the Azure service principal, which includes the following:
   
   *	Tenant ID: This identifies the Azure AD tenant.
   *	Subscription ID: The unique identifier for your Azure subscription.
   *	Client ID (Application ID): The identifier for your service principal.
   *	Client Secret (Authentication Key): A secure key for authentication.

   Detailed instructions on how to create a service principal and retrieve these details can be found in the Azure documentation.


Fill in the  fields required to connect to Azure:

.. image:: ../../images/add-azure-dns.png
   :width: 50%

Frequently Asked Questions
""""""""""""""""""""""""""
*	Can I configure a proxy for the connection to Azure services?

   This feature is currently not available.

*	What are the minimum permissions required for Micetro to integrate fully with Azure?

   Below is a custom role definition that covers all the required permissions for DNS and IPAM. Please look at Azure documentation on how to create a custom role.

.. code-block::

  {
  "Name": "Men&Mice Operator",
  "IsCustom": true,
  "Description": "Can manage DNS and IPAM related resources.",
  "Actions": [
    "Microsoft.Network/dnsZones/*",
    "Microsoft.Network/virtualNetworks/read",
    "Microsoft.Network/virtualNetworks/write",
    "Microsoft.Network/virtualNetworks/delete",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Network/virtualNetworks/subnets/write",
    "Microsoft.Network/virtualNetworks/subnets/delete",
    "Microsoft.Compute/virtualMachines/read",
    "Microsoft.Compute/virtualMachines/instanceView/read",
    "Microsoft.Network/networkInterfaces/ipConfigurations/read",
    "Microsoft.Resources/subscriptions/resourceGroups/read"
    ],
  "AssignableScopes": [
    "/subscriptions/<your subscription id or specify a more granular scope>"
    ]
  }


.. _connect-aws:

Amazon Web Services
^^^^^^^^^^^^^^^^^^^

Fill in the fields required to connect to AWS:

.. image:: ../../images/add-aws.png
   :width: 50%

* 	**Obtaining Access Credentials**: For information about how to create API Access Credentials for use by Micetro, see: https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html

* For information about how to add multiple AWS cloud accounts using single credentials, see: :ref:`aws-multi-account`.
* For information about the minimum permissions required for adding AWS accounts, see :ref:`aws-minimum-permissions`.

.. _connect-openstack:

Openstack
^^^^^^^^^

Fill in the fields required to connect to OpenStack:

+-----------------+-----------------------------------------------------------+
| Name            | The name of the cloud service in Micetro                  |
+-----------------+-----------------------------------------------------------+
| Server Node     |                                                           |
+-----------------+                                                           |
| User Name       | The credentials needed for Micetro to connect to          |
+-----------------+ the cloud instance                                        |
| Password        |                                                           |
+-----------------+                                                           |
| Require HTTPS   |                                                           |
+-----------------+-----------------------------------------------------------+

.. _connect-ns1:

NS1
^^^

Fill in the fields required to connect to NS1:

.. image:: ../../images/add-ns1.png
   :width: 50%

*	**Obtaining Access Credentials**: For information about how to create API Access Credentials for use by Micetro, see https://ns1.com/knowledgebase/creating-and-managing-api-keys.

.. _connect-dyn:

Dyn DNS
^^^^^^^

Fill in the fields required to connect to Dyn:

.. image:: ../../images/add-dyn-dns.png
   :width: 50%


Editing Cloud Services
-----------------------

**To edit the properties of a cloud service**:

1.	In the **Service Management** area, locate the service you want to edit.
2.	Double-click the service or select it, and then select :guilabel:`Edit service` on the :guilabel:`Action` menu.
3.	Make the necessary changes and select :guilabel:`Confirm`.

Removing Cloud Services
------------------------

**To remove a cloud service**:

1.	In the **Service Management** area, select the service you want to remove.
2.	On the :guilabel:`Action` menu, select :guilabel:`Remove DNS service`.

.. warning::
  By removing the cloud service, the associated DNS service and the corresponding zones will be removed. Additionally, any subnets and cloud networks will also be removed.

Removing Cloud Networks
------------------------

**To remove a cloud network**:

1. On the **IPAM** page, select the specific cloud network.
2. On the :guilabel:`Action` menu, select :guilabel:`Delete network`.
