.. _micetro-permissions:

Permissions reference
---------------------

The following tables list all the permissions in Micetro, as defined in the API and the web application.

.. csv-table:: Micetro
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_adminUser``", "**Administer users/groups**", ""
    "``access_adminIPAM``", "**Administer IP address ranges**", ""
    "``access_adminDNS``", "**Administer DNS servers**", ""
    "``access_adminDHCP``", "**Administer DHCP servers**", ""
    "``access_adminAppliance``", "**Administer appliances**", ""
    "``access_adminDevice``", "**Administer devices**", ""
    "``access_IPAMModule``", "**Access IPAM module**", ""
    "``access_DNSModule``", "**Access DNS module**", ""
    "``access_DHCPModule``", "**Access DHCP module**", ""
    "``access_console``", "**Access to the Management Console**", ""
    "``access_commandLine``", "**Access to the CLI**", ""
    "``access_web``", "**Access to the web interface**", ""
    "``access_basicZoneView``", "**Access to basic zone view in web interface**", ""
    "``access_advancedZoneView``", "**Access to advanced zone view in web interface**", ""
    "``access_IPAMView``", "**Access to IPAM view in web interface**", ""
    "``access_basicReporting``", "**Access to basic reporting**", ""
    "``access_tasksView``", "**Access to task list view in web interface**", ""
    "``access_viewHistory``", "**Access to view history**", ""
    "``access_webHostEditor``", "**Access to Host editor**", ""
    "``access_adminADSites``", "**Access to manage AD Sites and Site Links**", ""
    "``access_adminClouds``", "**Access to manage clouds**", ""
    "``access_workflowModule``", "**Access Workflow module**", ""
    "``access_advancedReporting``", "**Access to advanced reporting**", ""
    "``access_importDataCustom``", "**Access to "Import Data" web task**", ""

.. csv-table:: Micetro
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_adminUser``", "**Administer users/groups**", ""
    "``access_adminIPAM``", "**Administer IP address ranges**", ""
    "``access_adminDNS``", "**Administer DNS servers**", ""
    "``access_adminDHCP``", "**Administer DHCP servers**", ""
    "``access_adminAppliance``", "**Administer appliances**", ""
    "``access_adminDevice``", "**Administer devices**", ""
    "``access_IPAMModule``", "**Access IPAM module**", ""
    "``access_DNSModule``", "**Access DNS module**", ""
    "``access_DHCPModule``", "**Access DHCP module**", "Legacy permission, IPAM module contains DHCP."
    "``access_console``", "**Access to the Management Console**", ""
    "``access_commandLine``", "**Access to the CLI**", "Legacy permission, the CLI (Command Line Interface) is no longer in use."
    "``access_web``", "**Access to the web interface**", ""
    "``access_basicZoneView``", "**Access to basic zone view in web interface**", "Legacy permission, not available in the web application."
    "``access_advancedZoneView``", "**Access to advanced zone view in web interface**", ""
    "``access_IPAMView``", "**Access to IPAM view in web interface**", ""
    "``access_basicReporting``", "**Access to basic reporting**", "Manually run built-in reports."
    "``access_tasksView``", "**Access to task list view in web interface**", "Legacy permission, not available in the web application."
    "``access_viewHistory``", "**Access to view history**", ""
    "``access_webHostEditor``", "**Access to Host editor**", "Legacy permission, not available in the web application."
    "``access_adminADSites``", "**Access to manage AD Sites and Site Links**", ""
    "``access_adminClouds``", "**Access to manage clouds**", ""
    "``access_workflowModule``", "**Access Workflow module**", ""
    "``access_advancedReporting``", "**Access to advanced reporting**", "Build custom reports, and schedule reports."
    "``access_importDataCustom``", "**Access to "Import Data" web task**", ""

.. csv-table:: DNS servers
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_editAccess``", "**Edit DNS server access**", ""
    "``access_list``", "**List (or view) DNS server**", ""
    "``access_viewHistory``", "**View DNS server history**", ""
    "``access_options``", "**Edit DNS server options**", ""
    "``access_addMaster``", "**Add master zones**", ""
    "``access_addNonMaster``", "**Add non-master zones**", ""
    "``access_viewLog``", "**View DNS server log**", ""
    "``access_clearLog``", "**Clear DNS server log**", ""
    "``access_editProperties``", "**Edit DNS server properties**", ""
    "``access_manageLocalZones``", "**Manage local zones**", ""

