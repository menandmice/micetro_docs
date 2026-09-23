.. meta::
   :description: Tweaking the High Availability settings for Micetro Central
   :keywords: high availability, failover, Micetro Central, Micetro 

.. _ha-tweaks-central:

Micetro Central HA Tweaks
==========================

The local time of the cluster member machines are used to update the heartbeat timestamp in the database. It's crucial that the cluster member machines have a synchronized time.

By default, the Central instances update the heartbeat timestamp in the database every 10 seconds, as set in the ``/var/mmsuite/mmcentral/preferences.cfg`` file:

.. code-block::

  <HeartbeatInterval value="10" />

You can adjust the heartbeat timestamp to any value between **5** and **15**.

When a Central instance stops writing the heartbeat timestamp to the database, the ``HeartbeatMaxAllowedDowntime`` value is used to determine if a failover is done to the next valid Central in the list—valid meaning that, in this case, the next Central instance is an HA cluster member and is writing its heartbeat timestamp to the database.

The default maximum downtime is set for 30 seconds. When the current time [UTC – heartbeat timestamp UTC]  >  [HeartbeatMaxAllowedDowntime], an automatic failover is initiated. You can overwrite the default maximum downtime in the ``/var/mmsuite/mmcentral/preferences.cfg`` for each Central instance by adding the following XML tag:

.. code-block::

  <HeartbeatMaxAllowedDowntime value="30" />

You can set the default maximum value to any values between **20** and **3600** seconds.
