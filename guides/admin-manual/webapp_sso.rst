.. meta::
   :description: How to configure the single sign-on in Micetro 
   :keywords: Active directory

.. _webapp-sso:

Configure Single Sign-On
========================

The single sign-on feature in Micetro allows users to sign in to the web using their active directory credentials.

.. note::
  This article assumes that both an Active Directory group has already been added to Micetro **and** Kerberos/NTLM has been added to the preferences file for Micetro Web Services.

.. note::
  For help adding active directory groups to Micetro, see :ref:`webapp-external-auth`.

.. note::
  For help adding Kerberos/NTLM to preferences for Micetro Web Services, see :ref:`api-auth`.

Configuration
-------------

1. Make sure the user is a member of the Active Directory group already added to Micetro.

2. Log in to the workstation as the user.

3. Open up Internet Explorer, click the settings button and select :guilabel:`Internet options`.

4. On the :guilabel:`Security` tab, select :guilabel:`Trusted Sites` and open up the :guilabel:`Sites` window.

5. Enter the Micetro URL (https://micetro.example.com) into the **Add this website to the zone** field, and then click :guilabel:`Add`.

   .. note::
      It is necessary to clear the :guilabel:`Require server verification for all sides in this zone` checkbox if Micetro is not running on https.

6. In Internet Options, click :guilabel:`Custom Level` to open :menuselection:`Security Settings --> Trusted Sites Zone`.

7. Make sure that under :menuselection:`User Authentication --> Logon` the :guilabel:`Automatic logon with current username and password` is selected.

8. Open a web browser [1]_ that supports Single Sign-On (SSO) and navigate to Micetro.

9. Enter the FQDN/IP Address of the Micetro Central server.

10. Select :guilabel:`Log in with Single Sign-on`, and then click :guilabel:`Log In`.

.. [1] Single Sign-On is only supported in Google Chrome.
