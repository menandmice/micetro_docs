.. _webapp-custom-links:

Custom links in the web application 
-----------------------------------

You can add up to three custom links that show up on the Micetro login page.

.. image:: ../../images/login-micetro.png 
    :width: 80%
    :align: center 

To add your custom links (for example internal support channel):

1. Open the ``preferences.cfg`` file for Men&Mice Central.

2. To the end of the file, add the links in the following format: 

.. code-block::

    <LoginFootnote value="Link Text 1[https://www.example.com/link1],Link Text 2[https://www.example.com/link2],Link Text 3[https://www.example.com/link3]" />

3. Restart the webserver (IIS or Apache) MMWS to pick up the changes.

.. note::
    The webserver application always needs to be restarted for MMWS to pick up any changes.