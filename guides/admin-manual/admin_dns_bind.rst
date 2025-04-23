.. meta::
   :description: Defining options on BIND servers in Micetro
   :keywords: DNS, DNS servers, DNS BIND

.. _admin-dns-bind:

Editing BIND DNS Server Options
================================
Customize your BIND DNS server's behavior by editing various server options.

**To edit BIND server options**:

1. Locate the BIND server that you want to configure on the :guilabel:`Service Management` tab of the **Admin** page.

2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Edit server options`.

3. In the dropdown, select the specific option you want to modify.

    .. image:: ../../images/bind-edit-options.png
      :width: 80%

4. In the dialog, adjust the settings according to your requirements. To add another entry, select :guilabel:`Add`.

   **Query Options**

   * **Recursive**: Determines whether the server answers recursive queries.
   * **Query restrictions**: Specifies which hosts or IP addresses are allowed to send queries to this resolver. 
   * **Recursive query restrictions**: Sets restrictions on recursive queries, specifying which IP addresses or hosts can make recursive queries to your DNS server.
   * **Query forwarding**: Configures the DNS server to forward queries to other DNS servers, allowing you to specify the IP addresses of the servers to which queries should be forwarded.
  

   **Transfer Options**

   * **Transfer restrictions**: Restricts zone transfers to specific IP addresses or hosts, enhancing security by limiting access to sensitive information.
   * **Update notifications**: Enables or disables NOTIFY messages on zone changes, ensuring other DNS servers are promptly informed of updates to your zones.

5. Prioritize address match list entries by dragging and dropping them into the preferred sequence.

    .. image:: ../../images/bind-serveroptions-prioritize.png
      :width: 80%

6. Select :guilabel:`Save`.

Modifying BIND Servers' Raw Configuration
-----------------------------------------
DNS administrators can access and directly modify raw configuration files, granting them control over server and zone options not available through the Web Application.

This option is intended for experienced users who have a deep understanding of DNS configurations.

**To edit BIND configuration files**:

1. Locate the BIND server that you want to configure in the :guilabel:`Service Management` data grid.

2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Edit server options`.

3. In the dialog, select the :guilabel:`Raw Configuration` tab. If the tab is not available, it indicates that changes have been made on the :guilabel:`Options` tab. Close the dialog and reopen it to discard any unsaved modifications.

   .. image:: ../../images/bind-serveroptions-rawconfig.png
      :width: 80%

   * The various configuration files associated with the BIND server, and which may represent its different aspects, are available in the :guilabel:`File` dropdown. Select the specific configuration file you want to modify.

   * If you want to make changes to specific settings within the selected configuration file, use the search box to enter keywords or terms related to the settings you want to modify.

4. Make your edits and then select :guilabel:`Save`.

Removing DNS Options
--------------------
To remove an option, select the :guilabel:`Options` tab in the **Edit Server Options** dialog. On the tab, select the trash can icon next to the option you want to remove.
