.. meta::
   :description: How to insert a new record in the zone tab in the Micetro by Men&Mice Management Console 
   :keywords: DNS record, DHCP record, IPAM

.. _console-new-dns-record:

New Records (Management Console)
--------------------------------

If you are comfortable editing the record table directly, you can use this procedure to insert a new record directly in the zone tab.

1. Open the :guilabel:`Zone` tab to display the resource records in the zone you want to edit.

2. In the record table, select the record that is directly above where you want to insert the new record. To select a record, click on the square block to the left of the Name column.

3. Right-click anywhere in the selected record and, from the shortcut menu, select :guilabel:`Insert Record`. A new, blank record is added.

4. Starting with the **Name** field, enter the domain name.

.. warning::
  If you enter a domain name that is not fully qualified (i.e., does not end in a dot.). The program will assume that you are using a local name and will automatically append the name of the zone onto the end of the name, making it a fully qualified domain name. That means when adding the name server ns1 to the zone example.com, you should enter either just ns1 or ns1.example.com. If you leave off the period at the end, the program will interpret your intention as ns1.example.com.example.com. The information automatically filled in by the Management Console appears in grey.

5. Press the Tab key to advance the focus to the **Type** field. Enter the appropriate type classification. The following types of resource records can be created: NS, A, PTR, CNAME, MX, AAAA, WKS, RP, AFSDB, SRV, HINFO, TXT, and NAPTR. The appropriate number of fields is automatically created in the Data field based on the type you entered. If you enter the wrong record type, you will be unable to change it. You must delete the record, insert a new one, and re-enter the record information.

6. Press the Tab key to advance the focus to the **Data** field. Enter the appropriate data for your record type.

7. Click the :guilabel:`Save` button to save the new record to the zone.

8. An exclamation mark displays at the left edge of a record that is incomplete or improperly entered. The program will not allow you to save the changes to this zone until the record is repaired. Move to the lower right corner of the tab and click the exclamation point icon. This expands the tab and shows the items in error. Double-click on the error message and it will jump to the record in question.

.. image:: ../../images/console-dns-records-inspector.png
  :width: 80%
  :align: center
