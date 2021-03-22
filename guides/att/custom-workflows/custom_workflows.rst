.. _custom-workflows:

.. toctree::
  :maxdepth: 2
  :hidden:

AT&T Custom Workflows
*********************

The custom workflows are accessible from the :guilabel:`AT&T --> Requests` context.

Details on customs workflows are in their respective sections below.

In the first delivery phase, only the Traffic move workflow is included. Further workflows are in development and will be documented here.

.. csv-table::
  :header: "Workflow name", "Description"
  :widths: 15, 85

  "Traffic move", "A task that allows for searching/selecting DNS records that belong to a specific include file and section, enabling/disabling sets of records and add the changed to a request."

Traffic move
============

The Traffic Move task is designed to quickly find sets of DNS records that fit a specific criteria, such as residing in a specific include file and/or in a specific section.

The resulting data can be further narrowed down by specifying (using the autocomplete functionality) what APNs should be shown, as well as through additional filtering.

.. image:: ../../images/traffic-move-1.png
  :width: 90%
  :align: center

After specifying the filtering parameters, matching records are displayed grouped by a combination of the NAPTR data, enabled state, and their record queue state.

In the example below, 60 DNS records are being shown in groups of 6 items. The following actions can be performed for each group of records:

* *Enable* and *disable* groups of record
* *Delete* groups of records
* *Cancel* queued change: pressing :guilabel:`Cancel` removes a submitted change from the DNS record change queue.

.. image:: ../../images/traffic-move-2.png
  :width: 90%
  :align: center

Hovering over the number shown before the record data indicates the hostnames (i.e. APNs, TACs) that the record group consists of.

Making changes in a task results in an equal of DNS changes being added to the queue.
For example, disabling one of the record groups in the example above adds 6 “disable record” changes to the record change queue.

Clone record sets
=================

Cloning a DNS record set will duplicate all records (including comments) contained within under a new name.

.. image:: ../../images/clone-record-set.png
  :width: 40%
  :align: center

Bulk import DNS data
====================

Users can modify DNS zone data in bulk, using data in CSV format. (From, for example, spreadsheets) The action can be found in the :guilabel:`AT&T` context, under :guilabel:`Requests --> Import records`.

.. image:: ../../images/bulk-import.png
  :width: 90%
  :align: center

The allowed columns are:

* action: Add, Modify, Remove, Enable, or Disable.

  The Add action uses the fields to describe the record that should be added to the zone.

Other actions use the fields to denote the information needed to be changed in the record. For example the Modify action uses ttl, enabled, comment, and newdata fields to describe how the record should be changed.

* name: the name of the record
* zone: the zone containing the record
* type: the record type (A, NAPTR, etc.)
* data: record data
* ttl: the TTL of the record
* enabled: true/false BOOL value to specify whether the record is enabled or not
* comment
* section: (only used for Add) specifies where the new record should be placed
* newdata: (only for Modify) the new data for modified records

.. note::
  After uploading the CSV file or pasting the data from the clipboard or spreadsheet application, the Web Application validates the input and displays the results (highlighting errors, if any) in a modal dialog before the user can apply the changes.

Examples
--------

Add
"""

Columns: Action,Name,Zone,Type,Data,Section

.. code-block::
  :linenos:

  add,record,zone.com.,NAPTR,100 10 "U" "E2U+sip" "!^.*$!sip:customer-service@example.com!" .,Section 1
  add,record,zone.com.,NAPTR,100 10 "U" "E2U+sip" "!^.*$!sip:customer-service@example.com!" .,Section 2

Modify
""""""

Columns: Action,Name,Zone,Type,Data,NewData

.. code-block::
  :linenos:

  modify,record,zone.com,CNAME,old_target,new_target

Remove, Disable, Enable
"""""""""""""""""""""""

Columns: Action,Name,Zone,Type,Data

.. code-block::
  :linenos:

  remove,record,zone.com,A,192.168.1.50
  disable,record2,zone.com,A,192.168.1.50
  enable,record3,zone.com,A,192.168.1.60

Copy-paste DNS data
===================

Existing DNS records can be quickly moved between zones by using the copy-paste functionality.

Opening a zone and selecting one or more records allows the user to copy record data and paste it to another zone.

.. image:: ../../images/paste.png
  :width: 70%
  :align: center

.. note::
  Clipboard access is disabled when the Web Application is configured without SSL.
  The Men&Mice Web Application will display a modal dialog instead where the selected records are listed, in plaintext format, for manual copy and paste.

II/5. Editing DNS zone access
=============================

When selecting one or more DNS zones, the Web Application offers a shortcut to change access (read-only or read-write) for multiple roles in one operation.

.. image:: ../../images/edit_role_access.png

Every role can be set for its own RO/RW with respect to the zone. After selecting the role, click Add to change its access.
