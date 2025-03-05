.. meta::
   :description: The PowerDNS connector script allows management of zones in PowerDNS. Native mode and Primary/Secondary mode in the authoritative PowerDNS are currently supported.
   :keywords: PowerDNS, DNS

.. _powerdns:

Integrating PowerDNS Authoritative Server with Micetro
======================================================

PowerDNS is integrated through the generic DNS service (see :ref:`generic-dns-controller`). The PowerDNS connector script facilitates zone management within PowerDNS. Both Native mode and Primary/Secondary mode are supported by the authoritative PowerDNS.

**Prerequisites**

1. **PowerDNS Authoritative DNS Server**: Ensure you have PowerDNS installed and running.

2. **Micetro Agent**: Download the Micetro Controller installer package.

Enabling the PowerDNS REST API
-------------------------------

1. Edit your PowerDNS configuration file to enable the REST API:

    .. code-block:: bash

      api=yes
      api-key=bluecat123
      webserver-port=8081

2. Test the REST API with a curl command:

  .. code-block:: bash

    curl -v -H 'X-API-Key: bluecat123' http://127.0.0.1:8081/api/v1/servers/localhost/zones | jq .

Configuration Steps for mmremoted on Linux
------------------------------------------

1. **Install Micetro Agent**:
    
  * Download and extract the Micetro Controller installer package.
  * Run the installer as root:

    .. code-block:: bash
     
      ./install --generic-dns-controller

  * This starts the agent, listening on port ``1337/tcp``

2. **Set up Python environment**:

  * Install Python 3.12 (or >=3.10) and the required modules:

    .. code-block:: bash
     
      pip install python-dotenv requests

3. **Download and Configure the Python Connector Script**:

  * Download the Python connector script: https://raw.githubusercontent.com/menandmice/micetro_docs/latest/scripts/genericDNSPowerDNSP3.zip
  * Extract the zip file to get ``genericDNSPowerDNSP3.py`` and ``ingest_env_vars.py``.
  * Copy both files to:

    .. code-block:: bash

      /var/mmsuite/dns_server_controller

4. **Edit preferences configuration**:

  * Edit ``/var/mmsuite/dns_server_controller/preferences.cfg`` and add the XML tag:

  .. code-block:: bash

    <GenericDNSScript value="/usr/bin/python3.12 /var/mmsuite/dns_server_controller/genericDNSPowerDNSP3.py" />

5. **Create and configure environment variables**:

  * Create a mmremote defaults file (for example, ``/etc/sysconfig/mmremote`` on RHEL) and add the necessary environment variables:

  .. code-block:: bash

    BASE_URL="http://localhost:8081/"             # your PDNS REST API base URL
    SERVER="localhost"                            # the server instance name
    API_KEY="bluecat123"                          # the API secret configured in the PDNS config
    PDNS_DEFAULT_TTL="3600"                       # your DEFAULT TTL value
    LOG_LEVEL="INFO"                              # INFO or DEBUG are supported as log level
    LOG_FILE_NAME="/tmp/mmGenericDNSPowerDNS.log" # log file path

6. **Edit the mmremote service file**:

  * Locate and edit the ``mmremote.service`` file (for example, ``/usr/lib/systemd/system/mmremote.service`` on RHEL).
  * Add the ``EnvironmentFile`` statement pointing to the defaults file:

  .. code-block:: bash

    [Unit]
    Description=Men & Mice DNS Server Controller
    After=syslog.target network.target

    [Service]
    Type=forking
    PIDFile=/var/run/mmremoted/mmremoted.pid
    Environment=USER=root
    Environment=GROUP=root
    Environment=DATA=/var/mmsuite/dns_server_controller
    Environment=PORT=1337
    Environment=LOGLEVEL=3
    EnvironmentFile=/etc/sysconfig/mmremote
    ExecStart=/usr/sbin/mmremoted -u ${USER} -g ${GROUP} -d${DATA} -ll${LOGLEVEL} -p ${PORT}
    KillMode=process

7. **Reload and restart the service**:

  * Reload the systemd daemon and restart the mmremote service:

    .. code-block:: bash

      systemctl daemon-reload
      systemctl restart mmremote

8. **Verify the setup**:

  * Check the log file ``/tmp/mmGenericDNSPowerDNS.log`` for any issues.
  * You can also enable debug mode for more detailed logs.
