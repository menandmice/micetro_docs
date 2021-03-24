.. _configure-azure-dns:

Configure Azure DNS
===================

Azure is natively supported through Cloud Integration. An Azure subscription may be added with the *Configure Cloud Service Account Wizard* (see :ref:`configuring-cloud`) in the Management Console.

Prerequisites
-------------

* Central and the DNS Controller on the same machine must be able to connect to Azure services. Specifically, the following URLs:

  * https://management.azure.com
  * https://login.microsoftonline.com
  * https://management.core.windows.net

* An Azure service principal that can access Azure resources that should be managed through Micetro. Add the following built-in Azure roles on the subscription or specific resource groups you want to manage:

  * DNS Zone Contributor

  * Network Contributor

Getting the service principal details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Detailed instructions on how to create a service principal and retrieve the Tenant ID, Subscription ID, Client ID (also known as Application ID), and the Client Secret (also known as authentication key), can be found here: https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal

Frequently asked questions (FAQ)
--------------------------------

**Can I configure a proxy for the connection to Azure services?**

This feature is currently not available.

**What are the minimum permissions required for Micetro to integrate fully with Azure?**

Below is a custom role definition that covers all the required permissions for DNS and IPAM. Please look at Azure documentation on how to create a custom role.

.. code-block::
  :linenos:

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
