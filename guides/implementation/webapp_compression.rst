.. meta::
   :description: Enabling content compression in Apache for the Micetro Web Application
   :keywords: Apache, Micetro, how to 

.. _webapp-compression:

Enable content compression for Apache
-------------------------------------

To speed up response time for large operations, add the following line to ``mmws.conf``:

.. code-block::
  :linenos:

  AddOutputFilterByType DEFLATE application/json
