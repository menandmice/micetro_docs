.. meta::
   :description: Enabling content compression in Apache for the Micetro Web Interface
   :keywords: Apache, Micetro, how to 

.. _webapp-compression:

Enable Content Compression for Apache
-------------------------------------

To speed up response time for large operations, add the following line to ``mmws.conf``:

.. code-block::

  AddOutputFilterByType DEFLATE application/json
