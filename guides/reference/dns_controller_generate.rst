.. meta::
   :description: BIND supports several extensions to the standard zone file format, known as directives or control statements; all directives start with '$'. With one exception, the $TTL directive, Micetro doesn't display these directives in the zone window.
   :keywords: BIND support, Micetro

.. _dns-controller-generate:

Expanding $GENERATE directives into records
===========================================

BIND supports several extensions to the standard zone file format, known as directives or control statements; all directives start with ``$``. With one exception, the ``$TTL`` directive, Micetro doesn't display these directives in the zone window.

Instead, when directives other than ``$TTL`` are present, the Management Console zone window displays an extra button in the button bar, on the right end. This button, labeled :guilabel:`Zone control statements`, brings up a window showing all of these statements in raw form. The Management Console does not allow these statements to be edited; instead, all editing of such statements must be done by editing the zone file directly, on the server.

The $GENERATE directive
-----------------------

This directive is a shorthand way of entering multiple similar records. The directive is a line that looks like this:

.. code-block::

  $GENERATE range template

Where "range" is a numeric range such as "1-254" and "template" is a record template. A record template looks like a normal record (except it doesn't start on the beginning of a line), but in places where a number from the range is desired, a "$" is used as a placeholder.

For example:

.. code-block::

  $GENERATE 1-254 $.0.168.192.in-addr.arpa. PTR host-$.dsl.example.net.

This would create 254 PTR records, all of similar format, looking like this:

.. code-block::

  1.0.168.192.in-addr.arpa. PTR host-1.dsl.example.net.
  2.0.168.192.in-addr.arpa. PTR host-2.dsl.example.net.
  [...]
  254.0.168.192.in-addr.arpa. PTR host-254.dsl.example.net.

Of course, while these records are generated by named when the zone is loaded, you won't see them in the zone file. All you'll see is the ``$GENERATE`` directive.

Using the $GENERATE directive with Micetro
-----------------------------------------------------

The Micetro DNS agent can be configured to expand ``$GENERATE`` statements, so that you see the records thus generated in the zone window. These will be ordinary records, so you can edit them freely.

.. note::
  If you configure Micetro DNS agent to expand ``$GENERATE`` statements, it will do so globally, for all zones. It will also expand all other control statements (not counting the $TTL directive at the top of each zone). The expansion is permanent, meaning the zone file is actually changed to reflect the effect of the control statement, and the control statement is removed.

To follow these instructions, you'll need to figure out where your named data directory is, which we'll refer to as ``$NAMED``. This can be done by examining ``named.conf``. If you're not sure where ``named.conf`` is, examine your DNS agent (``mmremoted``) command line (in the output of the appropriate ``ps`` command) - it should show the location of ``named.conf`` after ``-c``; if there's a ``-t`` option as well, the ``named.conf`` location will be relative to this chroot jail path. If you don't see either of these options, the location is ``/etc/named.conf``. (And if this sounds like gibberish to you, please contact us for help.)

``named.conf`` contains a set of 5 ``include`` statements, referring to the absolute path of files in ``$NAMED/conf/``. So if your ``$NAMED`` directory is ``/var/named``, the include statements will look like this:

.. code-block::

  include "/var/named/conf/logging";
  include "/var/named/conf/user_before";
  include "/var/named/conf/options";
  include "/var/named/conf/user_after";
  include "/var/named/conf/zones";

Edit the file $NAMED/mmsuite/preferences.cfg. Add the following line:

.. code-block::

  <ExpandControlStatements value="1"/>

Save the file and restart the DNS agent, using its init script (a file named *mmremoted*, such as ``/etc/init.d/mmremoted``, or ``/Library/StartupItems/mmServerController/mmServerController`` - the location is platform-specific). You can then log in with the Management Console to see the effects of this process.

On Mac OS X, use the following shell commands to complete these instructions:

To edit the file:

.. code-block:: bash

  sudo nano /var/named/mmsuite/preferences.cfg

Within nano, use the keyboard arrow keys to move around, since there's no mouse support. When you're done editing, type control-o to save, followed by the return or enter key to confirm the filename. Then type control-x to exit.

To restart DNS agent:

.. code-block:: bash

  sudo /Library/StartupItems/mmServerController/mmServerController start
