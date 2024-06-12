.. meta::
   :description: The introduction to JSON-RPC API for Micetro
   :keywords: Json-rpc API, Micetro

.. _json-rpc:

JSON-RPC API for Micetro
========================
.. note:: 
   Even though Micetro supports a number of different APIs, our primary focus is the REST API. Therefore, we recommend using the Micetro REST API whenever possible. For more information about the Micetro REST API, see :ref:`rest-api`.
   
Micetro has a JSON-RPC API, which grants access to all the various resources and information within the system. All APIs are included in the installation of the Web Services. 

The JSON-RPC API supports the same operations as the SOAP API. A complete list of the operations supported by each version of Micetro is available at https://api.menandmice.com. The Micetro JSON-RPC API follows the `JSON-RPC 2.0 specification <https://www.jsonrpc.org/specification/>`_.

Getting Started
----------------
Using the JSON-RPC API offers several advantages over the SOAP API, which it mirrors. The primary benefit lies in the use of JSON packets, which are more human-readable and less error-prone compared to XML. Additionally, JSON packets are smaller in size, making them more efficient for transportation.

Below is the format for JSON-RPC requests and responses:

* Both requests and responses start with the ``jsonrpc property``, which should always have the value ``"2.0"``.
* Requests have two additional properties, **method** which specifies the exact name of the operation to be invoked and * **params** which contains all the parameters needed to complete the operation.

Example Request:

.. code-block::

   {
      "jsonrpc": "2.0",
      "method": "<methodName>",
      "params": "<params>"
   }

Example Response:

.. code-block::

   {
      "jsonrpc": "2.0",
      "result": "<result>"
   }


Tools and API Clients
---------------------
Popular scripting languages, such as Python, PowerShell, and Ruby, are excellent tools for working with the Micetro JSON-RPC API.

Two specific tools have been developed to streamline interactions with the JSON-RPC API:

* **Python Module**: This lightweight module simplifies session handling and data conversion from dictionaries to JSON requests. You can access the Python module `here <https://download.menandmice.com/misc/mmJSONClient-1.0.0.tar.gz/>`_.

* **PowerShell Script**: This script is designed to create a robust API client for the JSON-RPC API, providing an efficient and flexible way to interact with the service. You can access the PowerShell script `here <https://download.menandmice.com/misc/mmWSClient.ps1/>`_.


Connecting and Interactive API Clients
--------------------------------------
Both tools, ``mmJSONClient`` and ``mmWSClient``, support an interactive API client mode. This is an excellent way to get familiar with the API commands, their parameters, and response data formats.

mmJSONClient
^^^^^^^^^^^^
To use ``mmJSONClient`` in an interactive Python session:

1. Open a terminal window and start a Python session.
2. Import the ``mmJSONClient`` module and create a client object to connect to and interact with the API:

   .. code-block::

      $ python
      >>> import mmJSONClient
      >>> client = mmJSONClient.JSONClient()

3. Authenticate and open a session with the desired Micetro Central instance using the ``Login`` command, which requires at least three arguments:

   * ``server``: Name or address of the Micetro Central server.
   * ``username``: Username for authentication.
   * ``password``: Password for authentication.

These arguments are optional, as the API assumes the Micetro Central instance is located on the same machine as the Web Services by default. The API also supports other authentication mechanisms like Basic Authentication, Windows NTLM, and Kerberos.

.. code-block::

   >>> client.Login(server='central.demo', username='a_user', password='secret')
  
The response from the Micetro Central will include the session ID for the newly opened session. This session ID can be used as a substitute for the user's login credentials.

.. code-block::

    >>> print(client.sessionid)
   VFr79UQMhFfOq4Q8l0Qi  # Session IDs are randomly generated

The session ID is automatically handled by the module for subsequent API commands. For example, to list all DNS zones:

.. code-block::

   >>> print(client.GetDNSZones())

mmWSClient
^^^^^^^^^^
To use ``mmWSClient`` in a PowerShell session:

1. Open a PowerShell terminal window and navigate to the location of the ``mmWSClient.ps1`` script.
2. Execute the script with the necessary arguments for authentication:

   * ``mmWSUri``: Path of the mmWS endpoint (typically ``<web-server-path>/mmws``).
   * ``centralServer``: Location of the central server (only needed if different from ``mmWS``).
   * ``username``: Username for authentication.
   * ``password``: Password for authentication.

     .. code-block::

      > .\mmWSClient.ps1 -mmWSUri http://central-web.demo/mmws -centralServer central.demo -username a.user -password secret

These arguments are optional, as the API assumes the Micetro Central instance is located on the same machine as the Web Services by default. The API also supports other authentication mechanisms like Basic Authentication, Windows NTLM, and Kerberos.

References
^^^^^^^^^^
Each resource has a unique identifier used to apply operations to a specific object. The format is ``<resource>/<ID number>``. For example, to retrieve a specific zone using its unique identifier:

.. code-block::

  >>> print(client.GetDNSZone(dnsZoneRef='dnsZones/18'))
 
 {
      'dnsZone': {
         'ref': '{#4-#1}', 
         'name': 'bibi.com.', 
         'dynamic': False, 
         'adIntegrated': False, 
         'dnsViewRef': '{#5-#5}', 
         'sourceZoneRef': '{#4-#1}', 
         'authority': 'bdds.test.com.', 
         'type': 'Master', 
         'dnssecSigned': False, 
         'kskIDs': '', 
         'zskIDs': '', 
         'customProperties': [], 
         'created': 'Jun 26, 2023 12:40:37', 
         'lastModified': 'Jun 26, 2023 12:40:37', 
         'displayName': 'bibi.com.'
      }
  }

