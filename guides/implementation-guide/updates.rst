.. _updates:

Update Guide
############

.. note::
  AT&T is running custom installers for Men&Mice Central (that will also update all connected Controllers) and the Web Application. Automatic updates can be used for the Management Console.

System update
*************

To update the system as a whole, follow this process:

1. Download the installer and policy files.
2. Make a backup of the following files:
  * ``/var/mmsuite/mmcentral/scripts/policies.toml``
  * ``/var/mmsuite/mmcentral/scripts/set_policies.py``

3. Run the custom installer (AT&T) to update Men&Mice Central. (Refer to the Installation section for details.) This will also update connected Controllers on DNS servers.
4. If High Availability for Central is configured, follow these steps:
  * Turn off the Central service on each secondary server in the HA cluster.
  * Upgrade the primary server manually, using the installer package.
  * Upgrade each secondary server manually using the installer. After each instance is upgraded, the services will be automatically restarted.
  * Log in to the Management console and verify the upgrades were successful and all secondary servers are available.

.. note::
  Updating the primary Central will update any connected Men&Mice Controllers in the system.

5. If High Availability for PosgreSQL is configured, follow these steps:
6. Run the custom installer for the Web Application for each web server:

.. code-block:: bash

  ./install --web-virtual-host-domain web-application.domain.tld

(Where web-application.domain.tld is the FQDN of the server running the Web Application.)

7. Replace the following files with the backup copies:
  * ``/var/mmsuite/mmcentral/scripts/policies.toml``
  * ``/var/mmsuite/mmcentral/scripts/set_policies.py``

.. note::
  Men&Mice recommends to refresh DNS servers with data from production, either before or after performing the upgrades.

Verifying the updates
*********************

In order to verify that the update has propagated to all servers:

1.	Log in to the Management Console
2.	Navigate to :guilabel:`Tools --> Update Status`
3.	Review the version reported for each of the listed components. The listed version number for the Men&Mice Suite is listed near the top, and should match the version of each component in the list.
4.	Log in to the Web Application, click on the :guilabel:`User` icon in the top menu. Verify that the version listed there matches the version of the Men&Mice Central that was installed.

.. note::
  If there’s a version mismatch between components, the Management Console and Web Application will report an error when trying to log in. 
