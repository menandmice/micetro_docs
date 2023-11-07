.. meta::
   :description: How to set up and configure cloud integration in Micetro by Men&Mice
   :keywords: multicloud, AWS cloud integration, DNS controller

.. _configuring-cloud:

Configuring Cloud Integrations
===============================
Micetro communicates with the cloud services through Men&Mice Central (IPAM) and the Men&Mice DNS controller (DNS).

Before continuing, make sure that:

* the DNS controller is installed and set up on the machine running Men&Mice Central. For information about how to install DNS controllers, see :ref:`install-controllers`.

* the machine running Central can connect to the specific cloud instance on port 443/TCP. For specific networking requirements, see :ref:`firewall-ports`.

If you intend to add multiple AWS cloud accounts using a single set of credentials, see :ref:`aws-multi-account`.

Adding a Cloud Service
----------------------

You must have permission to administer DNS to add a new service to Micetro.

**To start using a cloud service in Micetro**:

1. On the **Admin** page, select :guilabel:`Service Management` in the upper-left corner.

2. Select :guilabel:`Add Service`.

3. Select the cloud provider you want to use and fill in the required information.

   .. image:: ../../images/add-servive-dialog.png
     :width: 50%
     

Proceed with one of the Cloud providers shown below and click :guilabel:`Next`:

* :ref:`connect-akamai`

* :ref:`connect-azure`

* :ref:`connect-aws`

* :ref:`connect-openstack`

* :ref:`connect-ns1`

* :ref:`connect-dyn`

.. _connect-akamai:

Akamai Fast DNS
^^^^^^^^^^^^^^^

Fill in the following fields required to connect to Akamai Fast DNS

+---------------+-----------------------------------------------------------+
| Name          | The name of the cloud service in Micetro                  |
+---------------+-----------------------------------------------------------+
| Client Secret | The credentials needed for Micetro to connect to          |
+---------------+                                                           |
| Host          | the cloud instance                                        |
+---------------+                                                           |
| Access token  |                                                           |
+---------------+                                                           |
| Client token  | **Obtaining Access Credentials**                          |
|               | Please refer to the following on how to create            |
|               | API Access Credentials for use by Micetro:                |
|               | https://developer.akamai.com/introduction/Prov_Creds.html |
+---------------+-----------------------------------------------------------+

.. warning:: Server time setting constrictions
  Akamai OPEN APIs are time sensitive! Ensure that the system your client runs on is synchronized with a Stratum 2 or better time source. (source: https://developer.akamai.com/introduction/Client_Auth.html)

.. danger::
  If the time on the server that the DNS Remote is running on deviates enough from Coordinated Universal Time the authentication will fail and it will not be possible to access/update zone through Micetro.

Go to :ref:`finish-cloud-config`.

.. _connect-azure:

Azure DNS
^^^^^^^^^

Fill in the following fields required to connect to Azure:

+-----------------+-----------------------------------------------------------+
| Name            | The name of the cloud service in Micetro                  |
+-----------------+-----------------------------------------------------------+
| Subscription ID |                                                           |
+-----------------+                                                           |
| Tenant ID       | The credentials needed for Micetro to connect to          |
+-----------------+ the cloud instance                                        |
| Client ID       |                                                           |
+-----------------+                                                           |
| Client secret   |                                                           |
+-----------------+-----------------------------------------------------------+

.. note::
  See :ref:`configure-azure-dns`.

Go to :ref:`finish-cloud-config`.

.. _connect-aws:

Amazon Web Services
^^^^^^^^^^^^^^^^^^^

Fill in the following fields required to connect to AWS:

+-------------------+-----------------------------------------------------------------------------+
| Name              | The name of the cloud service in Micetro                                    |
+-------------------+-----------------------------------------------------------------------------+
|                   | The credentials needed for Micetro to connect to                            |
| Access Key ID     | the cloud instance                                                          |
+-------------------+                                                                             |
|                   | **Obtaining Access Credentials**                                            |
| Secret Access Key | Please refer to the following on how to create API Access                   |
|                   | Credentials for use by Micetro:                                             |
|                   | https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html |
+-------------------+-----------------------------------------------------------------------------+

Read more: :ref:`aws-multi-account`.

Go to :ref:`finish-cloud-config`.

.. _connect-openstack:

Openstack
^^^^^^^^^

Fill in the following fields required to connect to OpenStack:

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

Go to :ref:`finish-cloud-config`.

.. _connect-ns1:

NS1
^^^

Fill in the following fields required to connect to NS1:

+-------------------+-----------------------------------------------------------------------------+
| Name              | The name of the cloud service in Micetro                                    |
+-------------------+-----------------------------------------------------------------------------+
|                   | The credentials needed for Micetro to connect to                            |
|                   | the cloud instance                                                          |
|                   |                                                                             |
| API Key           | **Obtaining Access Credentials**                                            |
|                   | Please refer to the following on how to create API Access                   |
|                   | Credentials for use by Micetro:                                             |
|                   | https://ns1.com/knowledgebase/creating-and-managing-api-keys                |
+-------------------+-----------------------------------------------------------------------------+

Go to :ref:`finish-cloud-config`.

.. _connect-dyn:

Dyn DNS
^^^^^^^

Fill in the following fields required to connect to Dyn:

+-----------------+-----------------------------------------------------------+
| Name            | The name of the cloud service in Micetro                  |
+-----------------+-----------------------------------------------------------+
| Customer Name   |                                                           |
+-----------------+                                                           |
| User Name       | The credentials needed for Micetro to connect to          |
+-----------------+ the cloud instance                                        |
| Password        |                                                           |
+-----------------+-----------------------------------------------------------+

Go to :ref:`finish-cloud-config`.

.. _finish-cloud-config:

Finishing the configuration
^^^^^^^^^^^^^^^^^^^^^^^^^^^

After finishing going through the wizard, the DNS service (if applicable) and any subnets defined (if applicable) will be shown in the DNS servers and IP Address Ranges, respectively.

Editing a Cloud Service 
------------------------

**To edit the properties for a cloud service**:

1. In the Service Management area on the Admin page, locate the service you want to edit.

2. Double-click the service or select it, and then select :guilabel:`Edit service` on the :guilabel:`Action` menu.

3. Make the necessary changes. Select :guilabal:`Confirm` to save the changes.

Removing a Cloud Service
------------------------

**To remove a cloud service**:

1. In the Service Management area on the Admin page, locate the service you want to delete.

2. Double-click the service or select it, and then select :guilabel:`Remove DNS service` on the :guilabel:`Action` menu.

.. warning::
  By removing the cloud service, the associated DNS service and the corresponding zones will be removed. Additionally, any subnets and cloud networks will also be removed.


Removing a Cloud Network
------------------------

To remove a cloud network, right-click on the specific cloud network in the object browser or in the manager window and select :guilabel:`Delete`.
