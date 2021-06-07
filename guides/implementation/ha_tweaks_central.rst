.. meta::
   :description: Tweaking the High Availability settings for Men&Mice Central
   :keywords: high availability, failover, Men&Mice Central, Micetro 

.. _ha-tweaks-central:

Men&Mice Central HA tweaks
==========================

Changing the default heartbeat timestamp value in Central HA
------------------------------------------------------------

The local time of the cluster member machines are used to update the heartbeat timestamp in the database. It's crucial that the cluster member machines have a synchronized time.

By default the Central instances update the heartbeat timestamp in the database every 10 seconds, as set in the ``/var/mmsuite/mmcentral/preferences.cfg file``:

.. code-block::
  :linenos:

  <HeartbeatInterval value=“10” />

This can be tweaked between values of **5** and **15**.

When a Central instance stops to write the heartbeat timestamp to the DB the *HeartbeatMaxAllowedDowntime* value is used to determine if a failover is done to the next valid Central in the list.
(Valid meaning, in this case, that the next Central application is a HA cluster member and is writing its heartbeat timestamp to the database.)

The default maximum downtime is set for 30 seconds. When the current time [UTC – heartbeat timestamp UTC]  >  [HeartbeatMaxAllowedDowntime] an automatic failover is triggered.

The default maximum downtime can be overwritten in the ``/var/mmsuite/mmcentral/preferences.cfg`` for each Central instance:

.. code-block::
  :linenos:

  <HeartbeatMaxAllowedDowntime value=“30” />

Values between **20** and **120** are allowed, setting the maximum downtime to 20-120 seconds.
