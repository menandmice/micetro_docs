.. _console-snmp-profiles:

Configuring Host Discovery by Querying Routers (Management Console, obsolete)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It is possible to perform host discovery by performing SNMP queries on specified routers. SNMP v1, v2c and v3 is supported.

Before a router can be queried it must be placed in an SNMP profile. An SNMP profile contains the information necessary to access the SNMP information on the router. Note that multiple routers can share the same SNMP profile.

To create an SNMP profile:

1. Select :menuselection:`Tools --> SNMP Profiles`. A new profile can be created, edited or removed. Additionally, a scan can be initiated. If the :guilabel:`Scan` button is greyed out, a scan is already in progress.

2. To create a new profile, click :guilabel:`Add`. The *SNMP Profile* dialog box is displayed.

3. Enter a profile name and choose the SNMP version to use. You can also specify a non-standard port to use for SNMP.

4. Enter the necessary information to access the router using SNMP. The information is different depending on the SNMP version selected:

  For SNMP v1 and v2c:

  .. csv-table::
    :widths: 15, 85

    "Community", "Enter the SNMP community string (password) to use to access the routers using the profile."

  For SNMP v3:

  .. csv-table::
    :widths: 15, 85

    "Username",	"Enter a user name for accessing the routers using the profile."
    "Authentication Protocol", "Choose the authentication protocol to use. The available protocols are MD5 and SHA."
    "Authentication Password", "Enter the authentication password for the routers using the profile."
    "Encryption Protocol", "Choose the encryption protocol to use. The available protocols are DES and AES."
    "Encryption Password", "Enter the authentication password for the routers using the profile."

5. Enter the IPv4 address of one or more routers that you want to query using this profile. Note that each router's IP address needs to be on a separate line in the text area.

6. Click :guilabel:`OK` to save the settings and close the dialog box.

You can edit an SNMP profile, for example if you want to add or remove routers from a profile.

To edit an SNMP profile:

1. Select :menuselection:`Tools --> SNMP Profiles`, select the SNMP profile you want do edit and click :guilabel:`Edit` in the dialog box that appears. The *SNMP Profile* dialog box is displayed for the selected entry.

2. Make the required changes and click :guilabel:`OK` to save the changes and close the dialog box.
