.. meta::
   :description: Configuring remote logging servers (syslog) on appliances in Micetro
   :keywords: appliances, DNS/DHCP appliance, MDDS appliances, SNMP, monitoring


Configuring Remote Logging Servers (Syslog)
===========================================
Micetro enables you to define multiple remote logging servers on an appliance to meet diverse logging needs. Centralizing syslog management across a network offers a multitude of advantages, including:

* Consolidating and storing logs in a central location.
* Facilitating proactive alerting and notification systems.
* Providing IT professionals with streamlined troubleshooting processes.
* Enhancing security monitoring capabilities.
* Simplifying compliance and auditing procedures.

Centralized syslog management both allows you to achieve resource optimization --- which is particularly beneficial for devices with limited storage capacity --- and enables administrators to address potential issues before they escalate.

When you configure a remote logging server, you must specify several key properties to customize server addresses, communication ports, protocols, log levels, service types, timestamp formats, and more.

**To configure syslog**:

1. In the data grid, locate the specific appliance for which you want to configure syslog.
2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Configure Syslog`. 
3. In the **Configure Syslog** dialog, select :guilabel:`Add Server` to add a new remote logging server.
4. In the **Add Syslog Server** dialog, configure your remote logging server:

    .. image:: ../../images/add-syslog-server.png
        :width: 80%

   * **Server Address**: Assign an IP address to each remote logging server. 
   * **Port Number**: Specify the communication port. 
   * **Protocol**: Select the transport protocol that aligns with the requirements (TCP or UDP). 
   * **Log Level**: Select the desired log level.
   * **Service Types**: Define service types to filter by. 
   * **With ISO Timestamp**: Decide whether to use the ISO format for timestamps, with customization available for each remote server and locally on the appliance itself. 
   * **RFC-5424**: Choose between using RFC-5424 (Syslog protocol) or defaulting to RFC-3164 (BDS syslog protocol) if not explicitly selected. 

Editing a Syslog Server
-----------------------
You can also modify the configuration of an existing remote logging server.

**To edit an existing syslog server**:

1. In the data grid, locate appliance for which you want to edit syslog.
2. Use either the :guilabel:`Action` or the Row :guilabel:`...` menu to select :guilabel:`Configure Syslog`.
3. In the **Configure Syslog** dialog, locate the remote syslog server you want to edit.
4. Use the Row :guilabel:`...` menu to select :guilabel:`Edit`.
5. In the **Edit Syslog Server** dialog, make the necessary edits to the remote logging server and select :guilabel:`Save`.

   .. image:: ../../images/appliance-edit-syslog.png
      :width: 80%

6. Select :guilabel:`Save`.

Removing a Syslog Server
------------------------
If needed, you can remove a remote syslog server from an appliance in Micetro.

**To remove a remote syslog server**:

1. In the **Configure Syslog** dialog, locate the server you want to remove.
2. Use the Row :guilabel:`...` menu to select :guilabel:`Remove`.

   .. image:: ../../images/remove-syslog-server.png
    :width: 80%
