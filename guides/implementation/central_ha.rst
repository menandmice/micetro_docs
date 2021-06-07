.. meta::
   :description: Configuring High Availability for Micetro's server component
   :keywords: high availability, failover, Micetro

.. _central-ha:

Configure High Availability for Men&Mice Central
================================================

Failover instances of Men&Mice Central can be configured to build a high availability cluster.

.. note::
  To run Micetro in High Availability mode you must be using the MSSQL or PostgreSQL database backend for Micetro. High Availability mode is not available for other database types.

  High Availability is also available for the database backend, see :ref:`psql-ha` and :ref:`mssql-ha` for more information.

.. note::
  For fine-tuning the settings for the Central High Availability cluster, see :ref:`ha-tweaks-central`.

.. _central-ha-unix:

Linux
-----

1. On the existing (or designated as *primary*) server running Central, edit the preferences file in ``/var/mmsuite/mmcentral/preferences.cfg``, adding

.. code-block::
  :linenos:

  <ClusterMemberName value="somename"/>

to the end of the file. ``somename`` is the unique name that will identify the Central instance in the high availability cluster. (E.g. "1", “primary”, or "central1")

2. Restart the primary Central application:

.. code-block:: bash

  systemctl restart mmcentral

3. Login to the Management Console as "administrator" and go to :menuselection:`Tools --> Manage High availability`. (The menu item is only available for the administrator account(s).)
Click the :guilabel:`Add` button and enter the name used in the first step. Set the priority to **10**.

4. Restart Central:

.. code-block:: bash

  systemctl restart mmcentral

5. Login to the Management Console and verify that the current server is running with state "Active" in the :menuselection:`Tools --> Manage high availability` panel.

6. Click the :guilabel:`Add` button, and add a second server that’ll act as a high availability failover for the Central cluster. Same as previously, a unique name (e.g. "central2") is required. Set priority to **20**, and click OK.

.. image:: ../../images/console_ha.png
  :width: 70%
  :align: center

7. On the just added secondary server, install the Men&Mice Central application. If it’s already installed, make sure it’s stopped by using (as root):

.. code-block:: bash

  systemctl stop mmcentral
  systemctl status mmcentral

8. Copy the ``/var/mmsuite/mmcentral/preferences.cfg`` file from the first server to the second, and change the ``ClusterMemberName`` value to match the one set in step 6 (i.e. "central2"). Save the file and exit.

9. Start Central on the secondary server:

.. code-block:: bash

  systemctl start mmcentral

10. Verify that you now have 2 servers, one primary, one secondary in :menuselection:`Tools --> Manage High availability`.

11. Create a round robin DNS name for the high availability setup, i.e. two A records with the same name, but each with the IP address of the primary and secondary server respectively.

12. Log in to the Management Console using the domain name set in the DNS as the server name to verify the high availability cluster is set up properly.

.. note::
  Repeat these steps for each high availability failover you’d like to add. The priority for each failover member should be unique and higher than the primary.

Proceed to :ref:`install-controllers`.

.. _central-ha-windows:

Windows
-------

1. In the existing (or designated as *primary*) server running Central, edit the preferences file ``preferences.cfg``, adding

.. code-block::
  :linenos:

  <ClusterMemberName value="somename"/>

to the end of the file. ``somename`` is the unique name that will identify the Central instance in the high availability cluster. (E.g. "1", “primary”, or "central1")

2. Restart the primary Central application from the command line:

.. code-block:: bash

  mmcentral –stop
  mmcentral –start

3. Login to the Management Console as "administrator" and go to :menuselection:`Tools --> Manage High availability`. (The menu item is only available for the administrator account(s).) Click the :guilabel:`Add` button and enter the name used in the first step. Set the priority to **10**.

4. Restart the Central application from the command line:

.. code-block:: bash

  mmcentral –stop
  mmcentral –start

5. Login to the Management Console and verify that the current server is running with state "Active" in the :menuselection:`Tools --> Manage high availability` panel.

6. Click the :guilabel:`Add` button, and add a second server that’ll act as a high availability failover for the Central cluster. Same as previously, a unique name (e.g. "central2") is required. Set priority to **20**, and click OK.

.. image:: ../../images/console_ha.png
  :width: 70%
  :align: center

7. On the just added secondary server, install the Men&Mice Central application. If it’s already installed, make sure it’s stopped:

.. code-block:: bash

  mmcentral –stop

8. Copy the ``preferences.cfg`` file from the first server to the second, and change the ``ClusterMemberName`` value to match the one set in step 6 (i.e. "central2"). Save the file and exit.

9. Start Central on the secondary server:

.. code-block:: bash

  mmcentral –start

10. Verify that you now have 2 servers, one primary, one secondary in :menuselection:`Tools --> Manage High availability`.

11. Create a round robin DNS name for the high availability setup, i.e. two A records with the same name, but each with the IP address of the primary and secondary server respectively.

12. Log in to the Management Console using the domain name set in the DNS as the server name to verify the high availability cluster is set up properly.

.. note::
  Repeat these steps for each high availability failover you’d like to add. The priority for each failover member should be unique and higher than the primary.

Proceed to :ref:`install-controllers`.

.. _update-central-ha:

Updating Central in High Availability setup
-------------------------------------------

.. warning::
  The Automatic Update feature cannot be used when the Central service is in High Availability setup

The procedure for updating the Central servers in High Availability is as follows:

1. Turn off the Central service on each secondary server

2. Upgrade the primary server manually using an installer. An installer can be downloaded from https://download.menandmice.com/

3. Upgrade each secondary server manually using an installer. After the upgrade finished successfully, the service will be started again.

4. Now, both servers should be upgraded and again in High Availability mode.