Unique names can also be used instead of identifiers if they are unique within the system:

.. code-block::

   >>> print(client.GetDNSZone(dnsZoneRef='test.menandmice.com.'))

   {
      'dnsZone': {
         'ref': '{#4-#64}', 
         'name': 'test.menandmice.com.', 
         'dynamic': False, 
         'adIntegrated': False, 
         'dnsViewRef': '{#5-#5}', 
         'sourceZoneRef': '{#4-#64}', 
         'authority': 'bdds.test.com.', 
         'type': 'Master', 
         'dnssecSigned': False, 
         'kskIDs': '', 
         'zskIDs': '', 
         'customProperties': [], 
         'created': 'Jul 3, 2023 22:35:43', 
         'lastModified': 'Juln 3, 2023 22:35:43', 
         'displayName': 'testmenandmice.com.'
      }
  }

Filtering and Sorting
^^^^^^^^^^^^^^^^^^^^^^
Micetro's API supports powerful arguments for filtering, sorting, and limiting results:

* ``filter``: Criteria to filter results.
* ``offset``: Offset to use when returning a list of values.
* ``limit``: Maximum number of entries to return.
* ``sortBy``: Field to sort values by.
* ``sortOrder``: Specifies ascending or descending order.

Examples:

1. Get all zones with a name starting with ``test.menandmice``:

   .. code-block::

      >>> print(client.GetDNSZones(filter='name=^test.menandmice'))

      {
         'dnsZone': {
            'ref': '{#4-#64}', 
            'name': 'test.menandmice.com.', 
            'dynamic': False, 
            'adIntegrated': False, 
            'dnsViewRef': '{#5-#5}', 
            'sourceZoneRef': '{#4-#64}', 
            'authority': 'bdds.test.com.', 
            'type': 'Master', 
            'dnssecSigned': False, 
            'kskIDs': '', 
            'zskIDs': '', 
            'customProperties': [], 
            'created': 'Jul 3, 2023 22:35:43', 
            'lastModified': 'Jul 3, 2023 22:35:43', 
            'displayName': 'test.menandmice.com.'
         }
     }

2. Get all zones sorted by name in descending order:

   .. code-block::

      >>> print(client.GetDNSZones(sortBy='name', sortOrder='Descending'))

      {
         'dnsZone': {
            'ref': '{#4-#63}', 
            'name': 'zone2.master.com.', 
            'dynamic': False, 
            'adIntegrated': False, 
            'dnsViewRef': '{#5-#23}', 
            'sourceZoneRef': '{#4-#63}', 
            'authority': 'test.generic.com.', 
            'type': 'Master', 
            'dnssecSigned': False, 
            'kskIDs': '', 
            'zskIDs': '', 
            'customProperties': [], 
            'created': 'Jun 29, 2023 14:53:53', 
            'lastModified': 'Jun 29, 2023 14:53:54', 
            'displayName': 'zone2.master.com.'
         },
         ...
        ],
        'totalResults':6
     }

3. Get the first 50 zones in the system in ascending order:

   .. code-block::
      
      >>> print(client.GetDNSZones(sortBy='name', sortOrder='Ascending', limit=50))

Filtering, sorting, and limiting are supported for all API types in Micetro. For a more comprehensive explanation, see our `JSON-RPC API whitepaper <https://www.menandmice.com/resources/whitepapers/json-rpc/>`_.

Creation, Modification, and Deletion
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Creating and modifying objects with the JSON-RPC API often requires more detailed information. It can be helpful to create an object in the terminal to manage all the required data.

**Example: Adding a DNS Record to a Zone**

.. code-block::

   >>> myRecord = {
   ...     'name': 'restart', 
   ...     'type': 'A', 
   ...     'data': '1.2.3.4', 
   ...     'dnsZoneRef': 'example.com'
   ... }

   >>> newRecordReference = client.AddDNSRecord(dnsRecord=myRecord)
   >>> print(newRecordReference)

If successful, the API response will contain the reference to the newly added DNS record.

Modifying and Deleting objects
"""""""""""""""""""""""""""""""
Instead of having separate API commands for each object type, modification and deletion are performed through universal commands: ``SetProperties`` for modification and ``RemoveObject`` for deletion.

**Example: Modifying the DNS Record**

1. Retrieve the existing DNS record:
   
   .. code-block::

      >>> theExistingRecord = client.GetDNSRecord(dnsRecordRef='restart.example.com')['dnsRecord']
      >>> print(theExistingRecord)

2. Modify the record's data:

   .. code-block::

      >>> client.SetProperties(ref=theExistingRecord['ref'], properties={'data': '4.3.2.1'})
      >>> print(theChangedRecord)

3. Verify the change:

   .. code-block::

      >>> theChangedRecord = client.GetDNSRecord(dnsRecordRef='restart.example.com')

If successful, the DNS record's data should now be ``4.3.2.1``.

**Example: Deleting the DNS Record**

.. code-block::

   >>> client.RemoveObject(ref=theExistingRecord['ref'])

The DNS record has now been deleted.


.. tip::
   For a comprehensive exploration of the JSON-RPC API for Micetro and the tools to support it, we recommend reading the whitepaper `JSON-RPC API whitepaper <https://www.menandmice.com/resources/whitepapers/json-rpc/>`_.
