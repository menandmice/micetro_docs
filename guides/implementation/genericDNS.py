#!/usr/bin/env python
'''
Created on 2014-05-26

@author: indridi@menandmice.com

An example of a generic DNS server script. For real script
look in to 
	svn://svn.menandmice.is/trunk/services/scripts/genericDNSControllerScripts/
	
'''
from __future__ import print_function	# Prepare for python 3.1

import sys
import json

# Error constants
mmErr_zoneUnableToAddRecord		= 0x1212
mmErr_zoneUnableToDeleteRecord	= 0x1213
mmErr_zoneUnableToModifyRecord	= 0x1214
mmErr_zoneRecordAlreadyExist	= 0x1215
mmErr_zoneUnableToLockZoneFile	= 0x1216

mmErr_zoneSOAConstraint			= 0x1217
mmErr_zoneCNAMEConstraint		= 0x1218
mmErr_zoneOutOfZoneRecord		= 0x1219
mmErr_zoneApexConstraint		= 0x121A
mmErr_zoneRecordSyntax			= 0x121B


#################################################
#
# mmSuite responses
#


# Return information about the type of server
def doGetServerInfo():
	return { 'type': 'Simply generic DEMO' }


# Return information about the status of the DNS service itself
# possible return values are:
#	"undefined" - we have no idea about the service
#	"running" - the service is up and running
#	"stopped" - the service is stopped
#	"exited" - the service has exited
#	"fatal" - the serivce has entered a fatal state
#
def doGetServiceStatus():
	return { 'serviceStatus': 'running' }


# Return all views available on the DNS server
def doGetViews():
	return { 'views': ['jonas', 'fridvin'] }


# Return all zones available, their type and current serial
def doGetZones():
	zones = []
	zones.append({'view': 'jonas', 'name': 'zone1.master.com.', 'type': 'Master', 'dynamic': True, 'serial': '1234'})
	zones.append({'view': 'jonas', 'name': 'zone2.master.com.', 'type': 'Master', 'dynamic': False, 'serial': '1234'})
	zones.append({'view': 'jonas', 'name': 'zone3.master.com.', 'type': 'Master', 'dynamic': False, 'serial': '1234'})
	zones.append({'view': 'jonas', 'name': 'zone4.master.com.', 'type': 'Master', 'dynamic': False, 'serial': '1234'})
	zones.append({'view': 'fridvin', 'name': 'slave.zone.com.', 'type': 'Slave', 'dynamic': False, 'serial': '1234'})
	zones.append({'view': 'jonas', 'name': 'stub.zone.com.', 'type': 'Stub', 'dynamic': False, 'serial': '1234'})
	return { 'zones': zones }


# Return information for a specific zone it's type and current serial
def doGetZone():
	# text = '{ "method": "GetZone", "params": {"view": "", "name": "zone1.com."}}'
	text = sys.stdin.read()
	input = json.loads(text)
	viewName= input['params']['view']
	zoneName= input['params']['name']

	return { 'zone': {'view': viewName, 'name': zoneName, 'type': 'Master', 'dynamic': True, 'serial': '1234'} }


# Return the content a zone
def doGetRecords():
	# text = '{ "method": "GetRecords", "params": {"view": "", "name": "zone1.com."}}'
	text = sys.stdin.read()
	input = json.loads(text)
	viewName= input['params']['view']
	zoneName= input['params']['name']

	records = []
	records.append({'name':'@', 		'ttl': '', 'type': 'SOA', 	'data': 'apu.menandmice.is.\thostmaster.azone.com.\t2014111111\t28800\t7200\t604800\t86400'})
	records.append({'name':'', 			'ttl': '', 'type': 'NS', 	'data': 'apu.menandmice.is.', 'comment': 'this is a comment'})
	records.append({'name':'', 			'ttl': '', 'type': 'NS', 	'data': 'marge.menandmice.is.'})
	records.append({'name':'aaaa', 		'ttl': '', 'type': 'AAAA', 	'data': '::217.151.171.10'})
	records.append({'name':'acname', 	'ttl': '', 'type': 'CNAME', 'data': 'newrec2'})
	records.append({'name':'newrec2', 	'ttl': '', 'type': 'A', 	'data': '127.151.171.23'})

	return { 'dnsRecords': records }


# Update a zone
def doUpdateZone():
	#text = '''{ "method": "UpdateZone", "params": {"view": "", "name": "zone1.com.", "replaceZone": "0", "dnsRecordChanges":[
	#	{"type": "ModifyDNSRecord", "changeIndex": "23"
	#		, "dnsRecordBefore": 	{"name":"newrec2", "ttl": "", "type": "A", 	"data": "127.151.171.23", "comment":"a comment" }
	#		, "dnsRecordAfter": 	{"name":"newrec2", 	"ttl": "", "type": "A", 	"data": "127.151.171.24"}
	#	}
	#]}}'''
	
	text = sys.stdin.read()
	input = json.loads(text)
	viewName= input['params']['view']
	zoneName= input['params']['name']
	failedUpdates= []
	newSerial = '1234'
	
	for dnsRecordChange in input['params']['dnsRecordChanges']:
		if dnsRecordChange['type'] == 'AddDNSRecord':
			pass
		elif dnsRecordChange['type'] == 'ModifyDNSRecord':
			pass
		elif dnsRecordChange['type'] == 'RemoveDNSRecord':
			pass

	##### JWD	
	# failedUpdates.append({'changeIndex': 23, 'errorValue': mmErr_zoneRecordSyntax, 'errorMessage': 'this record could not be added '})
	return { 'serial': newSerial, 'failedUpdates': failedUpdates }


# Create a new zone
def doCreateZone():
	# text = '{ "method": "CreateZone", "params": {"view": "", "name": "zone1.com.", "type": "Master", "dynamic": "0", "masters": [], "dnsRecords":[]}}'
	text = sys.stdin.read()
	input = json.loads(text)
	viewName= input['params']['view']
	zoneName= input['params']['name']
	zoneType= input['params']['type']

	# raise Exception('creating zones is not supported')
	return {}


# Delete a specific zone
def doDeleteZone():
	text = '{ "method": "DeleteZone", "params": {"view": "", "name": "zone1.com."}}'
	# text = sys.stdin.read()
	input = json.loads(text)
	viewName= input['params']['view']
	zoneName= input['params']['name']

	##### JWD	
	# raise Exception('zone: "' + zoneName + '" does not exist.')
	return {}




if __name__ == '__main__':

	result = dict()

	try:
		if (len(sys.argv) <= 1):
			raise Exception('missing argument')
		
		if   (sys.argv[1] == 'GetServerInfo'):
			result['result']= doGetServerInfo()
		elif (sys.argv[1] == 'GetServiceStatus'):
			result['result']= doGetServiceStatus()
		elif (sys.argv[1] == 'GetViews'):
			result['result']= doGetViews()
		elif (sys.argv[1] == 'GetZones'):
			result['result']= doGetZones()
		elif (sys.argv[1] == 'GetZone'):
			result['result']= doGetZone()
		elif (sys.argv[1] == 'GetRecords'):
			result['result']= doGetRecords()
		elif (sys.argv[1] == 'UpdateZone'):
			result['result']= doUpdateZone()
		elif (sys.argv[1] == 'CreateZone'):
			result['result']= doCreateZone()
		elif (sys.argv[1] == 'DeleteZone'):
			result['result']= doDeleteZone()

		else:
			# Uknown argument
			raise Exception('unknown argument: "' + sys.argv[1] + '"')

	except Exception as e:
		result['error'] = {'code': 42, 'message' : 'error: ' + str(e) }

	print(json.dumps(result))
