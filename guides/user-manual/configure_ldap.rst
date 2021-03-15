.. _configure-ldap:

Configure LDAP authentication
=============================

Introduction
------------

This document describes how to configure LDAP authentication in the Men & Mice Suite.

Installation on Centos Linux
----------------------------

To use LDAP authentication and authorization, start by installing python-ldap on the machine where the Men & Mice Central service is run and install the python extension used by Central when connecting to an LDAP directory:

.. code-block:: bash

  sudo yum install python-ldap
  sudo mkdir /var/mmsuite/mmcentral/extensions
  sudo cp mm_ldap.py /var/mmsuite/mmcentral/extensions
  sudo chown -R root:root /var/mmsuite/mmcentral/extensions
  sudo chmod 440 /var/mmsuite/mmcentral/extensions/mm_ldap.py

A signature file for the python extension will also have to be installed and placed in the extension directory:

.. code-block:: bash

  sudo cp mm_ldap.signature /var/mmsuite/mmcentral/extensions

.. note::
  For security reasons, the Central service will not execute mm_ldap.py unless the signature inmm_ldap.signature matches the signature calculated for mm_ldap.py.

Configuring LDAP
----------------

LDAP configurations are stored in a JSON config file that should be stored in the Men & Mice Central service root directory:

.. code-block:: bash

  sudo cp ldapconf.json /var/mmsuite/mmcentral
  sudo chown root:root /var/mmsuite/mmcentral/ldapconf.json
  sudo chmod 440 /var/mmsuite/mmcentral/ldapconf.json

The configuration file has the following schema:

.. code-block::
  :linenos:

  {
    "server": {
        "uri": str, // e.g. ldaps://example.com:636
        "reader_dn": str | null,
        "reader_password": str | null,
        "skip_cert_verification": bool | null, // Default: false.
        "ca_cert_file": str | null,
        "disable_referrals": bool | null, // Default: true.
        "use_start_tls": bool | null, // Default: false.
        },
    "user_search_config": {
        "base_dn": str,
        "search_filter": str,
        "scope": "subtree" | "onelevel", // Default: 'subtree'
        "email_attribute": str | null,
        "group_search_config": null | {
            "base_dn": str,
            "scope": "subtree" | "onelevel", // Default: 'subtree'
            "search_filter": str,
            "name_attribute": str // Default: 'name'
        }
      }
    }

.. csv-table::
  :header: "Name", "Description", "Example", "Required", "Default"
  :widths: 10, 70, 10, 5, 5

  "uri","URI for LDAP service.", "ldaps://example.com:636", "Yes", "None"
  "reader_dn","DN or login name for a user that has permissions to search in the directory. Not needed when all users have permissions to search (for example AD LDAP service).",	"user@example.com",	"No", "None"
  "reader_password", "Password for reader_dn user.", "", "No", "None"
  "skip_cert_verification", "If true, then certificates will not be verified. Set to true when using self signed certificates.", "", "No", "false"
  "ca_cert_file",	"Path of file containing all trusted CA certificates.", "", "No", "None"
  "disable_referrals", "Skip referrals when doing LDAP queries. Should be set to true for AD LDAP services." "", "No", "true"
  "user_start_tls", "Use TLS when connecting to LDAP service. This is still experimental. Please use LDAPS instead.", "", "No", "false"
  "user_search_config.base_dn",	"DN from where to start searching for a user in the directory.", "'dc=corp, dc=example, dc=com'", "Yes", "None"
  "user_search_config.search_filter", "Filter to use for searching for a user. Username will be inserted into placeholder '{username}' if specified.", "(&(objectClass=user)(userPrincipalName={username}))", "Yes", "None"
  "scope", "Scope to use when searching. Should be either 'subtree' or 'onelevel'. Defaults to 'subtree'.",	"subtree", "No", "subtree"
  "email_attribute", "LDAP attribute used to store users email address.", "userPrincipalName", "No", "None"
  "group_search_config.base_dn", "DN from where to start searching for groups in the directory.",	"'dc=corp, dc=example, dc=com'", "If group authentication is used.", "None"
  "group_search_config.scope", "Scope to use when searching. Should be either 'subtree' or 'onelevel'. Defaults to 'subtree'.",	"subtree", "No", "subtree"
  "group_search_config.search_filter", "Search filter to use when searching for groups. Users DN will be inserted into placeholder '{dn}' if specified. Username will be inserted into placeholder '{username}' if specified.", "(&(objectClass=group)(member:={dn}))", "If group authentication is used.", "None"
  "group_search_config.name_attribute", "Attribute used to store name of group.", "name", "If group authentication is used.", "name"

Example configuration for connecting to an AD LDAP service:

.. code-block::
  :linenos:

  {
    "server": {
        "uri": "ldaps://ldap.example.com:636",
        "skip_cert_verification": false,
        "disable_referrals": true,
        "use_start_tls": false
        },

    "user_search_config": {
        "base_dn":  "dc=corp, dc=example, dc=com",
        "search_filter": "(&(objectClass=user)(userPrincipalName={username}))",
        "scope": "subtree",
        "email_attribute": "userPrincipalName",
        "group_search_config": {
            "base_dn": "dc=corp, dc=example, dc=com",
            "scope": "subtree",
            "search_filter": "(&(objectClass=group)(member:={dn}))",
            "name_attribute": "name"
            }
        }
    }

Configuring the Men & Mice Central service to authenticate users using an LDAP service.
---------------------------------------------------------------------------------------

To configure the Men & Mice Central service, login as the superuser "administrator" through the Men & Mice Management Console. In the top left-hand corner select "System Settings" from the "Tools" menu, click on the "Advanced..." button and check the  "Enable LDAP integration" checkbox.
