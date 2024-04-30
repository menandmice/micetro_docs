.. meta::
   :description: Free trial best practices
   :keywords: free trial, install, setup

.. _free_trial_best_practices:

Free Trial Best Practices
--------------------------

Configure and size your free trial servers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. note::
  If you're installing Micetro in a test environment, your server sizes may be much smaller than what's required from Micetro in a production environment. 
  The following sizes assume you'll keep this version of Micetro in production after testing the free trial.


Micetro may be installed on a Windows or Linux virtual machine on-premises or in the cloud.

CPU Count: 4 Cores

Memory Capacity: 8GB

Disk Space: 50GB

Additional Services Required: Web Services (IIS for Windows Server or Apache 2 Web for Linux Server installation)

Optional Windows Management Console
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Starting with version 10.1 of Micetro, the Windows Management Console was replaced with the Web UI. The Web UI is capable of most functionality and therefore the original Management Console is likely not necessary for your Micetro free trial. It is an optional download with features such as a built-in health dashboard. The Free Trial documentation will not address the management console, but you may check the rest of the documentation for more information on how to configure and use.
  
Active Directory Integration
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Active Directory (AD) integration is not required if you're running Linux along with other non-Windows based DNS and DHCP services. However, if you would like to see how AD integration works with Micetro, Micetro Central must be installed on a Windows Server in your AD domain or forest.

.. note::
  You will need an Active Directory (AD) service account with DNS/DHCP administrative privileges (or read-only if preferable) to set up Micetro DNS/DHCP agents. Micetro works by connecting to your current DNS and DHCP services and pulling that information into a centralized UI where you gain visibility and control.

Micetro supports SSO and MFA with Active Directory, Azure AD, and Okta.

For more information on setting up accounts please see the documentation here.

=======
