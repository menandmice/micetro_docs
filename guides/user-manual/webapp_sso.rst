.. _webapp-sso:

Configure Single Sign-On
========================

The single sign-on feature in the Men&Mice Web Application allows users to sign in to the web using their active directory credentials.

.. note::
  This article assumes that both an Active Directory group has already been added to Micetro **and** Kerberos/NTLM has been added to the preferences file for Men&Mice Web Services.

.. note::
  Please refer to :ref:`external-auth` for help for adding active directory groups to Micetro.

.. note::
  Please refer to :ref:`api-auth` for help adding Kerberos/NTLM to preferences for Men&Mice Web Services.

Configuration
-------------

1. Make sure the user is a member of the Active Directory group already added to Micetro.

2. Log in to the workstation as the user.

  3. Open up Internet Explorer, click the cogwheel and select Internet options.

  4. Under the Security tab, select "Trusted Sites" and open up the "Sites" window.

  5. Enter the URL (i.e. https://ddi.example.com) of the Men&Mice Web Application into the "Add this website to the zone" field and click Add.

  .. note::
    It is necessary to uncheck the "Require server verification for all sides in this zone" if the Men&Mice Web Application is not running on https.

  6. In Internet Options click "Custom Level" to open Security Settings - Trusted Sites Zone.

  7. Make sure that under User Authentication -> Logon "Automatic logon with current username and password" is selected.

8. Open a web browser[1]_ that supports Single Sign-On (SSO) and navigate to the Men&Mice Web Application.

9. Enter the FQDN/IP Address of the Men&Mice Central server.

10. Check the "Log in with Single Sign-on" and click Log In.

.. [1] Single Sign-On is only supported in Internet Explorer and Google Chrome.
