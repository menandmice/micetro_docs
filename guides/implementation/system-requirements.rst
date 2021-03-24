.. _system-requirements:

System requirements
===================

The minimum system requirements and supported platforms for the Men&Mice Suite are as follows:

Hardware
--------

.. note::
  The hardware requirements for the Suite components are dependent on the size of the environment and usage. Refer to :ref:`architecture-overview` for details.

Operating systems
-----------------

.. csv-table:: Operating systems
  :header: "Operating system", "Management Console [1]_", "Server Controllers", "Men&Mice Central", "Web Application", "API [2]_", "Command Line Interface"
  :widths: 20, 20, 20, 10, 10, 10, 10

  "**Microsoft Windows**",,,,,,
  "Windows Server 2008 R2 [3]_", "Y", "Y", "Y", "Y", "N/A", "Y"
  "Windows Server 2012", "Y", "Y", "Y", "Y", "N/A", "Y"
  "Windows Server 2012 R2", "Y", "Y", "Y", "Y", "N/A", "Y"
  "Windows Server 2016", "Y", "Y", "Y", "Y", "N/A", "Y"
  "Windows Server 2019", "Y", "Y", "Y", "Y", "N/A", "Y"
  "**Solaris**",,,,,,
  "Solaris 10 x86", "N", "Y", "N", "N", "N/A", "N"
  "**Linux**",,,,,,
  "Redhat Enterprise Linux 6", "N", "Y", "Y", "Y", "N/A", "Y"
  "Redhat Enterprise Linux 7", "N", "Y", "Y", "Y", "N/A", "Y"
  "Redhat Enterprise Linux 8", "N", "Y", "Y", "Y", "N/A", "Y"
  "CentOS 6", "N", "Y", "Y", "Y", "N/A", "Y"
  "CentOS 7", "N", "Y", "Y", "Y", "N/A", "Y"
  "CentOS 8", "N", "Y", "Y", "Y", "N/A", "Y"
  "Suse Enterprise Linux 11/12/13 x86", "N", "Y", "Y", "Y", "N/A", "Y"
  "Ubuntu 14.04 LTS", "N", "Y", "Y", "Y", "N/A", "Y"
  "Ubuntu 16.04 LTS", "N", "Y", "Y", "Y", "N/A", "Y"
  "Ubuntu 18.04 LTS", "N", "Y", "Y", "Y", "N/A", "Y"

.. [1] The management console also works on non-server Windows that have not reached their EOL.

.. [2] The REST and SOAP APIs are bundled into the Web Application, both for Windows and Linux.

.. [3] On January 14, 2020, Microsoft ends support for Windows server 2008 and 2008 R2 and therefore support for those server types will be deprecated in future versions of the Men&Mice Suite.

Databases
---------

.. csv-table:: Databases
  :header: "Database", "Supported version(s)", "Operating System of Men&Mice Central"
  :widths: 20, 20, 60

  "SQLite", "N/A [4]_", "Windows, Linux, Solaris"
  "Microsoft SQL Server", "2008 R2, 2012, 2014, 2016", "Windows"

.. [4] The SQLite database is embedded into the Men&Mice Central application.

DNS/DHCP Server software
------------------------

.. csv-table:: DNS & DHCP server software
  :header: "Server", "Version(s)"
  :widths: 40, 60

  "**DNS**"
  "Microsoft DNS", "2008 R2, 2012, 2012 R2, 2016, 2019"
  "ISC BIND", "9.6 - 9.14"
  "Unbound", "1.4.22 - 1.7.3"
  "PowerDNS Authoritative Server", "3.4 - 4.3"
  "**DHCP**"
  "Microsoft DHCP", "2008 R2, 2012, 2012 R2, 2016, 2019"
  "ISC DHCP", "3.0.6 - 4.4.1"
  "ISC Kea", "1.1.0 - 1.2.0"
  "Cisco IOS with DHCP support", "12.3 - 16.09"

Other
-----

Men&Mice Web Interface and Web Application
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Microsoft IIS [5]_

* Apache 2 Web server 2.2/2.4 [6]_

.. [5] When using IIS 7 the IIS 6 Management Compatibility and ISAPI Extensions role services are required.

.. [6] The Apache web server are supported on all platforms except Windows.

Supported Cloud Services
^^^^^^^^^^^^^^^^^^^^^^^^

* Azure [7]_

* Amazon Web Services (AWS)

* Dyn DNS

* NS1 DNS

* OpenStack

* Akamai

.. [7] the Men&Mice Suite is available to install directly from the Azure Marketplace.

Supported browsers (Web Application)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Chrome

* Firefox

* Safari
