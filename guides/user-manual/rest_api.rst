.. meta::
   :description: The introduction to REST API for Micetro by Men&Mice
   :keywords: Rest API, Micetro

.. _rest-api:

Micetro REST API
----------------
With the Micetro REST API administrators and software developers can create custom scripts and applications on top of Micetro to manage DNS, DHCP, and IP address infrastructures of all sizes. Most features available in Micetro are available through the REST API.

Installation
^^^^^^^^^^^^
To use the REST API, you must install the Men&Mice Web Services and make sure you have the correct access permission. For more information about installing the application, see :ref:`install-webapp`.

All APIs are bundled together in the installation of the Web Services. Once the Men&Mice Web Services is installed, you can access the API documentation via:

``http(s)://<micetro.yourdomain.tld>/mmws/api/doc``

.. tip::
   The online REST API documentation can also be viewed on `api.menandmice.com <http://api.menandmice.com/>`_.

Getting Started
^^^^^^^^^^^^^^^
In REST, the focus is on resources. You specify a resource with a URL (Uniform Resource Location) and then apply an operation on the resource using an HTTP method.

The four most common HTTP methods are GET, PUT, POST, and DELETE.

   * ``GET`` – Retrieves resources
   * ``PUT`` – Modifies an existing resource
   * ``POST`` – Creates a new resource
   * ``DELETE`` – Delete a resource

An example of a resource would be a DNS zone, defined in our REST API as ``dnsZones``. The combination of URL and HTTP method to retrieve all DNS zones in Micetro would be:

.. code-block::

   GET http(s)://<micetro.yourdomain.tld>/mmws/api/dnsZones

A successful response looks like this:

.. code-block::

   { 
    "result": {
        "dnsZones": [
            {
                "ref": "dnsZones/39404",
                "name": "bobo.is.",
                "dynamic": false,
                "adIntegrated": false,
                "dnsViewRef": "dnsViews/143",
                "sourceZoneRef": "dnsZones/39404",
                "authority": "bs-win-2.dev.lab.",
                "type": "Master",
                "dnssecSigned": false,
                "kskIDs": "",
                "zskIDs": "",
                "customProperties": {
                    "Location": "H-15",
                    "Outward facing": "0",
                },
                "created": "May 19, 2023 13:29:15",
                "lastModified": "May 19, 2023 13:29:16",
                "displayName": "bobo.is."
            }
        ],
        "totalResults": 1
     }
  }

   
References
^^^^^^^^^^
Each resource has its own unique identifier. These identifiers can be used to apply operations to a specific object. The format is ``<resource>/<ID number>``. The ID number is a unique number for each resource type.

Building on top of our previous example, let's retrieve a specific zone using its unique identifier.

.. code-block::

   GET http(s)://<micetro.yourdomain.tld>/mmws/api/dnsZones/dnsZones/1
   
.. tip::

   Unique identifiers can also be substituted for names as long as they are unique in the system. If a unique name is used instead of an identifier, Micetro will look up the identifier for the user. ``GET http(s)://<micetro.yourdomain.tld>/mmws/api/dnsZones/test.menandmice.com``.

Arguments
^^^^^^^^^^
The Micetro REST API offers a range of arguments that can be included in either the URL or the body of an HTTP request. Regardless of the resource being accessed, several arguments are always available:

* ``server`` – the name or address of the Micetro Central server that you want to communicate with.
* ``loginName`` – the username of the user attempting to authenticate.
* ``password`` – the password of the user attempting to authenticate.
* ``session`` – the unique ID of a valid user session.
* ``pretty`` – if set to 'true', the API returns  data in a more readable format.

These arguments are all optional. By default, the API assumes that the Micetro Central instance is located on the same machine as the Web Services, which is usually the case. In addition to these arguments, the Micetro REST API also supports other authentication mechanisms, such as Basic Authentication, Windows NTLM, and Kerberos.

Filtering and Sorting Arguments
"""""""""""""""""""""""""""""""
When using the GET operations in the Micetro REST API, you can take advantage of powerful arguments to filter, sort, or limit the results returned.

* ``filter`` – specifies the criteria to use when filtering results.
* ``offset`` – specifies the starting point for returning a list of values
* ``limit`` – specifies the maximum number of entries to include when returning a list of values.
* ``sortBy`` – specifies the field to use when sorting values.
* ``sortOrder`` – specifies whether to sort in ascending or descending order.

Here are some examples of how to use these arguments:

To get all zones with a name starting with ``test.menandmice``.

.. code-block::

   GET http(s)://<micetro.yourdomain.tld>/mmws/api/dnsZones?filter=name=^test.menandmice

To get all zones sorted alphabetically by name:

.. code-block::

   GET http(s)://<micetro.yourdomain.tld>/mmws/api/dnsZones?sortBy=name&sortOrder=descending

To get the first 50 zones in the system in reverse order:

.. code-block::

   GET http(s)://<micetro.yourdomain.tld>/mmws/api/dnsZones?sortBy=name&sortOrder=descending&limit=50

For a more detailed explanation of filtering and sorting in the Micetro REST API, see our `REST API whitepaper <https://www.menandmice.com/resources/whitepapers/rest-api>`_.

Creation, Modification, and Deletion Arguments
""""""""""""""""""""""""""""""""""""""""""""""
Creating, modifying and deleting resources require the use of other HTTP methods, such as POST, PUT, and DELETE. These operations typically require more information than other API calls, and the data can be passed either in the URL or in the body of the HTTP request.

For example, to add a DNS record to a zone, you can use the following URL:

.. code-block::

   POST http(s)://<micetro.yourdomain.tld>/mmws/api/dnsZones/test.menandmice.com./dnsRecords?dnsRecord={“name”:”name”, “type”: “A”, “data”: “1.2.3.4”}

To modify the newly created DNS record, you can use the following URL:

.. code-block::

   PUT http(s)://<micetro.yourdomain.tld>/mmws/api/dnsRecords/name.test.menandmice.com./?properties={"data":"2.3.4.5"}

To delete the DNS record, you can use the following URL:

.. code-block::

   DELETE http(s)://<micetro.yourdomain.tld>/mmws/api/dnsRecords/name.test.menandmice.com.

.. note::
   For more complex objects, it's recommended to provide the data in the body of the HTTP request rather than in the URL.
   
.. tip::
   The API definition can be downloaded from the Web Services and then imported into a 3rd party API development tool such as Postman. To retrieve the API definition in JSON form, navigate to the url ``http(s)://micetro.yourdomain.tld/mmws/api/swagger.json``.
