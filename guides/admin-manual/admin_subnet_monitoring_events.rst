.. meta::
   :description: How to run external scripts and the types of script interfaces in Micetro by Men&Mice
   :keywords: DNS records, DNS

.. _admin-subnet-monitoring-events:

Subnet monitoring events
=========================

To access subnet monitoring events:

#. Select **Admin** on the top navigation bar.

#. Click **Configuration** on the menu bar at the top of the admin workspace.

#. Select **Event Hooks** in the left pane.
 
Enabling subnet monitoring
^^^^^^^^^^^^^^^^^^^^^^^^^^
Subnet monitoring is enabled in the :ref:`admin-system-settings`. Click the Settings button in the upper right corner to go to the system settings where you can enable subnet monitoring in the system and configure email notifications.

When enabled, the system monitors the free addresses in DHCP address pools and subnets, and performs an action if the number of free addresses goes below a user-definable threshold.

When subnet monitoring is enabled, a new column, Monitoring, displays when viewing the subnet list. To quickly see all subnets that are monitored, you can use the Quick Filter and filter by this column by entering “Monitor: Yes” in the Quick Filter search field.

SMTP Server
"""""""""""
The mail server from which notification emails will be sent when the number of addresses goes below a certain threshold.

Mail from
"""""""""
The email address from which notification emails will be sent when the number of addresses goes below a certain threshold.

Subnet monitoring defaults
^^^^^^^^^^^^^^^^^^^^^^^^^^^
The Subnet monitoring events section lists the current defaults. To change the default values, click **Set Defaults** and make the desired changes in the dialog box.

Enabled
  When checked, all subnets are monitored by default. If you only want to monitor a subset of the subnets in the system, leave this checkbox unchecked and enable monitoring for the individual subnets instead by selecting the subnet and then selecting Set Subnet Monitoring from the Range menu.

Script to invoke
  Enter the path of the script to run when the number of free addresses goes below the set threshold. Refer to Change Events for information on the script interface and the format for calling the script.

Email address
  The email address that should be the recipient of notification when the number of free addresses goes below the set threshold.

Dynamic Threshold
  Enter the threshold for the free addresses in a DHCP scope address pool.

Note
For split scopes and scopes in a superscope (on MS DHCP servers) and address pools using the shared-network feature on ISC DHCP servers, the total number of free addresses in all of the scope instances is used when calculating the number of free addresses.

Static Threshold.
Enter the threshold for the free addresses in a subnet.

Only perform action once (until fixed).
When checked, the action is performed only once when the number of free addresses goes below the threshold.

Perform action when fixed.
When checked, the action is performed when the number of free addresses is no longer below the threshold.
 

.. note::
  The global subnet monitoring setting can be overridden for individual subnets by changing the setting explicitly for the subnet. Refer to IP Address Management—Subnet Monitoring and Utilization History (section refers to management console, needs updating) for information on how to change monitoring settings for individual subnets.

Subnet Monitoring Script Interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The XML schema for a subnet monitoring script is as follows:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <xs:schema targetNamespace="http://tempuri.org/XMLSchema.xsd" elementFormDefault="qualified" xmlns="http://tempuri.org/XMLSchema.xsd" xmlns:mstns="http://tempuri.org/XMLSchema.xsd" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="scopeMonitor">
  <xs:complexType>
  <xs:sequence>
  <xs:element name="scope" type="xs:string" minOccurs="0" maxOccurs="1" />
  <xs:element name="server" type="xs:string" minOccurs="0" maxOccurs="1" />
  <xs:element name="superscope" type="xs:string" minOccurs="0" maxOccurs="1" />
  <xs:element name="threshold" type="xs:integer" minOccurs="1" maxOccurs="1" />
  <xs:element name="available" type="xs:integer" minOccurs="1" maxOccurs="1" />
  <xs:element name="fixed" type="xs:boolean" minOccurs="1" maxOccurs="1" />
  <xs:element name="thresholdType" type="xs:string" minOccurs="1" maxOccurs="1" />
  </xs:sequence>
  </xs:complexType>
  </xs:element>
  </xs:schema>

The value of the thresholdType element will be either static or dynamic depending on whether the threshold being crossed is one of dynamically allocatable addresses (that is, available addresses in address pools) or if it is a threshold set for static addresses (that is, available addresses outside of address pools).

.. note::
  The global subnet monitor, set through the :ref:`admin-system-settings`, is the only one that takes superscopes into account. When the global subnet monitor actions are performed, due to the conditions being met for a superscope, the XML generated will contain a <server> tag and a <superscope> tag.

An example XML structure for a subnet monitoring script might look as follows for scope:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <scopeMonitor>
  <scope>123.45.67.0/24</scope>
  <threshold>20</threshold>
  <available>8</available>
  <fixed>0</fixed>
  <thresholdType>dynamic</thresholdType>
  <customFields>
  <customField customFieldID="1" customFieldName="Title" objectID="526" objectType="6" value="Your subnet title"></customField>
  <customField customFieldID="2" customFieldName="Description" objectID="526" objectType="6" value="You subnet description"></customField>
  <customFields>
  </scopeMonitor>

The XML structure is slightly different if a superscope (MS DHCP) or a shared-network (ISC DHCP) configuration is used. An example XML structure for a scope monitoring script might look as follows for a superscope / shared-network configuration:

