.. _nomcc-script:

nomccDNS.py
-----------

.. code-block:: python

  #!/usr/bin/env python
  '''
  Created on 2021-05-07
  ​
  @author: indridi@menandmice.com
  ​
  A Nominum Command Channel DNS server script.
  ​
  Uses the python library nomcc (https://github.com/akamai/nomcc).
  - Note that nomcc depents on Crypto which needs to be installed (not defined as dependency)
  - Assumes that we are talking to channel ansp which should be defined in /etc/channel.conf
  ​
  To add this as Generic server in Micetro you will need to define GenericDNSScript value in preferences.cfg
  for mmremote (by default on Unix /var/mmsuite/dns_server_controller/preferences.cfg).
  I.e. assuming nomccDNS.py is located in the same directory. Make sure the script is executable and add
  the following line to preferences.cfg:
  <GenericDNSScript value="/var/mmsuite/dns_server_controller/nomccDNS.py" />
  ​
  ​
  '''
  ​
  import sys
  import json
  import nomcc
  import logging
  import logging.handlers
  ​
  # Error constants
  mmErr_zoneUnableToAddRecord		= 0x1212
  mmErr_zoneUnableToDeleteRecord	= 0x1213
  mmErr_zoneUnableToModifyRecord	= 0x1214
  mmErr_zoneRecordAlreadyExist	= 0x1215
  mmErr_zoneUnableToLockZoneFile	= 0x1216
  ​
  mmErr_zoneSOAConstraint			= 0x1217
  mmErr_zoneCNAMEConstraint		= 0x1218
  mmErr_zoneOutOfZoneRecord		= 0x1219
  mmErr_zoneApexConstraint		= 0x121A
  mmErr_zoneRecordSyntax			= 0x121B
  ​
  ​
  #################################################
  # Configure logging
  #
  LOG_FILENAME = '/tmp/nomccDNS.log'
  ​
  # Set up a specific logger with error output level
  theLogger = logging.getLogger('mm_nomcc_logger')
  theLogger.setLevel(logging.INFO)
  ​
  # Add the log message handler to the logger 10 MB log file 5 times
  handler = logging.handlers.RotatingFileHandler(LOG_FILENAME, maxBytes=1024*1024*10, backupCount=5)
  ​
  # create formatter
  formatter = logging.Formatter("%(asctime)s - %(message)s")
  handler.setFormatter(formatter)
  ​
  theLogger.addHandler(handler)
  ​
  ​
  #################################################
  # Some helping hands
  #
  def doConnect():
  	return nomcc.connect('ansp')
  ​
  # Returns a Nominum view name as M&M view name
  # Nominum uses 'default' as default view. M&M use ''
  def nom2mm_view(view):
  	return '' if view == 'default' else view
  ​
  def mm2nom_view(view):
  	return 'default' if view == '' else view
  ​
  # Returns a Nominum record as a M&M record
  def nom2mm_rec(nom_rec):
  	# FIXME: this will not work correctly in case there is a space in the data part
  	split_rec = nom_rec.split(' ')
  	rec = {'name':split_rec[0], 'ttl': split_rec[1], 'type': split_rec[3], 	'data': '\t'.join(split_rec[4:])}
  	if rec['name'] == '@':
  		rec['name'] = ''
  	return rec
  ​
  # Returns a M&M record as Nominum
  def mm2nom_rec(mm_rec):
  	# NOTE: nomcc accepts tab as a field seperator hence we don't have to convert
  	if len(mm_rec['ttl']) == 0: # all nomimum records have to have TTL in order to be happy
  		mm_rec['ttl'] = '86400'
  	if len(mm_rec['name']) == 0:
  		mm_rec['name'] = '@'
  ​
  	rec = mm_rec['name'] + ' ' + mm_rec['ttl'] + ' ' + mm_rec['type'] + ' ' + mm_rec['data']
  	return rec
  ​
  # Returns the SOA serial of a zone
  def getSOASerial(conn, viewName, zoneName):
  	try:
  		s = conn.tell({'type' : 'node.get', 'zone': zoneName, 'view': mm2nom_view(viewName), 'name': '@'})
  		for r in s['data']:
  			if r.index(' SOA ') > 0:
  				split_rec = r.split(' ')
  				if len(split_rec) > 6:
  					return split_rec[6]
  	except:
  		pass
  ​
  	return ''
  ​
  #################################################
  #
  # mmSuite responses
  #
  ​
  ​
  # Return information about the type of server
  def doGetServerInfo():
  	try:
  		conn = doConnect()
  		res = conn.tell('version')
  		return { 'type': res['product'] + ' ' + res['version'] }
  	except:
  		return { 'type': 'ANSP' }
  ​
  ​
  # Return information about the status of the DNS service itself
  # possible return values are:
  #	"undefined" - we have no idea about the service
  #	"running" - the service is up and running
  #	"stopped" - the service is stopped
  #	"exited" - the service has exited
  #	"fatal" - the serivce has entered a fatal state
  #
  def doGetServiceStatus():
  	try:
  		conn = doConnect()
  		# fixme: check service?
  		return { 'serviceStatus': 'running' }
  	except:
  		return { 'serviceStatus': 'stopped' }
  ​
  ​
  # Return all views available on the DNS server
  def doGetViews():
  	views = []
  	try:
  		conn = doConnect()
  		for s in conn.sequence('view.list'):
  			views.append( nom2mm_view(s['name']) )
  	except:
  		# an error we ignore for now
  		views = ['']
  ​
  	return { 'views': views }
  ​
  ​
  # Return all zones available, their type and current serial
  def doGetZones():
  ​
  	zones = []
  	conn = doConnect()
  	for s in conn.sequence('zone.mget'):
  ​
  		is_dynamic = 'allow-update' in s and len(s['allow-update']) > 0 and s['allow-update'][0] != 'none'
  		serial = getSOASerial(conn, s['view'], s['name'])
  ​
  		zone = { 'view' : nom2mm_view(s['view']), 'name' : s['name']
  					, 'type': s['zone-type'], 'dynamic' : is_dynamic, 'serial' : serial }
  		zones.append( zone )
  ​
  	return { 'zones': zones }
  ​
  ​
  # Return information for a specific zone it's type and current serial
  def doGetZone():
  	# text = '{ "method": "GetZone", "params": {"view": "", "name": "zone1.com."}}'
  	text = sys.stdin.read()
  	input = json.loads(text)
  	viewName= input['params']['view']
  	zoneName= input['params']['name']
  ​
  	conn = doConnect()
  	s = conn.tell({'type' : 'zone.get', 'name': zoneName, 'view': mm2nom_view(viewName)})
  ​
  	is_dynamic = 'allow-update' in s and len(s['allow-update']) > 0 and s['allow-update'][0] != 'none'
  	serial = getSOASerial(conn, s['view'], s['name'])
  	zone = { 'view' : nom2mm_view(s['view']), 'name' : s['name']
  				, 'type': s['zone-type'], 'dynamic' : is_dynamic, 'serial' : serial }
  ​
  	return { 'zone': zone }
  ​
  ​
  ​
  # Return the content a zone
  def doGetRecords():
  	# text = '{ "method": "GetRecords", "params": {"view": "", "name": "example."}}'
  	text = sys.stdin.read()
  	input = json.loads(text)
  	viewName= input['params']['view']
  	zoneName= input['params']['name']
  ​
  	records = []
  	conn = doConnect()
  	for s in conn.sequence( {'type' : 'node.mget', 'zone': zoneName, 'view': mm2nom_view(viewName)} ):
  		for r in s['data']:
  			rec = nom2mm_rec(r)
  			records.append( rec )
  ​
  	# theLogger.info("Zone: '%s' number of records retrieved: %s" % (zoneName, len(records)) )
  	return { 'dnsRecords': records }
  ​
  ​
  # Update a zone
  def doUpdateZone():
  ​
  	#text = '''{ "method": "UpdateZone", "params": {"view": "", "name": "zone1.com.", "replaceZone": "0", "dnsRecordChanges":[
  	#	{"type": "ModifyDNSRecord", "changeIndex": "23"
  	#		, "dnsRecordBefore": 	{"name":"newrec2", "ttl": "", "type": "A", 	"data": "127.151.171.23", "comment":"a comment" }
  	#		, "dnsRecordAfter": 	{"name":"newrec2", 	"ttl": "", "type": "A", 	"data": "127.151.171.24"}
  	#	}
  	#]}}'''
  ​
  	text = sys.stdin.read()
  	input = json.loads(text)
  	# theLogger.info(json.dumps(input))
  	viewName= input['params']['view']
  	zoneName= input['params']['name']
  	failedUpdates= []

  	kTypeToErroMap = {'AddDNSRecord': mmErr_zoneUnableToAddRecord, 'ModifyDNSRecord': mmErr_zoneUnableToModifyRecord, 'RemoveDNSRecord': mmErr_zoneUnableToDeleteRecord}
  ​
  	conn = doConnect()
  ​
  	for dnsRecordChange in input['params']['dnsRecordChanges']:
  		try:
  			if dnsRecordChange['type'] == 'AddDNSRecord':
  				s = conn.tell({'type' : 'zone.update-data', 'name': zoneName, 'view': mm2nom_view(viewName)
  									, 'add': mm2nom_rec(dnsRecordChange['dnsRecordAfter'])})
  			elif dnsRecordChange['type'] == 'ModifyDNSRecord':
  				s = conn.tell({'type' : 'zone.update-data', 'name': zoneName, 'view': mm2nom_view(viewName)
  									, 'delete': mm2nom_rec(dnsRecordChange['dnsRecordBefore'])
  									, 'add': mm2nom_rec(dnsRecordChange['dnsRecordAfter'])})
  			elif dnsRecordChange['type'] == 'RemoveDNSRecord':
  				s = conn.tell({'type' : 'zone.update-data', 'name': zoneName, 'view': mm2nom_view(viewName)
  									, 'delete': mm2nom_rec(dnsRecordChange['dnsRecordBefore'])})
  		except Exception as e:
  			failedUpdates.append({'changeIndex': dnsRecordChange['changeIndex'], 'errorValue': kTypeToErroMap[dnsRecordChange['type']], 'errorMessage': str(e)})
  ​
  	serial = getSOASerial(conn, viewName, zoneName)
  	return { 'serial': serial, 'failedUpdates': failedUpdates }
  ​
  ​
  ​
  # Create a new zone
  def doCreateZone():
  	#text = '{ "method": "CreateZone", "params": {"view": "", "name": "zone1.com.", "type": "Master", "dynamic": "0", "masters": [], "dnsRecords":[]}}'
  	#text = '{ "method": "CreateZone", "params": {"view": "", "name": "downs.is.", "type": "Slave", "dynamic": "0", "masters": ["157.157.170.7"], "dnsRecords":[]} }'
  	#text = '{"method": "CreateZone", "params": {"view": "", "name": "nom2.com.", "type": "Master", "dynamic": "0", "masters": [], "dnsRecords": [{"name": "", "type": "SOA", "ttl": "7200", "data": "ansp.com. hostmaster 2021050901 28800 7200 604800 7200", "comment": ""}, {"name": "", "type": "NS", "ttl": "", "data": "ansp.com.", "comment": ""}, {"name": "one", "type": "A", "ttl": "", "data": "2.2.2.2", "comment": ""}, {"name": "two", "type": "A", "ttl": "", "data": "3.3.3.3", "comment": ""}]}}'
  ​
  	text = sys.stdin.read()
  	input = json.loads(text)
  	# theLogger.info(json.dumps(input))
  	viewName= input['params']['view']
  	zoneName= input['params']['name']
  	zoneType= input['params']['type']
  ​
  	if zoneType.lower() not in ['master', 'slave']:
  		raise Exception('Only Master and Slave zone creation is supported')
  ​
  	conn = doConnect()
  	zone = {'type' : 'zone.add', 'name': zoneName, 'view': mm2nom_view(viewName), 'zone-type': zoneType}
  	if input['params']['dynamic'] == '1':
  		zone['allow-update'] = ['any']
  	if zoneType == 'Slave': # update masters list
  		zone['masters'] = input['params']['masters']
  ​
  	s = conn.tell(zone)
  ​
  	records = []
  	for rec in input['params']['dnsRecords']:
  		records.append(mm2nom_rec(rec))
  	if len(records) > 0:
  		s = conn.tell({'type' : 'zone.update-data', 'name': zoneName, 'view': mm2nom_view(viewName)
  							, 'add': records})
  ​
  	return {}
  ​
  ​
  # Delete a specific zone
  def doDeleteZone():
  	# text = '{ "method": "DeleteZone", "params": {"view": "", "name": "zone1.com."}}'
  	text = sys.stdin.read()
  	input = json.loads(text)
  	viewName= input['params']['view']
  	zoneName= input['params']['name']
  ​
  	conn = doConnect()
  	s = conn.tell({'type' : 'zone.delete', 'name': zoneName, 'view': mm2nom_view(viewName)})
  	return {}
  ​
  ​
  ​
  ​
  if __name__ == '__main__':
  ​
  	result = dict()
  ​
  	try:
  		if (len(sys.argv) <= 1):
  			raise Exception('missing argument')

  		# theLogger.info(sys.argv[1])
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
  ​
  		else:
  			# Uknown argument
  			raise Exception('unknown argument: "' + sys.argv[1] + '"')
  ​
  	except Exception as e:
  		result['error'] = {'code': 42, 'message' : 'error: ' + str(e) }
  ​
  	print(json.dumps(result))
