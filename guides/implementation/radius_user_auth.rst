.. meta::
   :description: How to configure RADIUS user authentication
   :keywords: RADIUS, external user authentication, user authentication
   

.. _radius-user-auth:


RADIUS user authentication
==========================
Micetro can authenticate using an external RADIUS server. This is especially useful in large installations, as it eliminates the need for users to maintain their passwords in multiple locations. Any password rules, such as password expiry and minimum password length, that have been applied within the organization automatically apply to Micetro.

RADIUS user authentication vs. local user authentication
--------------------------------------------------------
Even with RADIUS user authentication enabled, you still need to create users and assign them privileges within Micetro. The only difference between RADIUS and local user authentication is in the authentication process: when RADIUS user authentication is enabled, users are authenticated via the RADIUS user authentication system before accessing Micetro.

With RADIUS user authentication, user passwords are not stored within Micetro.

.. note::
  Only one authentication method can be assigned per user, but different users can use different authentication methods. This allows some users to log in using RADIUS user authentication while others utilize local user authentication.

Enabling RADIUS user authentication
-----------------------------------
To enable RADIUS authentication, you need to configure specific properties in the Micetro Central configuration file ``preferences.cfg``. Locate this file in the data folder in the Micetro Central data directory:

* Windows: ``C:\\ProgramData\\Men and Mice\\Central\\preferences.cfg``

* Linux: Set during installation, by default ``/var/mmsuite/mmcentral/preferences.cfg``.

Add the following properties to the configuration file:

.. csv-table::
  :widths: 25, 75

  "RADIUSServer", "Defines the address of the RADIUS server for authentication."
  "RADIUSPort", "Defines the port used by the RADIUS server (default is ``1812``)."
  "RADIUSSharedSecret", "Secret shared between the RADIUS server and Micetro."
  "RADIUSAuthentication", "Type of authentication used (0 for PAP, 1 for CHAP)."

Example configuration:

.. code-block::

  <RADIUSServer value="192.168.1.3"/>
  <RADIUSPort value="1515"/>
  <RADIUSSharedSecret value="MyBigSecret"/>
  <RADIUSAuthentication value="1"/>

After editing the file, restart Micetro Central.

* Windows: Use Powershell or the ``services.msc`` to restart Micetro Central service.

* Linux: Restart the ``mmcentrald`` daemon process, e.g., as root user ``systemctl restart mmcentral``.

Configuring users for RADIUS authentication
-------------------------------------------
To enable user login in Micetro, users must exist in the Micetro user database. Without existing records in this database, users cannot log in, even with valid credentials in the RADIUS login system.

**To configure a user for RADIUS authentication**:

1. On the :guilabel:`Configuration` tab of the **Admin** page, select :guilabel:`Users` under :guilabel:`Access Management` in the left sidebar.

2. To add a new user, select :guilabel:`Create` in the task bar. Complete the dialog, selecting :guilabel:`RADIUS` from the **Authentication type** dropdown. For more information about how to create users, see :ref:`acl-users`.

3. To modify an existing user, double-click the user's name in the data grid to display the **Edit Properties** dialog box. Select :guilabel:`RADIUS`` from the **Authentication type** dropdown.

.. note::
  When RADIUS authentication is selected, the **Password** and **Email address** fields are disabled, since passwords are not stored in Micetro.

.. image:: ../../images/ad_sso_radius.png
  :width: 60%
  