.. code-block:: XML

  <?xml version="1.0" encoding="ISO-8859-1"?>
  <scopeMonitor>
  <server>dhcp1.corp.net.</server>
  <superscope>office</superscope>
  <threshold>20</threshold>
  <available>22</available>
  <fixed>1</fixed>
  <thresholdType>dynamic</thresholdType>
  </scopeMonitor>

A subnet monitoring script does not have any return value.


Example PowerShell Script
^^^^^^^^^^^^^^^^^^^^^^^^^

.. note::
  Powershell scripts can be run natively by Men&Mice by starting the command with "powershell", "powershell.exe" or simply with the path to the .ps1 file. Powershell can then read the stdin with [Console]::In.ReadToEnd()

Instructions
""""""""""""

1. Copy the ScopeMonScript.ps1 to the c:\ProgramData\Men and Mice\Central directory.

2. In Admin->Configuration->Event Hooks, under Subnet Monitoring, click **Set Defaults** and set the **Script to invoke** text box to ScopeMonScript.ps1.

3. Then configure a dynamic threshold.


The monitor will be executed every 10 minutes during the DHCP synchronization interval.

.. code-block:: PowerShell

  param([Parameter(Mandatory=$false,ValueFromPipeLine=$false)]$UserName = "",
  [Parameter(Mandatory=$false,ValueFromPipeLine=$false)]$Password = "",
  [Parameter(Mandatory=$false,ValueFromPipeLine=$false)]$xmlFileName = "")
  $strInput = get-content $xmlFileName
  #$strInput = $args
  # write output for troubleshooting in file:
  #Add-Content -Path .\monitoroutput.xml $strInput

  $strXML = [string]::Join(" ", $strInput)
  $objXML = [xml]$strXML
  $subnetMonitor = (Select-Xml -XML $objXML -XPath "/subnetMonitor").Node

  # Check if it's an alert or fixed message
  # The script only cares about alerts
  if ($subnetMonitor.fixed -eq "0")
  {
      $strAlert = "Alert:  The following scope or subnet has fewer IPs available than the configured threshold."

      # We could send here an email or generate a trap or...
      #Send-MailMessage -SmtpServer "smpt.example.com" -From "subnetmonitor@example.com" -To "alert1@example.com;alert2@example.net" -Subject "Subnet Monitor Message" -Body $strOutput

      # First handle the superscopes
      if ($subnetMonitor.superscope -ne $null -and $subnetMonitor.superscope -ne "")
      {
      $strOutput = @"

      $strAlert
      Superscope: $($subnetMonitor.superscope)
      Alert Date:    $(Get-Date -Format G)
      Server:        $($subnetMonitor.server)
      Threshold:    $($subnetMonitor.threshold)
      IPs Available:    $($subnetMonitor.available)
      Subnet Type:    $($subnetMonitor.thresholdType)
      "@
          New-EventLog -Source SubnetMonitor -LogName Application
          Write-EventLog -LogName Application -Source SubnetMonitor -EventID 1063 -EntryType Warning -message "$strOutput"
          #Add-Content -Path .\superscopemonitor_msg.txt $strOutput
          }
      else
      {
      # then in the else clause the normal scopes

      $strOutput = @"

      $strAlert
        Alert Date:    $(Get-Date -Format G)
        Scope:        $($subnetMonitor.subnet)
        Threshold:    $($subnetMonitor.threshold)
        IPs Available:    $($subnetMonitor.available)
        Subnet Type:    $($subnetMonitor.thresholdType)
        "@
          New-EventLog -Source SubnetMonitor -LogName Application
          Write-EventLog -LogName Application -Source SubnetMonitor -EventID 1064 -EntryType Warning -message "$strOutput"
          #Add-Content -Path .\scopemonitor_msg.txt $strOutput
      }
    }
    else
    {
    # possible issue fixed message
    }

Example Python Script
^^^^^^^^^^^^^^^^^^^^^^^^^
The following example script, written in Python, shows how a script could return different values depending on the input of custom fields. The script is called when an object property changes and it queries for country and city using a location code. The intended use here is to mark the locations of servers.

.. code-block:: Python

import sys
import xml.etree.ElementTree as ET

def get_custom_field_element(custom_fields, name):
    element = custom_fields.find(f"./customField[@customFieldName='{name}']")
    if element is None:
        raise KeyError(f"Custom property '{name}' was not found.")
    return element

def get_result(root):
    # username variable is not used but this is how to get the username
    username = root.get('userName')
    custom_fields = root.find("./customFields")
    
    result = ET.Element("result", {"success": "0"})
    try:
        location_element = get_custom_field_element(custom_fields, 'Location')
        country_element = get_custom_field_element(custom_fields, 'Country')
        city_element = get_custom_field_element(custom_fields, 'City')
    except KeyError as e:
        ET.SubElement(result, "error", {"code": "1", "message": str(e)})
        return result
    location = location_element.get('value')
    
    # A database could be queried instead here
    LOCATION_MAP = {
        'l1': ('USA', 'Washington'),
        'l2': ('UK', 'London')
    }
    if location not in LOCATION_MAP:
        ET.SubElement(result, "error", {"code": "1", "message": "Unknown location."})
        return result
 
    result.set("success", "1")
    country, city = LOCATION_MAP[location]
    country_element.set('value', country)
    city_element.set('value', city)
    result.append(custom_fields)
    return result

# Read all input and parse as XML
root = ET.fromstring(sys.stdin.read())
result = get_result(root)

print('<?xml version="1.0"?>')
# This will write the generated result xml to standard output
ET.dump(result)
