.. meta::
   :description: Configuring Azure DNS and integrating Azure with Micetro
   :keywords: Azure DNS, DNS Management, Micetro by Men&Mice

.. _configure-azure-dns:

Configure Azure DNS
===================

Azure is seamlessly integrated into Micetro through Cloud Integration. For information about how to add Azure service to Micetro, see :ref:`cloud-integration`.

.. note::
   At present, configuring a proxy for connections to Azure services is not supported. 

Prerequisites
-------------

Before proceeding, ensure the following prerequisites are met:

* Central and the DNS Controller must be on the same machine and capable of connecting to Azure services through the following URLs:

  * https://management.azure.com
  * https://login.microsoftonline.com
  * https://management.core.windows.net

* You need an Azure service principal with appropriate permissions to access Azure resources managed through Micetro. Add the following built-in Azure roles to the subscription or specific resource groups you intend to manage:

  * DNS Zone Contributor

  * Network Contributor

Getting the Service Principal Details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Retrieve the necessary details for the Azure service principal, including Tenant ID, Subscription ID, Client ID (Application ID), and Client Secret (Authentication Key). Detailed instructions can be found here: https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal

Minimum Permissions for Micetro Integration with Azure
------------------------------------------------------
To fully integrate Micetro with Azure, the following custom role definition is required. This role covers all necessary permissions for DNS and IPAM. Please refer to Azure documentation for instructions on creating a custom role.

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
