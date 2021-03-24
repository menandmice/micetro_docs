.. _ansible-mm_ipinfo:

mm_ipinfo plugin
----------------

This Men&Mice IPInfo lookup plugin finds a lot of info about a specified IP address, defined in Micetro.

Options
^^^^^^^

ipaddress:
  (required) The IP address that is examined

provider:
  (required) Definition of the Micetro API provider.

Usage
^^^^^

The ``mm_ipinfo`` plugin delivers a complete set of information about an IP address, as it is delivered by the Micetro API.

Example usage:
^^^^^^^^^^^^^^

Get information on an IP address

.. code-block:: yaml

  - name: Get all info for this IP address
    debug:
      var: ipinfo
    vars:
      ipinfo: "{{ query('mm_ipinfo', provider, '172.16.17.2') | to_nice_json }}"

With output like (output shortened):

::

  ok: [localhost] => {
      "ipinfo": {
          "addrRef": "IPAMRecords/11",
          "address": "172.16.17.2",
          "claimed": false,
          "customProperties": {
              "location": "At the attic"
          },
      }
  }
