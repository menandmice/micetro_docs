.. meta::
   :description: Minimum system requirements for Micetro
   :keywords: system requirements, Micetro

.. _system-requirements:

System Requirements
===================

The minimum system requirements and supported platforms for Micetro are as follows:

Hardware
--------

.. note::
  The hardware requirements for the Micetro components are dependent on the size of the environment and usage. Refer to :ref:`architecture-overview` for details.

Operating Systems
-----------------

.. csv-table:: Operating Systems
  :header: "Operating system", "Management Console [1]_", "Agents", "Micetro Central", "Web Application", "API [2]_", "Command Line Interface"
  :widths: 20, 20, 20, 10, 10, 10, 10

  "**Microsoft Windows**",,,,,,
  "Windows Server 2016", "Y", "Y", "Y", "Y", "N/A", "Y"
  "Windows Server 2019", "Y", "Y", "Y", "Y", "N/A", "Y"
  "Windows Server 2022", "Y", "Y", "Y", "Y", "N/A", "Y"
  "**Linux**",,,,,,
  "Redhat Enterprise Linux 6", "N", "Y", "Y", "Y", "N/A", "Y"
  "Redhat Enterprise Linux 7", "N", "Y", "Y", "Y", "N/A", "Y"
  "Redhat Enterprise Linux 8", "N", "Y", "Y", "Y", "N/A", "Y"
  "Redhat Enterprise Linux 9", "N", "Y", "Y", "Y", "N/A", "Y"
  "CentOS 6", "N", "Y", "Y", "Y", "N/A", "Y"
  "CentOS 7", "N", "Y", "Y", "Y", "N/A", "Y"
  "CentOS 8", "N", "Y", "Y", "Y", "N/A", "Y"
  "Suse Enterprise Linux 11/12/15", "N", "Y", "Y", "Y", "N/A", "Y"
  "Ubuntu 16.04 LTS", "N", "Y", "Y", "Y", "N/A", "Y"
  "Ubuntu 18.04 LTS", "N", "Y", "Y", "Y", "N/A", "Y"
  "Ubuntu 20.04 LTS", "N", "Y", "Y", "Y", "N/A", "Y"
  "Ubuntu 22.04 LTS", "N", "Y", "Y", "Y", "N/A", "Y"
  "Ubuntu 24.04 LTS", "N", "Y", "Y", "Y", "N/A", "Y"

.. [1] The management console also works on non-server Windows that have not reached their EOL.

.. [2] The REST and SOAP APIs are bundled into the Web Application for Windows and Linux.

.. note::
   Starting from version 10.2, support for 32-bit Linux Operating Systems will be discontinued due to the lack of support from common Linux distributions.

Databases
---------

.. csv-table:: Databases
  :header: "Database", "Supported version(s)", "Operating System of Micetro Central"
  :widths: 20, 20, 60

  "PostgreSQL", 12-16, "Windows, Linux"
  "SQLite", "N/A [3]_", "Windows, Linux"
  "Microsoft SQL Server", "2014, 2016, 2019, 2022", "Windows"

.. [3] The SQLite database is embedded into the Micetro Central application.


DNS/DHCP Server Software
------------------------

.. csv-table:: DNS & DHCP Server Software
  :header: "Server", "Version(s)"
  :widths: 40, 60

  "**DNS**"
  "Microsoft DNS", "2016, 2019, 2022"
  "ISC BIND", "9.18 - 9.20"
  "PowerDNS Authoritative Server", "3.4 - 4.9"
  "**DHCP**"
  "Microsoft DHCP", "2016, 2019, 2022"
  "ISC DHCP", "4.4.1 - 4.4.3"
  "ISC Kea", "2.2, 2.4, 2.6"
  "Cisco IOS with DHCP support", "12.3 - 16.09"

.. warning::
  ISC Kea version 2.0 and older are no longer supported. See :ref:`kea-update` for more details.

Other
-----

Micetro Web Interface
^^^^^^^^^^^^^^^^^^^^^^^^

* Microsoft IIS [4]_

* Apache 2 Web server version 2.4 [5]_

.. [4] When using IIS 7 the IIS 6 Management Compatibility and ISAPI Extensions role services are required.

.. [5] The Apache web server is supported on all platforms except Windows.

Supported Cloud Services
^^^^^^^^^^^^^^^^^^^^^^^^

* Azure [6]_

* Amazon Web Services (AWS)

* NS1 DNS

* Akamai

.. [6] Micetro can be installed directly from the Azure Marketplace. See :ref:`installation-azure`.

Supported Browsers (Web Interface)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Microsoft Edge

* Google Chrome

* Mozilla Firefox

* Apple Safari
