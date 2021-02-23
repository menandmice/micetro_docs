.. _central-psql:

Connect Central to the primary PostgreSQL database
--------------------------------------------------

Edit the configuration file for Men&Mice Central:

.. code-block:: bash

  nano /var/mmsuite/mmcentral/preferences.cfg

Find (or create) and set the following values:

.. code-block::
  :linenos:

  <database value="postgresql"/>
  <databaseserver value="HOSTNAME@DATABASE"/>
  <databaseusername value="USERNAME" />
  <databasepassword value="plaintext:PASSWORD" />

Where

* ``HOSTNAME`` and ``DATABASE``: the server’s hostname running the PostgreSQL service, and the system user on the server
* ``USERNAME``: the user with permissions to read and write the PostgreSQL database
* ``PASSWORD``: the database user’s password

.. note::
  Once Central starts and reads the configuration file, it’ll automatically change the plaintext password to hashed, to increase security.

Restart Central and verify it’s running:

.. code-block:: bash

  systemctl restart mmcentral
  systemctl status mmcentral

If the database connection fails, the service will fail to start with the appropriate error message.
