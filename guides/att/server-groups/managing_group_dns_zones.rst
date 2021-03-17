.. _managing-group-dns-zones:

Managing DNS zones for a server group
*************************************

In the Inspector, links are provided for the following

* :guilabel:`Create new DNS zone`: displays a dialog to create a new DNS zone, with the staging server for the selected group pre-selected as the authoritative master DNS server.
* :guilabel:`View all DNS zones`: redirects to the main DNS context and displays a list of all DNS zones that reside on the specific staging server for the selected Server Group.
* :guilabel:`Manage advanced options`: opens a dialog that allows the management of advanced BIND options for the specific staging server for the selected Server Group.

Manage advanced options
=======================

.. note::
  The Men&Mice DNS Server Controller relies on the BIND tool ``named-checkconf`` to verify if the BIND configuration file named.conf is valid.

  If the Advanced button is not shown in the interface or says the configuration is read-only, it may be because ``named-checkconf`` is not found on any of the standard directories during installation.
  (Or if the installation is inside a chroot.)

  To fix this, make sure ``named-checkconf`` is executable, and edit the Controller’s configuration file (``/var/named/mmsuite/preferences.cfg``) to include the following lines:

  .. code-block::
    :linenos:

      <fingerprint value="<some-hex-values>"/>
      <named-checkconf value="/usr/sbin/named-checkconf"/>

  And restart the Controller:

  .. code-block:: bash

    systemctl restart mmremote

The advanced server options allow for viewing and modifying the raw BIND configuration.

1. For a selected server group, click on :guilabel:`Manage advanced options`.

2. A dialog is displayed.

3. Select the file of interest.

4. Edit the contents of the configuration file.

5. Click :guilabel:`Save` to save the modifications.

Submitting changes for ``named.conf``
-------------------------------------

Once the necessary changes are made to the config file, click save and you’ll be asked to submit the changes to the request queue.
This is the same process as any other DNS change (see General AT&T Documentation (Part 1 of 3 of the Operations Guide) for details) and you’ll be asked to input the work order number and other details.
