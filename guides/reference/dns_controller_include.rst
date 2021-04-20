.. _dns-controller-include:

Men&Mice DNS Server Controller and $INCLUDE Directives
========================================================

BIND supports several extensions to the standard zone file format, known as directives or control statements; all directives start with ``$``. With one exception, the ``$TTL`` directive, Micetro doesn’t display these directives in the zone window.

Instead, when directives other than ``$TTL`` are present, the Management Console zone window displays an extra button in the button bar, on the right end. This button, labeled :guilabel:`Zone control statements`, brings up a window showing all of these statements in raw form. The Management Console does not allow these statements to be edited; instead, all editing of such statements must be done by editing the zone file directly, on the server.

The $INCLUDE directive
----------------------

This directive tells named to load the contents of another file as part of the zone, using the current origin and default TTL. Unfortunately, they often cause problems with Men&Mice Suite.

``$INCLUDE`` statements are usually present only if they were present before the DNS Server Controller was installed, since Men&Mice Management Console doesn't provide a way to create them. The Men&Mice DNS Server Controller installer doesn't parse all of the zone files during installation, so it's not aware of ``$INCLUDE`` directives; therefore, they usually get left behind in the old copy of the data directory (which is renamed to add ".bak" to the end of its name). Furthermore, while most affected users realize this, the common mistake is to copy or move the included file into the same location as the zone file. This is not correct.

Instead, since an included file is usually only specified by name, it must be placed into the root of the data directory tree. For example, if the zone file is in ``/var/named/hosts/masters``, the included file must be placed in ``/var/named``.

Lastly, it's possible to use an include file in a way that, while perfectly valid as far as ``named`` is concerned, makes the zone look invalid to Men&Mice Management Console's syntax check. If the zone's authority NS records and/or SOA record are located in an include file, the Management Console will not allow you to save the file. This can be solved by configuring the DNS Server Controller to (permanently) expand control statements.

Using the $INCLUDE directive with Micetro
----------------------------------------------------

The Men&Mice DNS Server Controller can be configured to expand ``$INCLUDE`` statements, so that you see the entire contents of the zone in the zone window.

.. note::
  If you configure Men&Mice DNS Server Controller to expand ``$INCLUDE`` statements, it will do so globally, for all zones. It will also expand all other control statements (not counting the $TTL directive at the top of each zone). The expansion is permanent, meaning the zone file is actually changed to reflect the effect of the control statement, and the control statement is removed.

To follow these instructions, you'll need to figure out where your named data directory is, which we'll refer to as ``$NAMED``. This can be done by examining ``named.conf``. If you're not sure where ``named.conf`` is, examine your DNS Server Controller (``mmremoted``) command line (in the output of the appropriate ``ps`` command) - it should show the location of ``named.conf`` after ``-c``; if there's a ``-t`` option as well, the ``named.conf`` location will be relative to this chroot jail path. If you don't see either of these options, the location is ``/etc/named.conf``. (And if this sounds like gibberish to you, please contact us for help.)

``named.conf`` contains a set of 5 ``include`` statements, referring to the absolute path of files in ``$NAMED/conf/``. So if your $NAMED directory is ``/var/named``, the include statements will look like this:

.. code-block::
  :linenos:

  include "/var/named/conf/logging";
  include "/var/named/conf/user_before";
  include "/var/named/conf/options";
  include "/var/named/conf/user_after";
  include "/var/named/conf/zones";

Edit the file ``$NAMED/mmsuite/preferences.cfg``. Add the following line:

.. code-block::
  :linenos:

  <ExpandControlStatements value="1"/>

Save the file and restart the DNS Server Controller, using its init script (a file named *mmremoted*, such as ``/etc/init.d/mmremoted``, or ``/Library/StartupItems/mmServerController/mmServerController`` - the location is platform-specific). You can then log in with the Management Console to see the effects of this process.

On Mac OS X, use the following shell commands to complete these instructions:

To edit the file:

.. code-block:: bash

  sudo nano /var/named/mmsuite/preferences.cfg

Within nano, use the keyboard arrow keys to move around, since there's no mouse support. When you're done editing, type control-o to save, followed by the return or enter key to confirm the filename. Then type control-x to exit.

To restart DNS Server Controller:

.. code-block:: bash

  sudo /Library/StartupItems/mmServerController/mmServerController start
