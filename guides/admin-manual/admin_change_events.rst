.. meta::
   :description: How to run external scripts and the types of script interfaces in Micetro
   :keywords: DNS records, DNS

.. _admin-change-events:

Change Events
==============

Overview
--------

The system can be configured to run scripts in the event that object properties are changed. The script is also run when an object is created, but not on deletion.

.. note::
   Scripts for the DNS Record object type are handled a bit differently. They are not run upon modifying the custom properties of a record, but rather when the content of the zone changes (record added, modified, or deleted.) For more information, see :ref:`zone-content-change-script-interface`.


Scripts associated with object types are often used to perform lookups in external data sources and return data from these sources. 

Adding a Change Event
^^^^^^^^^^^^^^^^^^^^^^
1. On the **Admin** page, select :guilabel:`Configuration` in the upper-left corner.

2. Select :guilabel:`Event Hooks` in the filtering sidebar. 

3. Change events are displayed in the **Change Events** section. Click :guilabel:`Add`.

4. In the Add Change Event dialog box, select the **Object type** (Zone, IP Address etc.), and then select the **Script name**.

   It is assumed that the script is located in a folder named `scripts` under Central's data folder.
   
5. When you are finished, click :guilabel:`Add`. 

*Example*: Running a Python script named mytest.py.

   To run a script named mytest.py that is located in the scripts folder, simply select ``mytest.py`` from the dropdown field.

Editing and Deleting Change Events
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#. Click the Actions button (**...**) for the event you want to edit or delete.
   
#. Select the appropriate action on the pop-up menu, and make the desired changes.


Script Interfaces
-----------------

When Micetro Central runs an external script associated with a change event, it sends an XML structure as an argument to the script being called. The XML structure contains information about all custom properties that are defined for the object type. The XML structure also contains the login name of the user that triggered the script.

The XML structures differ a little depending on the type of script (property change, zone contents change, DNS record change, scope monitoring).

.. note::
   The API knows change events as External Scripts which is why the element name is ``externalScriptParameters``.

Standard Script Interface
^^^^^^^^^^^^^^^^^^^^^^^^^
The XML schema for all objects is as follows:

.. code-block:: XML

  <xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="externalScriptParameters" type="externalScriptParametersType"/>
    <xs:complexType name="objectType">
      <xs:sequence>
        <xs:element type="xs:string" name="id"/>
        <xs:element type="xs:string" name="type"/>
        <xs:element type="xs:string" name="name" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="addressSpace" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="server" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="view" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="zone" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="fqName" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="zoneType" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="dynamic" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="adIntegrated" minOccurs="0" maxOccurs="1"/>
      </xs:sequence>
    </xs:complexType>
    <xs:complexType name="customFieldType">
      <xs:simpleContent>
        <xs:extension base="xs:string">
          <xs:attribute type="xs:string" name="customFieldID"/>
          <xs:attribute type="xs:string" name="customFieldName"/>
          <xs:attribute type="xs:string" name="objectID"/>
          <xs:attribute type="xs:string" name="objectType"/>
          <xs:attribute type="xs:string" name="value"/>
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
    <xs:complexType name="customFieldsType">
      <xs:sequence>
        <xs:element type="customFieldType" name="customField"/>
      </xs:sequence>
    </xs:complexType>
    <xs:complexType name="propertyType">
      <xs:simpleContent>
        <xs:extension base="xs:string">
          <xs:attribute type="xs:string" name="propertyName"/>
          <xs:attribute type="xs:string" name="objectID"/>
          <xs:attribute type="xs:string" name="objectType"/>
          <xs:attribute type="xs:string" name="value"/>
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
    <xs:complexType name="propertiesType">
      <xs:sequence>
        <xs:element type="propertyType" name="property" minOccurs="0" maxOccurs="1"/>
      </xs:sequence>
    </xs:complexType>
    <xs:complexType name="externalScriptParametersType">
      <xs:sequence>
        <xs:element type="objectType" name="object"/>
        <xs:element type="customFieldsType" name="customFields" minOccurs="0" maxOccurs="1"/>
        <xs:element type="propertiesType" name="properties" minOccurs="0" maxOccurs="1"/>
      </xs:sequence>
      <xs:attribute type="xs:string" name="userName"/>
    </xs:complexType>
  </xs:schema>

Change Request Script Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The XML schema for a change request (external script) is as follows:

.. note::
  This script applies to most objects, excluding DNS records. For an example XML schema for changes to DNS records, refer to :ref:`dns-record-xml-schema` below.

