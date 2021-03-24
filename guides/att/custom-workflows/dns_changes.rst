.. _dns-changes:

DNS Changes
***********

Making DNS changes in the Men&Mice Suite are done through the Request Queue.

.. note::
  By going through the request workflow, the DNS records are modified according to how the specific task is designed. Multiple operations are combined in to one operation which makes changes easier and faster and also can capture possible human errors.

  **It is always preferable to use the request workflows instead of manual changes outside the Men&Mice Suite.**

The Requests system encapsulates multiple changes in a single object, and allows users to specify a MOP and optionally more verbose descriptions for their changes.
In addition, Requests contain other metadata that AT&T’s systems will want to keep track of.

The Requests system allows viewing the changes per MOP, and makes it easy to review and adjust the changes before they are deployed.

Viewing the list of Requests
============================

.. image:: ../../images/requests_admin_view.png
  :width: 90%
  :align: center

The :guilabel:`AT&T --> Requests` context in the Web Application serves as the main page for showing all Requests in the system, along with their status.

Selecting a Request in the list displays additional properties, in the Inspector panel on the right side of the screen.
This includes details on the changes contained in the selected Request. (Such as what DNS zones are affected and the total number of changes.)

The left sidebar allows for showing (filtering) Requests based on status:

Staged
  shows all Requests with the status Staged (copied to the Server Group(s) but not activated as live)

Deployed
  shows all Requests with the status Deployed (made live through the Server Group(s))

Org
  a custom field which allows to select all Requests that belong to either NSD or Enterprise.

.. note::
  The custom field of Org is configured in the Men&Mice Management Console. See the Implementation Guide for details.

The Inspector
-------------

The Inspector displays information about the selected Request(s):

Properties
^^^^^^^^^^

.. csv-table::
  :header: "Property", "Description"
  :widths: 15, 85

  "Request ID", "The ID of the Request in the system."
  "Type of change", "The type of change deployed or staged. (DNS records, for example.)"
  "Requested by", "The username of the user that created the Request."
  "State", "The state of the Request: *staged* or *deployed*."
  "Submitted on", "Date and time the Request was submitted on."
  "Comment", "If a comment has been added while submitting the Request."

Changes
^^^^^^^

.. csv-table::
  :header: "Property", "Description"
  :widths: 15,85

  "Number of changes", "The number of changes contained in the Request."
  "Zones", "A list of all DNS zones (i.e. include files) altered by the changes in the Request."

Viewing Request details
-----------------------

Double-clicking on a Request displays the DNS changes contained within the selected Request, grouped by include file.

.. image:: ../../images/request-details.png
  :width: 90%
  :align: center

Use this for a good overview on what DNS changes are about to be deployed.

Viewing the DNS record change queue
===================================

.. image:: ../../images/change_queue.png
  :width: 30%
  :align: center

When a DNS record change is made, it is added to the record change queue.

The queue is accessible through the icon in the top right of the Web Application that looks like an “Outbox.”
If any changes are submitted, it shows the number of queued record changes. If the queue is empty, the icon is greyed out and inactive.

Clicking on the icon displays the queue as a list of DNS record changes, grouped by include file.
The Quick filter can be used to find any particular DNS record change or narrow the list of displayed items.

.. image:: ../../images/request_queue.png
  :width: 90%
  :align: center

Deployed and undeployed requests
================================

In the Server Groups context, admins can view a list of deployed and undeployed requests. These can be managed individually, or the list exported as a report.

Submitting to a Request
=======================

1. When you are ready to submit the DNS record changes in the queue, click the :guilabel:`Next` button.

2. Fill out the form to provide metadata for the Request. These can include the Work Order, Description and Org. Additional custom properties will automatically be presented in this form.

3. Click Submit to package all the changes in the DNS Record change queue into a single Request. After submitting, the changes are written to the staging server’s configuration (i.e. become *staged*).

.. image:: ../../images/submit-request.png
  :width: 70%
  :align: center
