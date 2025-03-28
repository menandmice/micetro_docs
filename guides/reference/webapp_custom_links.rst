.. _webapp-custom-links:

Custom Links in the Micetro Web Application
===========================================

You can add up to three custom links that show up on the Micetro login page. For example, you might want to add a link to your internal support channel for quick access.

.. image:: ../../images/login-custom-links.png 
    :width: 50%


**To add your custom links**:

1. Open the ``preferences.cfg`` file for Micetro Web Services.

   * Default location on Windows: ``C:\ProgramData\Men and Mice\Web Services\preferences.cfg``

   * Default location on Linux: ``/var/mmsuite/web_services/preferences.cfg``

2. Add the links, in teh following format, to the end of the file: 

   .. code-block::

      <LoginFootnote value="Link Text 1[https://www.example.com/link1],Link Text 2[https://www.example.com/link2],Link Text 3[https://www.example.com/link3]" />

3. Restart the Micetro Web Service to pick up the changes:

   * On Windows: ``mmws.exe`` 

   * On Linux:

   .. code-block:: bash

     systemctl restart mmws

.. note::
   The Micetro Web Service always needs to be restarted after changes to its preferences file.
