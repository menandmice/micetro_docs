.. meta::
   :description: How to run external scripts and the types of script interfaces in Micetro by Men&Mice
   :keywords: DNS records, DNS

.. _admin-change-events:

Change events
================

Overview
--------

The system can be configured to run scripts in the event that object properties are changed. The script is also run when an object is created, but not on deletion.

.. note::
   Scripts for the DNS Record object type are handled a bit differently. They are not run upon modifying the custom properties of a record, but rather when the content of the zone changes (record added, modified, or deleted.) For more information, see :ref:`zone-content-change-script-interface`.


Scripts associated with object types are often used to perform lookups in external data sources and return data from these sources. 

Adding a change event
^^^^^^^^^^^^^^^^^^^^^^
1. Select **Admin** on the top navigation bar.

2. Click **Configuration** on the menu bar at the top of the admin workspace.

3. Select **Event Hooks** in the left pane. 

4. Change events are displayed in the **Change Events** section. Click **Add**.

5. In the Add Change Event dialog box, select the **Object type** (Zone, IP Address etc.), and then enter the **Script name** and necessary startup parameters.

   You must enter all information for the script as you would when invoking the script from the command line. It is assumed that the script is located in the same directory as Men&Mice Central; however, if the script is stored in a different location, the path for the script must be entered.
   
5. When you are finished, click **Add**. 

Example 1:
  Running a python script named mytest.py. To run a script named mytest.py that is located in the Men&Mice Central directory using the python interpreter, the following would be placed in the appropriate field: python mytest.py.

Example 2:
  Running an executable named checkdata.exe. To run an executable named checkdata.exe that is located in the Men&Mice Central directory the following would be placed in the appropriate field: checkdata.exe.

Editing and deleting change events
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#. Click the **Action** (...) button for the event you want to edit or delete.
   
#. Select the appropriate action on the pop-up menu, and make the desired changes.


Script Interfaces
-----------------

When Men&Mice Central runs an external script assoicated with a change event, it sends an XML structure as an argument to the script being called. The XML structure contains information about all custom properties that are defined for the object type. The XML structure also contains the login name of the user that triggered the script.

The XML structures differs a little depending on the type of script (property change, zone contents change, scope monitoring).

.. note::
   The API knows change events as External Scrips which is why the element name is externalScriptParameters.

Property Change Script Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The XML schema for a property change script is as follows:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <xs:schema targetNamespace="http://tempuri.org/XMLSchema.xsd" elementFormDefault="qualified" xmlns="http://tempuri.org/XMLSchema.xsd" xmlns:mstns="http://tempuri.org/XMLSchema.xsd" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="externalScriptParameters">
  <xs:complexType>
  <xs:sequence>
  <xs:element ref="customFields" minOccurs="1" maxOccurs="1" />
  </xs:sequence>
  <xs:attribute name="userName" type="xs:string" />
  </xs:complexType>
  </xs:element>
  <xs:element name="customFields">
  <xs:complexType>
  <xs:sequence>
  <xs:element ref="customField" minOccurs="1" maxOccurs="unbounded" />
  </xs:sequence>
  </xs:complexType>
  </xs:element>
  <xs:element name="customField">
  <xs:complexType>
  <xs:sequence>
  </xs:sequence>
  <xs:attribute name="customFieldID" type="xs:string" />
  <xs:attribute name="customFieldName" type="xs:string" />
  <xs:attribute name="objectID" type="xs:string" />
  <xs:attribute name="objectType" type="xs:string" />
  <xs:attribute name="value" type="xs:string" />
  </xs:complexType>
  </xs:element>
  </xs:schema>

An example XML structure with three custom properties named Location, Country and Region might look as follows:

.. code-block:: XML

  <?xml version="1.0"?>
  <externalScriptParameters username="administrator">
  <customFields>
  <customField customFieldID="24" customFieldName="Location"
  objectID="27" objectType="4" value="location1"></customField>
  <customField customFieldID="25" customFieldName="Country"
  objectID="27" objectType="4" value=""></customField>
  <customField customFieldID="26" customFieldName="Region"
  objectID="27" objectType="4" value=""></customField>
  </customFields>
  </externalScriptParameters>

