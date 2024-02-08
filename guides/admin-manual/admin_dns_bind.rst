.. meta::
   :description: Defining options on BIND servers in Micetro
   :keywords: DNS, DNS servers, DNS BIND

.. _admin-dns-bind:

BIND DNS
=========


Editing Service Options
------------------------
You can edit various service options for your BIND environment to customize your server's behavior according to your requirements.

Query Restrictions
^^^^^^^^^^^^^^^^^^
The Query restrictions option allows you to restrict recursive DNS queries to only certain IP Addresses or address ranges.^

**To configure a query restriction**:

1. Click the Add button.

2. Enter an IP Address in the field provided. You can choose a predefined range from the drop down list, which gives you the option to select any, none, localhost, or localnets.

3. Choose whether you want to allow or deny this server access control for recursive queries by selecting the appropriate radio button.

4. Click OK to add the new restriction to the list.

Transfer Restrictions
^^^^^^^^^^^^^^^^^^^^^
The Transfer restrictions panel allows you to restrict zone transfers to only certain IP Addresses or address ranges. Restricting access to zone transfers is a marginally effective security measure designed to prevent outsiders from seeing the names and IP Addresses of your hosts. All of this information is available from a reverse zone lookup. However, security through obscurity will keep out amateurs and the merely curious.

Update Restrictions
^^^^^^^^^^^^^^^^^^^

Recursive Query Restrictions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Update Notifications
^^^^^^^^^^^^^^^^^^^^
Controls whether NOTIFY messages are sent on zone changes

Query Forwarding
^^^^^^^^^^^^^^^^^

Recursive
^^^^^^^^^^
If options statement contains `recursion yes` (or no recursion statment, since `yes` is the default), the server will answer recursive queries, if it has `recursion no` it will only answer for records in the zones it hosts


Raw Configuration
^^^^^^^^^^^^^^^^^
DNS Administrators can access and modify raw configuration files directly. This is useful for making changes to the server and zone options that are not available through the GUI.

**To edit BIND configuration files**:

1. Locate the BIND server that you want to configure.

2. Select :guilabel:`Edit server options` on either the :guilabel:`Action` or the Row :guilabel:`...` menu.

3. Go to the :guilabel:`Raw Configuration` tab.

    image

    * The various configuration files associated with the BIND server are available on the File drop-down list. From this list, select the specific configuration file that you want to modify. Configuration files may represent different aspects of the BIND server.

    * If you’re looking to make changes to specific settings within the selected configuration file, you can use the search box. Enter keywords or terms related to the settings you wish to modify.

3. Make your edits, and click Save when you are done.