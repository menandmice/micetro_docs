.. meta::
   :description: How to configure Active directroy user authentication
   :keywords: Active directory, Windows active directory, external user authentication, user authentication
   

.. _ad-user-auth:

Configuring Active Directory user authentication
================================================

The Active Directory (AD) user authentication feature enables users to authenticate themselves through the AD login system before gaining access to Micetro. This functionality is particularly useful in large installations, streamlining password management by eliminating the need for users to maintain passwords across multiple platforms. Any password rules (such as password expiry and minimum password length) that have been applied within the organization will automatically apply to Micetro.

Active Directory user authentication vs. local user authentication
------------------------------------------------------------------
Even with AD user authentication enabled, you must create users and assign privileges to them in Micetro. The only difference between AD and local user authentication is in the authentication process: when AD user authentication is enabled, users are authenticated via the AD user authentication system before accessing Micetro. With AD user authentication, user passwords are not stored within Micetro.

.. note::
  Only one authentication method can be assigned per user, but different users can use different authentication methods. This allows some users to log in using AD user authentication while others utilize local user authentication.

Enabling AD user authentication using Active Directory
------------------------------------------------------
AD user authentication using Active Directory is only possible when you run Micetro Central on a Windows machine. The machine running Micetro Central must be a member in an Active Directory domain or forest.
No specific configuration of Micetro Central is needed for user authentication using Active Directory.

Configuring users for AD authentication
---------------------------------------
To enable a user to log into Micetro, that user must exist in the Micetro user database. Without existing records in this database, users cannot log in, even with valid credentials in the AD login system.

**To configure a user for AD user authentication**:

1. Navigate to :menuselection:`Admin --> Configuration` and select :guilabel:`Users` in the leftmost sidebar.

2. To add a new user, select :guilabel:`Create` in the task bar. Enter the user information into the dialog box, selecting :guilabel:`Active Directory` from the **Authentication type** dropdown. For more information about how to create users, refer to :ref:`acl-users`.

  .. note::
    If Micetro Central is not running on a Windows machine, only the Micetro authentication method will be available. 

3. To modify an existing user, double-click the user's name to display the **Edit Properties** dialog box and select :guilabel:`Active Directory` from the **Authentication type** dropdown.

  .. note::
    When the AD authentication method is selected, the **Password** and **Email address** fields are disabled, since passwords are not stored in Micetro.


  .. image:: ../../images/ad-sso.png
    :width: 60%


Active Directory single sign-on
-------------------------------
You can enable a single sign-on so that Active Directory users do not have to authenticate when logging in through Micetro.

**To enable Active Directory single sign-on**:

1. Navigate to :menuselection:`Admin --> Configuration`.

2. In the leftmost sidebar, select :guilabel:`Authentication` under :guilabel:`System Settings`.

3. Select the :guilabel:`Allow single sign-on` checkbox to enable single sign-on.

4. Select :guilabel:`Save`.

..
  .. _disable-kernel-mode-auth:
  Disabling Kernel Mode Authentication
  """"""""""""""""""""""""""""""""""""
  The Windows Authentication in IIS has by default the Kernel Mode Authentication enabled, which blocks the SSO.
  In the IIS Management Console, go to :menuselection:`Windows Authentication --> advanced settings` and set the "Kernel Mode Authentication" to *disabled*.


Application login
-----------------
When utilizing AD user authentication without enabling single sign-on, the login process in Micetro remains unchanged. It's essential to ensure that the entered username matches the stored username in Micetro. If a distinguished username is used, it must be entered identically when logging in.

Group-level Active Directory user authentication
------------------------------------------------
The group-level AD user authentication mechanism enables you to define user access privileges based on group membership within the AD structure. 
To grant a user access to Micetro, you need to create a group in Active Directory with a name that matches a group in Micetro and assign the AD user to that group. Multiple groups can be created in Active Directory to match group names in Micetro.

Login process for users with group-level AD authentication:

1. The user enters their username and password in Micetro.

2. Micetro verifies the credentials using the AD authentication mechanism. Upon successful validation, Micetro retrieves the user's group memberships from AD.

3. Micetro compares the user's AD group list (by group name) with the local group list in Micetro. If a match is found, the user is granted access with the privileges specified in the corresponding local group. If no match is found, the login attempt fails.


Configuring groups for AD group-level authentication
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
When using AD group-level authentication, you need to specify the Micetro groups that should be used for verifying group membership.

1. Navigate to :menuselection:`Admin --> Configuration`.

2. In the leftmost sidebar, select :guilabel:`Groups` under :guilabel:`Access Management`.

3. In the grid, double-click the group for which you want to configure AD. If the desired group is not listed, you need to add it. For more information about how to create groups, refer to :ref:`acl-groups`.

4. Make sure the group name includes the owning domain name as a prefix. For example, if the Active Directory domain is "MYDOMAIN" and contains the group "MM-ReadOnly", the group name should be "MYDOMAIN\MM-ReadOnly".

  .. image:: ../../images/ad-groups-auth.png
    :width: 60%
  

5. Select :guilabel:`Save`.

.. note::
  Group-level Active Directory user authentication is only supported when Micetro Central is running on a Windows machine that is a member of an Active Directory domain or forest.

Configuring users and access privileges
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
With group-level AD authentication, there's no need to create users in Micetro. Instead, user access is determined by their group membership within the AD.
