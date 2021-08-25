.. meta:: 
   :description: Specific roles in Micetro by Men&Mice 10.1
   :keywords: Micetro access model

.. _acl-specific-roles:

Specific roles 
--------------

*Specific roles* are a role type whose permissions are **not** automatically applied to objects in Micetro. They're intended to allow managing access on a per-object basis.

To create a *Specific role*, follow the instructions on :ref:`acl-roles`, and **uncheck** the :guilabel:`General` checkbox in the role creation dialog. (The default value is checked.)

*Example:* The specific role *example.com editor* has the ``Edit zone options`` permission enabled. No 'DNS zone' type object in Micetro, whether already existing or added in the future, will be accessible to users/groups attached to this role **unless specifically added** to the object.

.. warning::
   Specific roles are only intended for edge use cases, and should not be regarded as the preferred method of access control in Micetro.

Using specific roles 
^^^^^^^^^^^^^^^^^^^^

Access defined through specific roles isn't applied until explicitly configured on objects.

To use a *Specific role* and control access to an object:

1. Open the context (DNS or IPAM) and select the object to which you'd like to restrict access.

.. note::
   Using specific roles on an object is only possible individually, per object.

2. Use the :guilabel:`Access` action from the top bar or the ellipsis menu.

3. On the top of the dialog, remove all unneeded *General roles* and/or users (legacy only) configured.

3. On the bottom of the dialog, search for the *Specific role* and click :guilabel:`+ Add`.

4. Click :guilabel:`Save`.

This will restrict access to that particular object to the selected users/groups assigned to the *Specific role*.