.. _disable-auto-zone-transfer:

Disable “Automatic adjustment of Zone Transfer”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By default, the Men&Mice Suite automatically adjusts zone transfer settings for slave zones. This is not a desired behavior for AT&T’s environment, and should be disabled.

1. Log in to the Management Console
2. Navigate to :guilabel:`Tools --> System Settings --> Advanced`.
3. Filter the options with “automatically”, and locate the “*Automatically adjust local zone transfer settings for BIND*” line.
4. **Uncheck** the box to disable.
