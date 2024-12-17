.. meta::
   :description: Micetro synchronizes ALIAS records, which can be viewed in the web application or through API.
   :keywords: ALIAS, Micetro, DNS, Records, Cloud, AWS, Azure

.. _alias-dns-records:

AWS and Azure ALIAS records in Micetro
======================================

Micetro synchronizes ALIAS records, which can be viewed in the web application or through API.

In Micetro, ALIAS records are read-only. They have the type "ALIAS" and their underlying :ref:`DNS record type<DNS Resource Records>` is represented in the data field of the record,a long with the resource id/hostname in a human-readable and raw format, all tab-separated.

.. note::
    The full resource ID is not displayed in the **Data** column of the ALIAS record in the list of a DNS zone's resource records. Only the underlying record type and formatted resource ID are displayed.

Examples of AWS and Azure ALIAS records
---------------------------------------

**Data**

underlying_dns_record_type<tab>resource_id_formatted<tab>full_resource_id

.. note::
    Resources in Azure are identified by slash-separated string. Resources in AWS are identified by their DNS hostname.

**ALIAS record AWS data example**

A VPC endpoint:

Europe (Stockholm)<tab>vpce-04e04fa8c9c44a079-fmwbokaq-eu-north-1a.vpce-svc-02498cff0b1f41c19.eu-north-1.cpvce.amazonaws.com.

**ALIAS record Azure data example**

A public IP address:

ip-name<tab>/subscriptions/{subscription-id}/resourceGroups/{resource-group-name}/providers/Microsoft.Network/publicIPAddresses/ip-name