.. code-block::

  <xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="externalScriptParameters" type="externalScriptParametersType"/>
    <xs:complexType name="objectType">
      <xs:sequence>
        <xs:element type="xs:string" name="id"/>
        <xs:element type="xs:string" name="type"/>
        <xs:element type="xs:string" name="name" />
        <xs:element type="xs:string" name="addressSpace" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="server" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="view" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="fqName" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="zoneType" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="dynamic" minOccurs="0" maxOccurs="1"/>
        <xs:element type="xs:string" name="adIntegrated" minOccurs="0" maxOccurs="1"/>
      </xs:sequence>
    </xs:complexType>
    <xs:complexType name="customFieldType">
      <xs:simpleContent>
        <xs:extension base="xs:string">
          <xs:attribute type="xs:string" name="customFieldID"/>
          <xs:attribute type="xs:string" name="customFieldName"/>
          <xs:attribute type="xs:string" name="objectID"/>
          <xs:attribute type="xs:string" name="objectType"/>
          <xs:attribute type="xs:string" name="value"/>
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
    <xs:complexType name="customFieldsType">
      <xs:sequence>
        <xs:element type="customFieldType" name="customField"/>
      </xs:sequence>
    </xs:complexType>
    <xs:complexType name="propertyType">
      <xs:simpleContent>
        <xs:extension base="xs:string">
          <xs:attribute type="xs:string" name="propertyName"/>
          <xs:attribute type="xs:string" name="objectID"/>
          <xs:attribute type="xs:string" name="objectType"/>
          <xs:attribute type="xs:string" name="value"/>
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
    <xs:complexType name="propertiesType">
      <xs:sequence>
        <xs:element type="propertyType" name="property" minOccurs="0" maxOccurs="1"/>
      </xs:sequence>
    </xs:complexType>
    <xs:complexType name="externalScriptParametersType">
      <xs:sequence>
        <xs:element type="objectType" name="object"/>
        <xs:element type="customFieldsType" name="customFields"/>
        <xs:element type="propertiesType" name="properties" minOccurs="0" maxOccurs="1"/>
      </xs:sequence>
      <xs:attribute type="xs:string" name="userName"/>
    </xs:complexType>
  </xs:schema>

Micetro Central uses the information in the XML structure to update other custom properties or to display an error message if the success attribute on the result element is set to 0. The following XML example shows how an error message can be returned by the change event script.

.. code-block:: XML

  <?xml version="1.0"?><result success="0"><error code="1"message="The error message."></error></result>

The XML structure is not required to return information about all custom properties, only fields that the script has changed. Unknown property fields are ignored by Micetro Central.

.. _zone-content-change-script-interface:

Zone Content Change Script Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The XML schema for a DNS zone content change script is as follows:

.. code-block:: XML
  
  <xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="externalScriptParameters" type="externalScriptParametersType"/>
    <xs:complexType name="objectType">
      <xs:sequence>
        <xs:element type="xs:string" name="id"/>
        <xs:element type="xs:string" name="type"/>
        <xs:element type="xs:string" name="server"/>
        <xs:element type="xs:string" name="view"/>
        <xs:element type="xs:string" name="zone"/>
        <xs:element type="xs:string" name="fqName"/>
      </xs:sequence>
    </xs:complexType>
    <xs:complexType name="externalScriptParametersType">
      <xs:sequence>
        <xs:element type="objectType" name="object"/>
      </xs:sequence>
      <xs:attribute type="xs:string" name="userName"/>
    </xs:complexType>
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

.. _dns-record-xml-schema:

DNS Record Content Change Script Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The following XML structure is used for changes to DNS records:

.. code-block:: XML

  <xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="externalScriptParameters" type="externalScriptParametersType"/>
    <xs:complexType name="objectType">
      <xs:sequence>
        <xs:element type="xs:string" name="id"/>
        <xs:element type="xs:string" name="type"/>
        <xs:element type="xs:string" name="server"/>
        <xs:element type="xs:string" name="view"/>
        <xs:element type="xs:string" name="zone"/>
        <xs:element type="xs:string" name="fqName"/>
      </xs:sequence>
    </xs:complexType>
    <xs:complexType name="externalScriptParametersType">
      <xs:sequence>
        <xs:element type="objectType" name="object"/>
      </xs:sequence>
      <xs:attribute type="xs:string" name="userName"/>
    </xs:complexType>
  </xs:schema>

An example XML structure for a DNS record change script might look as follows:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1" ?>
  <externalScriptParameters userName="administrator">
    <object>
        <id>1</id>
        <type>13</type>
        <server>dns1.corp.net.</server>
        <view />
        <zone>armann.test.</zone>
        <fqName>dns1.corp.net.::my.zone.com.</fqName>
    </object>
  </externalScriptParameters>

Workflow Change Script Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The following XML structure is used for changes to a workflow:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <externalScriptParameters userName="administrator">
    <object>
        <id>14</id>
        <type>13</type>
        <name>gaman7</name>
        <addressSpace>1</addressSpace>
        <server>bind1.corp.net.</server>
        <view></view>
        <fqName>bind1.corp.net.:internal:zone.com.</fqName>
        <zoneType>master</zoneType>
        <dynamic>0</dynamic>
        <adIntegrated>0</adIntegrated>
    </object>
    <customFields>
        <customField customFieldID="5" customFieldName="myCustomRecordProp" objectID="14" objectType="13" value="test"></customField>
    </customFields>
    <properties>
        <property propertyName="someName" objectID="2580" objectType="10" value="someValue"></property>
    </properties>
  </externalScriptParameters>
