.. meta::
   :description: How to add a service to Micetro
   :keywords: DNS services, DHCP services, IPAM services, add service

.. _adding-service:

Adding a Service
================
.. note::
    To add a new service to Micetro, you must have permission to administer DNS and/or DHCP.

Adding a new service is either a two- or three-step process, depending on the type of service being added. You can add any of the supported service types. 

**To add a service**:

1. On the :guilabel:`Service Management` tab, select :guilabel:`Add Service` on the task bar.   

2. In the dialog, select the type of service you want to add and then select :guilabel:`Next`. The list of options is based on your license keys.

   .. tip::
    You can use the **DNS**, **DHCP**, and **IPAM** filters at the top to narrow down the list. You can also use the search box to find the specific service you need.

  .. image:: ../../images/add-service-dialogbox.png
      :width: 100%

3. In the :guilabel:`Properties` step, select an agent from the dropdown.

   .. note::
    This step is not required for cloud services, or for ISC BIND and ISC DHCP where the agent must be installed on the service host itself.

   .. image:: ../../images/add-service-properties-tab.png
     :width: 100%
   
   The agent can be installed on the following hosts:

     * Micetro Central host
     * The service host
     * A different host (for MS DNS/DHCP, ISC Kea, Cisco Meraki, and Cisco IOS services)
   
    .. note::
        If you have already added a service of this type, you can select from existing agents or create a new one. A single agent can be used to manage multiple service connections.
    
    **To use an existing agent**: For **AuthServe**, **Cisco IOS**, **Kea**, **Meraki**, **MS DNS**, and **MS DHCP** services, you can choose from a list of available agents registered during the installation process.

    **To use the agent installed on the server**: For **Kea**, **MS DNS**, and **MS DHCP** services, you can select the :guilabel:`Service host` to use the agent installed on the server.

    **To register a new agent**: For **AuthServe**, **Cisco IOS**, **Kea**, **MS DNS**, or **MS DHCP**, you can select :guilabel:`New Agent` from the :guilabel:`Agent` dropdown. Enter a hostname or IP address (if the agent hostname is not resolvable).
    
        * For **AuthServe** specificially, you must specify the name and shared secret for the agent.

    .. image:: ../../images/add-service-newagent.png
         :width: 100%

4. Enter the necessary details for the service and select :guilabel:`Next`. The :guilabel:`Properties` step displays a sidebar with context-sensitive help specific to the type of service you select.

  * **cloud services**: Each service type has its set of credentials in addition to the optional service name. For more information about adding cloud services, refer to :ref:`cloud`.

  * **On-premises services**:

    * Enter the hostname or IP address of the service/server.

    * **AuthServe** uses a channel as the connection string. The channel name is mapped to a hostname in a server configuration file. 'ansp' is the default channel name, which maps to localhost. To use a different hostname, the format is ``"1.2.3.4#<someseceret>"``. Consult the `AuthServe documentation <https://techdocs.akamai.com/home>`_ for details.

5. In the :guilabel:`Custom Properties` step, you can set optional custom property values for the service, such as authority and region. When finished, select :guilabel:`Next`.

6. Review the service's settings in the :guilabel:`Summary` step. If you need to make any changes to the service, use the :guilabel:`Back` button to return to any of the previous steps.

7. Select :guilabel:`Add` to add the service to Micetro.