.. csv-table:: DHCP servers
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_editAccess``", "**Edit DHCP server access**", ""
    "``access_list``", "**List (or view) DHCP server**", ""
    "``access_viewHistory``", "**View DHCP server history**", ""
    "``access_readOptions``", "**Read DHCP server options**", ""
    "``access_options``", "**Read/write DHCP server options**", ""
    "``access_addScope``", "**Add a scope**", ""
    "``access_editProperties``", "**Edit DHCP server properties**", ""
    "``access_reservations``", "**Edit reservations**", ""
    "``access_addGroup``", "**Add a group**", ""
    "``access_readClassData``", "**Read DHCP class data**", ""
    "``access_classData``", "**Read/write DHCP class data**", ""

.. csv-table:: DNS zones
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_editAccess``", "**Edit zone access**", ""
    "``access_list``", "**List (or view) zone**", ""
    "``access_viewHistory``", "**View zone history**", ""
    "``access_enable``", "**Enable/disable zone**", ""
    "``access_options``", "**Edit zone options**", ""
    "``access_delete``", "**Delete zone**", ""
    "``access_enableApex``", "**Enable/disable apex records**", ""
    "``access_editApex``", "**Edit apex records**", ""
    "``access_enableWildcard``", "**Enable/disable wildcard records**", ""
    "``access_editWildcard``", "**Edit wildcard records**", ""
    "``access_enableOther``", "**Enable/disable other records**", ""
    "``access_editOther``", "**Edit other records**", ""
    "``access_editProperties``", "**Edit zone properties**", ""

.. csv-table:: Ranges and DHCP scopes
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_editAccess``", "**Edit range access**", ""
    "``access_list``", "**List (or view) range**", ""
    "``access_viewHistory``", "**View range history**", ""
    "``access_delete``", "**Delete range**", ""
    "``access_editProperties``", "**Edit range properties**", ""
    "``access_editDeviceProperties``", "**Edit IP Address properties**", ""
    "``access_editDNSHosts``", "**Use IP addresses in DNS**", ""
    "``access_createSubrange``", "**Create subrange**", ""
    "``access_reuseAddress``", "**Create multiple hosts per IP address**", ""
    "``access_pingAddresses``", "**Ping IP addresses**", ""
    "``access_siteAssociation``", "**Edit AD site association**", ""
    "``access_enable``", "**Enable/disable scope**", ""
    "``access_readOptions``", "**Read scope options**", ""
    "``access_options``", "**Read/write scope options**", ""
    "``access_reservations``", "**Edit reservations**", ""
    "``access_addressPools``", "**Edit address pools**", ""
    "``access_exclusions``", "**Edit exclusions**", ""
    "``access_releaseLeases``", "**Release leases**", ""
    "``access_addGroup``", "**Add a group**", "Legacy permission for DHCP groups."

.. csv-table:: DHCP groups (legacy only)
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_editAccess``", "**Edit DHCP group access**", ""
    "``access_list``", "**List (or view) DHCP group**", ""
    "``access_viewHistory``", "**View DHCP group history**", ""
    "``access_reservations``", "**Edit reservations**", ""
    "``access_readOptions``", "**Read DHCP group options**", ""
    "``access_options``", "**Read/write DHCP group options**", ""
    "``access_delete``", "**Delete DHCP group**", ""

.. csv-table:: Address spaces
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_editAccess``", "**Edit address space access**", ""
    "``access_list``", "**List (or view) address space**", ""
    "``access_viewHistory``", "**View address space history**", ""


.. csv-table:: Cloud networks
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_editAccess``", "**Edit cloud network access**", ""
    "``access_list``", "**List (or view) cloud network**", ""
    "``access_viewHistory``", "**View cloud network history**", ""
    "``access_editProperties``", "**Edit cloud network properties**", ""
    "``access_delete``", "**Delete cloud network**", ""

.. csv-table:: Cloud services
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60

    "``access_editAccess``", "**Edit cloud access**", ""
    "``access_list``", "**List (or view) cloud**", ""
    "``access_viewHistory``", "**View cloud history**", ""
    "``access_editProperties``", "**Edit cloud properties**", ""
    "``access_createCloudNetwork``", "**Create cloud network**", ""

..
    .. csv-table:: Server groups
    :header: "API", "Web application", "Notes"
    :widths: 15, 25, 60
    "``access_editAccess``", "**Edit server group access**", ""
    "``access_list``", "**List (or view) server group**", ""
    "``access_viewHistory``", "**View server group history**", ""
