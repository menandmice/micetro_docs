.. _ansible-mm_props:

mm_props
--------

Manage custom properties (see :ref:`admin-custom-properties`) in Micetro.

Options
^^^^^^^

cloudtags:
  Associated cloud tags.

defaultvalue:
  Default value of the property.

dest:
  (required) The section where to define the custom property.

listitems:
  The items in the selection list.

mandatory:
  Is the property mandatory.

multiline:
  Is the property multiline.

name:
  (required) Name of the property.

proptype:
  Type of the property. These are not the types as described in the API, but the types as you can see them in the Men&Mice Management Console.

provider:
  (required) Definition of the Micetro provider.

readonly:
  Is the property read only.

state:
  The state of the properties or properties. (``absent``, ``present``)

system:
  Is the property system defined.

updateexisting:
  Should objects be updated with the new values. Only valid when updating a property, otherwise ignored.

Examples
^^^^^^^^

.. code-block:: yaml

  - name: Set definition for custom properties
    mm_props:
      name: location
      state: present
      proptype: text
      dest: zone
      provider:
        mmurl: http://mmsuite.example.net
        user: apiuser
        password: apipasswd
    delegate_to: localhost
