.. meta::
   :description:
   :keywords:

.. _setup-msa:

Setting up a Managed Service Account to run M&M DNS/DHCP Server Controllers
===========================================================================

Managed Service Account was introduced in Windows Server 2008 R2. Managed Service Account is managed domain account that provides the following features to simplify service administration:

* Automatic password management.

* Simplified SPN management, including delegation of management to other administrators. Additional automatic SPN management is available at the Windows Server 2008 R2 domain functional level.

Managed Service Account is good addition to Local Services to run M&M DNS/DHCP Server Controllers. When using MSA you gain managed domain account with isolated privileges to run the application.

Step-by-step guide
------------------

1. If you are running Windows Server 2012 or newer then the first step is to run:

.. code-block::

  Add-KdsRootKey -EffectiveTime ((Get-Date).AddHours(-10))

This is because Manage Service Account feature came with Windows Server 2008. But in Windows Server 2012 a new service called the Key Distribution Service (KDS) came also and needs to be running to create and use Group Manage Service Accounts.

2. Create new ADServiceAccount:

.. code-block::

  New-ADServiceAccount -DNSHostName "yourserver" -Name "name of the service account" -PrincipalsAllowedToRetrieveManagedPassword "here you list your servers ending with '$' and separated with ',' for example: TESTSERVER$, TESTESERVER2$"

3. Install the service account:

.. code-block::

  Install-ADServiceAccount "name of the service account"

4. Add the right authority to the Managed Service Account:

In Server Manager dashboard click on Tools and choose Active Directory Users and Computers. Click on Users, right click on the group to add the Managed Service Account to. For example DNSAdmins or DHCP Admins.

5. Add the Managed Service Account to M&M DNS/DHCP Server Controllers:

Go to Services and locate the M&M controllers, right click on them and choose Properties. In the Properties window click on Log On tab and choose This Account. Fill in the name of the service that was made in step 2. That is DOMAIN\ServiceAccountName ending with '$' sign. Click OK and restart the M&M DNS/DHCP Server Controller.

To remove Managed Service Account from M&M DND/DHCP Server Controllers run cmd and write in the command:

.. code-block::

  sc.exe managedaccount "Men&Mice DNS/DHCP Server Controller" false

Information gathered from this `Microsoft article <https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd548356(v=ws.10)?redirectedfrom=MSDN>`_.
