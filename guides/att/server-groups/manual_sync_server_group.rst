.. _manual-sync-server-group:

Manual sync of server group
===========================

In case the a server group needs to be manually synced, you can set the changes with the following process:

Step 1. Compress the BIND configuration files
---------------------------------------------

SSH into the up-to-date BIND server and compress the BIND server configuration files.

.. code-block:: bash
  :linenos:

  ssh user@bind-server.com
  // in this example we use /usr/local/bind9 and /usr/local/bind,
  // also named.conf is located at /etc/named.conf
  tar -czf syncFiles.tar.gz /usr/local/bind9/ /usr/local/dns/ /etc/named.conf

.. note::
  To locate the directory of the BIND server configuration files, check the directory option in the named.conf configuration file.

Step 2. Send the files to the Group Master
------------------------------------------

The compressed file can be copied to any location in the Group Master server.

.. code-block:: bash

  scp ./syncFiles.tar.gz user@group-master.com:/home/user

.. note::
  The command will copy the file to the user's home directory on the Group Master server, but any other location will suffice.

Step 3. Untar the file on the Group Master
------------------------------------------

Before you untar the config to the correct Group Master delegate, check the currently active delegate in the Server Groups page in the Men&Mice suite.

In the following screenshot, the currently active delegate is marked with a yellow highlight color.

.. image:: ../../images/manual-group-sync-1.png
  :width: 90%
  :align: center

In this case, the Staging server is currently the active Group Master delegate and is located in the Group Master server under the directory /var/mmsuite/dns_server_controller/server_groups/[server-group-name]/staging/.

Log in to the Group Master server and untar the file to the Staging delegate directory.

.. code-block:: bash

  ssh user@group-master.com
  tar -C /var/mmsuite/dns_server_controller/server_groups/[server-group-name]/staging/ -xzf /home/user/syncFiles.tar.gz

Step 4. Prepare and Deploy the Server Group
-------------------------------------------

In the Men&Mice Suite, open the Server Group you are working with:

.. image:: ../../images/manual-group-sync-2.png
  :width: 90%
  :align: center

Prepare and then Deploy the group.

.. image:: ../../images/manual-group-sync-3.png
  :width: 90%
  :align: center

The Server Group Members should all be In Sync along with the relevant Server Group.