Upon completion, the script must create a new XML structure and return it to Men&Mice Central. The schema for the XML structure that is returned is as follows:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <xs:schema targetNamespace="http://tempuri.org/XMLSchema.xsd"
  elementFormDefault="qualified" xmlns="http://tempuri.org/
  XMLSchema.xsd" xmlns:mstns="http://tempuri.org/XMLSchema.xsd"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="result">
  <xs:complexType>
  <xs:choice minOccurs="1" maxOccurs="2">
  <xs:element ref="customFields" />
  <xs:element ref="error" />
  </xs:choice>
  <xs:attribute name="success" type="xs:string" />
  </xs:complexType>
  </xs:element>
  <xs:element name="customFields">
  <xs:complexType>
  <xs:sequence>
  <xs:element ref="customField" minOccurs="0" maxOccurs="unbounded"/>
  </xs:sequence>
  </xs:complexType>
  </xs:element>
  <xs:element name="customField">
  <xs:complexType>
  <xs:sequence>
  </xs:sequence>
  <xs:attribute name="customFieldID" type="xs:string" />
  <xs:attribute name="customFieldName" type="xs:string" />
  <xs:attribute name="objectID" type="xs:string" />
  <xs:attribute name="objectType" type="xs:string" />
  <xs:attribute name="value" type="xs:string" />
  </xs:complexType>
  </xs:element>
  <xs:element name="error">
  <xs:complexType>
  <xs:sequence>
  </xs:sequence>
  <xs:attribute name="code" type="xs:string" />
  <xs:attribute name="message" type="xs:string" />
  </xs:complexType>
  </xs:element>
  </xs:schema>

An example XML structure with three custom properties named Location, Country and region might look as follows:

.. code-block:: XML

  <?xml version="1.0"?>
  <result success="1">
  <customFields>
  <customField customFieldID="24" customFieldName="loc" objectID="27" objectType="4" value="location1"></customField>
  <customField customFieldID="25" customFieldName="Country" objectID="27" objectType="4" value="USA"></customField>
  <customField customFieldID="26" customFieldName="Region" objectID="27" objectType="4" value="Texas"></customField>
  </customFields>
  </result>

Men&Mice Central uses the information in the XML structure to update other custom properties or to display an error message if the success attribute on the result element is set to 0. The following XML example shows how an error message can be returned by the change event script.

.. code-block:: XML

  <?xml version="1.0"?><result success="0"><error code="1"message="The error message."></error></result>

The XML structure is not required to return information about all custom properties, only fields that the script has changed. Unknown property fields are ignored by Men&Mice Central.

.. _zone-content-change-script-interface:

Zone Content Change Script Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The XML schema for a zone content change script is as follows:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <xs:schema targetNamespace="http://tempuri.org/XMLSchema.xsd" elementFormDefault="qualified" xmlns="http://tempuri.org/XMLSchema.xsd" xmlns:mstns="http://tempuri.org/XMLSchema.xsd" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="externalScriptParameters">
  <xs:complexType>
  <xs:sequence>
  <xs:element ref="object" minOccurs="1" maxOccurs="1" />
  </xs:sequence>
  <xs:attribute name="userName" type="xs:string" />
  </xs:complexType>
  </xs:element>
  <xs:element name="object">
  <xs:complexType>
  <xs:sequence>
  <xs:element name="id" type="xs:integer" minOccurs="1" maxOccurs="1" />
  <xs:element name="type" type="xs:integer" minOccurs="1" maxOccurs="1" />
  <xs:element name="server" type="xs:string" minOccurs="1" maxOccurs="1" />
  <xs:element name="view" type="xs:string" minOccurs="1" maxOccurs="1" />
  <xs:element name="zone" type="xs:string" minOccurs="1" maxOccurs="1" />
  <xs:element name="fqName" type="xs:string" minOccurs="1" maxOccurs="1" />
  </xs:sequence>
  </xs:complexType>
  </xs:element>
  </xs:schema>

An example XML structure for a zone change script might look as follows for a zone that exists in a view:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <externalScriptParameters userName="administrator">
  <object>
  <id>2534</id>
  <type>13</type>
  <server>bind1.corp.net.</server>
  <view>internal</view>
  <zone>zone.com.</zone>
  <fqName>bind1.corp.net.:internal:zone.com.</fqName>
  </object>
  </externalScriptParameters>

An example XML structure for a zone change script might look as follows for a zone that is not in a view:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <externalScriptParameters userName="administrator">
  <object>
  <id>2635</id>
  <type>13</type>
  <server>dns1.corp.net.</server>
  <view />
  <zone>my.zone.com.</zone>
  <fqName>dns1.corp.net.::my.zone.com.</fqName>
  </object>
  </externalScriptParameters>

A zone content change script does not have any return value.
