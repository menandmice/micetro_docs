.. _legacy-access-control-example:

[LEGACY] Role based access example (pre-10.1)
---------------------------------------------

Introduction
^^^^^^^^^^^^

Micetro allows granular access control to objects. Starting with version 6.7 of Micetro/Men&Mice Suite beside *Users* and *Groups* also **Roles** can be configured.

An advantage of Roles is the ability to add groups to roles, which makes the user/group/role concept more flexible. This article will provide some info on roles and a step by step list on how to setup a read only role for DNS/DHCP and IP address ranges.

Built-in roles
^^^^^^^^^^^^^^

By default Micetro has 5 roles built-in:

* Administrators (built-in)

* DNS Administrators (built-in)

* DHCP Administrators (built-in)

* IPAM Administrators (built-in)

* User Administrators (built-in)

All roles are Administrator roles (full access) and all objects like DNS server, DNS zone, IP address range/scope have these roles assigned by default.

.. note::
  The access settings for the built-in roles can't be modified.

If you would add a user or group for instance to the Administrators (built-in) role, the user or group members would get automatically administrative access to the objects in Micetro. Excluded is the "License Management", which can only be accessed by the account with the name "administrator".

For details on the built-in roles please see :ref:`access-control`.

User defined roles
^^^^^^^^^^^^^^^^^^

Beside the built-in roles Micetro administrators have the option to create new roles. These user defined roles can then be used to specify granular access on the objects in Micetro. By adding group members to the role (e.g. Micetro users or AD groups) -  the members get the role defined access granted.

Example read/only role setup and access configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""

As an example the following steps aim to illustrate how easy it is to setup a r/o role in Micetro

1. Login as "administrator" to the Management Console.

2. Navigate to :menuselection:`Tools --> User Management` and select the **Roles** tab.

3. Press the :guilabel:`Add` button and specify the role name, e.g. ``ReadOnlyRole`` and confirm with :guilabel:`OK`.

**Add a user account or an AD group to the *ReadOnlyRole*:**

In the same dialog (:menuselection:`Tools --> User Management`) you can configure Users or Groups that can then be assigned as role members.

**Example 1:** *Add an AD Group to the role*

1. If you want to add an AD group just click on the :guilabel:`Groups` tab.

2. Press the :guilabel:`Add` button and specify the AD group (which must already exist in AD). The group name must be in the style: ``domain\groupname``.

3. Then tick the checkbox **ReadOnlyRole** in the *Roles* section and mark also the checkbox **Active Diretory Integrated** which is located underneath the Roles section box.

.. note::
  If you don't mark the checkbox for Active Directory integration the group would be created as Micetro group (members of an AD group are automatically added to Micetro when the AD group members login the first time).

4. Confirm with :guilabel:`OK`. As mentioned it's not necessary to add single AD user accounts.

**Example 2:** *Add a Micetro user account to the role*

1. In the **User Management** dialog click on the :guilabel:`Users` tab.

2. Press the :guilabel:`Add` button and specify the user name, e.g. ``readonlyuser`` and select for the *Authentication* "Men&Mice Internal".

3. Specify a password for the account.

4. In the **Roles** section box tick the checkbox for the **ReadOnlyRole** and confirm with :guilabel:`OK`.

Next, define **how members of the role can access Micetro**.

.. note::
  After step 4 the users still can not view or access objects in Micetro (e.g. zones or ranges).

1. Open the :menuselection:`Tools --> Global Access` dialog.

2. Press the :guilabel:`Add` button and add the ``ReadOnlyRole``

3. Specify the access bits (i.e. set the Allow checkbox) for the following entries:

::

  Access IPAM module
  Access DNS module
  Access DHCP module
  Access to Management Console

4. Confirm with :guilabel:`OK`.

This means that members of the group can access the three modules and they are allowed to log in to Micetro only by the Management Console.

In the next steps the access to the objects, like servers, zones and subnets are configured.

DNS server access config
  1. Right-click on the DNS server that hosts the zone you want to configure to be r/o accessible by the role members.

  2. Select **Access** and press the :guilabel:`Add` button and add the ReadOnlyRole to the list.

  3. Allow only the ``List (or view) DNS server`` access bit and confirm with :guilabel:`OK`.

DNS zone access config
  1. Click on the DNS zone (or mark multiple) and select **Access** and add the ReadOnlyRole.

  2. Give again only ``List (or view) zone`` rights and confirm with :guilabel:`OK`.

IP address range access config
  1. Click on **IP Address Ranges** and then click on the subnet/scope you want to allow to be visible to the members of the ReadOnlyRole. If you want to allow all subnets then you could click on the 0.0.0.0/0 or ::/0 base net and select Access.

  2. As before press the :guilabel:`Add` button and add the ReadOnlyRole to the object.

  3. Allow the ``List (or view) range`` access bit for the role and confirm the dialog with :guilabel:`OK`. If you clicked on the 0.0.0.0/0 or ::/0 you might want to configure inheritance by pressing the button :guilabel:`Apply access inheritance in child ranges`` in the *Access* dialog. This would then configure all subnets of 0.0.0.0/0 or ::/0 to inherit the settings of the base network.

  If scopes were in the list of selected subnets you want also to configure the access to the DHCP servers (otherwise the scopes would not show up for the role members).

    1. Please right-click on the DHCP server(s) and select **Access** and add the ReadOnlyRole and give the ``List (or view) DHCP server`` access bit and confirm with :guilabel:`OK`.

After these steps the members of the group or the user are allowed to login by the Men&Mice Management console.

To grant read/write rights just create a new specific role and specify additional access bit on the objects, e.g. additionally to the List (or view) access bit also give on zones "Edit other records" and on an IP address range "Use IP addresses in DNS". This would then allow the role members to edit records in the zone which are not in the zones apex (have not the same name as the zone itself, like the SOA record or NS records) and
it would restrict A/AAAA records to the allowed subnets where the Use IP addresses in DNS is specified.
