.. _powerdns-script:

genericDNSPowerDNS.py
---------------------

Copy the following block to a file and save it as ``genericDNSPowerDNS.py``. Modify the variables as needed.

.. code-block:: python

  #!/usr/bin/env python
  '''
  Version 1.9 - needs M&M Suite version >= 9.3.x

  A python script that implements an interface to PowerDNS 3.1, 3.3.1, 3.4.1 and 4.3.2
  with MySQL backend as a generic DNS server in mmSuite.

  Needs MySQLdb to connect to the PDNS database

  1. Modify the script so that it fits to your PowerDNS setup or get in contact
  with the M&M support.

  2. Add reference to the script in preferences.cfg for DNS remote. Example:
  	<GenericDNSScript value="python /var/mmsuite/dns_server_controller/scripts/genericDNSPowerDNS.py" />

  3. Start DNS remote, use MMMC to log in to central and add a generic DNS server refering to
  the DNS remote.

  4. Enjoy

  '''
  from __future__ import print_function	# Prepare for python 3.1

  import MySQLdb
  import sys
  import subprocess
  import json
  import logging
  import logging.handlers
  import re

  # new zones are created as NATIVE
  # please change to MASTER in case you have configured your PDNS running as MASTER
  # (check you pdns.conf file)
  mmPDNSNewZoneType = "NATIVE"

  # PDNS with DNSSEC enabled
  # please set to True, which will also set the "auth" column
  mmPDNSDnsSec = False

  # Error constants
  mmErr_zoneUnableToAddRecord     = 0x1212
  mmErr_zoneUnableToDeleteRecord  = 0x1213
  mmErr_zoneUnableToModifyRecord  = 0x1214
  mmErr_zoneRecordAlreadyExist    = 0x1215
  mmErr_zoneUnableToLockZoneFile  = 0x1216

  mmErr_zoneSOAConstraint                 = 0x1217
  mmErr_zoneCNAMEConstraint               = 0x1218
  mmErr_zoneOutOfZoneRecord               = 0x1219
  mmErr_zoneApexConstraint                = 0x121A
  mmErr_zoneRecordSyntax                  = 0x121B

  # Configure logging
  LOG_FILENAME = '/tmp/mmGenericDNSPowerDNS.log'

  # Set up a specific logger with error output level
  theLogger = logging.getLogger('men_and_mice_genericdns_powerdns_logger')
  theLogger.setLevel(logging.INFO)

  # Add the log message handler to the logger 10 MB log file 5 times
  handler = logging.handlers.RotatingFileHandler(LOG_FILENAME, maxBytes=1024*1024*10, backupCount=5)

  # create formatter
  formatter = logging.Formatter("%(asctime)s - %(message)s")
  handler.setFormatter(formatter)

  theLogger.addHandler(handler)

  #################################################
  # Some helping hands
  #

  # convert BIND scaled values to seconds, e.g. 1h => 3600
  def scaledToSeconds(sttl):
      scaledvals = {"s":1,"m":60,"h":3600,"d":86400,"w":604800}
      regex = re.compile('^(?P<value>[0-9]+)(?P<unit>[smhdw])')
      seconds = 0
      try:
          if sttl == "NULL":
              return sttl
          else:
              return int(sttl) # first simply try to convert to int
      except:
          lsttl = sttl.lower()
          while lsttl:
              match = regex.match(lsttl)
              if match:
                  value, unit = int(match.group("value")), match.group("unit")
                  if int(value) and unit in scaledvals:
                      seconds += value * scaledvals[unit]
                      lsttl = lsttl[match.end():]
                  else:
                      raise Exception("Can't convert TTL '%s' from scaled value to seconds! " % (sttl))
          return seconds

  # removes the trailing "." if the name ends with the fully qualified zone name
  def deQualify(FQZN,FQDN):
      zone = FQZN.lower()
      zonename = zone[:-1]
      name = FQDN.lower()
      if not name.endswith("."):
          if not name.endswith(zonename):
              if name != "":
                  return FQDN + "." + zonename # append zone name as BIND does mit without trailing dot.
              else:
                  return zonename # just return the zone name
          return FQDN # already non FQ
      return FQDN[:-1]

  # adds the trailing . if the name ends with the zone name
  def qualify(ZN,DN,type,is_data=False):
      if is_data and (type == "A" or type == "AAAA" or type == "TXT"):
          return DN
      zone = ZN.lower()
      name = DN.lower()
      if name.endswith("."):
          return DN  # already FQDN
      elif name.endswith(zone):
          return DN+"." # make FQDN
      adddot = type == "CNAME" or type == "NS" or type == "MX" or type == "SRV" or type == "PTR" or type == "NAPTR"
      if adddot:
          return DN + "."
      return DN # some other type like TXT

  # returns the DB connection
  def getConnection():
      connection = MySQLdb.connect(host="localhost",
                                   user="powerdnstest",
                                   passwd="abc123",
                                   db="powerdnstest")
      return connection

  # just adds double quotes at the begin and end of a string
  def wrapInQuotes(input):
      return "\"" + input + "\""

  # converts a M&M record structure to PDNS
  def recToPDNS(zone, zoneFQ, record):
      ttl = str(record['ttl']) if record['ttl'] != "" else "NULL"
      ttl = scaledToSeconds(ttl)
      record['ttl'] =  ttl
      prio = "NULL"
      if record['type'] == "CAA":
          split = record['data'].split("\t")
          if '"' in split[2]:
              split[2] = split[2].replace('"', '')
          split[2] = '"%s"' % (split[2])
          record['data'] = " ".join(split)
      elif record['type'] == "NAPTR":
          split = record['data'].split("\t")
          # now wrap the fields Flags = 2, Service = 3 and Regular Expression = 4 in double quotes
          for idx in range(2,5):
              split[idx] = wrapInQuotes(split[idx])
          record['data'] = " ".join(split)
          record['data'] = deQualify(zoneFQ, record['data'])
      elif record['type'] == "MX" or record['type'] == "SRV":
          split = record['data'].split("\t")
          split[len(split)-1] = deQualify(zoneFQ, split[len(split)-1])
          prio = str(split[0]) # extract prio for SRV and MX
          del split[0] # remove the prio
          record['data'] = " ".join(split) # and join space separated (if there is something to join)
      elif record['type'] != "TXT" and record['type'] != "SPF":
          if record['type'] == "CNAME" or record['type'] == "PTR" or record['type'] == "NS":
              record['data'] = deQualify(zoneFQ, record['data'])
          record['data'] = record['data'].replace("\t"," ")

      if record['name'] == "":
          record['name'] = zone
      record['name'] = deQualify(zoneFQ,record['name'])

      return [record,prio]

  # adds a M&M DNS record into DB
  def addRecord(cur, id, zone, zoneFQ, record):
      result = recToPDNS(zone, zoneFQ, record)
      record =  result[0]
      prio = result[1]
      if mmPDNSDnsSec:
          cur.execute("insert into records(domain_id,name,ttl,type,content,prio,auth) values ('%s','%s',%s,'%s','%s',%s,1);" % (id,str(record['name']),str(record['ttl']),str(record['type']),str(record['data']),str(prio)))
      else:
          cur.execute("insert into records(domain_id,name,ttl,type,content,prio) values ('%s','%s',%s,'%s','%s',%s);" % (id,str(record['name']),str(record['ttl']),str(record['type']),str(record['data']),str(prio)))

  # returns the DNS record ID from the PowerDNS DB
  def getRecord(cur, id, zone, zoneFQ,  record):
      result = recToPDNS(zone, zoneFQ, record)
      record = result[0]
      prio = result[1]
      # PDNS wants the zone name instead of an empty name as e.g. BIND accepts
      if record['name'] == "":
          record['name'] = zone
      selstr = "select id from records where domain_id=%s and name='%s' and content='%s' and type='%s' " % (id,str(record['name']),str(record['data']),str(record['type']))
      if str(prio) == "NULL":
          selstr += "and (prio is NULL or prio ='0');"
      else:
          selstr += "and prio=%s;" % (prio)

      cur.execute(selstr)
      row  = cur.fetchone()
      if row:
          return str(row[0])
      # else return None

  # deletes a single record from the PowerDNS DB
  def delRecord(cur, id, zone, zoneFQ, record):
      recid = getRecord(cur, id, zone, zoneFQ, record)
      if recid:
          cur.execute("delete from records where id=%s and domain_id=%s;" % (recid,id))

  # updates a record in the PowerDNS DB
  def modRecord(cur, id, zone, zoneFQ, recBefore, recAfter):
      recid = getRecord(cur, id, zone, zoneFQ,  recBefore)
      result = recToPDNS(zone, zoneFQ, recAfter)
      record = result[0]
      prio = result[1]
      cur.execute("update records set name='%s',ttl=%s,content='%s',prio=%s where id=%s and type='%s';" % (record['name'],record['ttl'],record['data'],prio,recid,record['type']) )

  # special handling of SOA modifications
  def modSOARecord(serial, recDataAfter):
      rdataarray =  str(recDataAfter).split("\t")
      # check if the new serial is old-1
      if int(rdataarray[2]) == int(serial)-1:
          rdataarray[2] = str(serial) # yes, then the serial was not modified manually and we use the computed new serial value
      return [rdataarray[2]," ".join(rdataarray)]

  #################################################
  #
  # mmSuite responses
  #

  # Return server info
  # please edit path to the pdns_server binary if necessary
  def doGetServerInfo():
      p = subprocess.Popen(['/usr/sbin/pdns_server','--version'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
      out, err = p.communicate()
      res = re.search("(\d+\.\d+[\.\d+]*)", str(err))
      if res:
          return {'type': 'Unknown'}
          # return {'type': "PowerDNS Version " + str(res.group(0))}
      return {'type': "Unknown" }

  # Return information about the status of the DNS service itself
  # possible return values are:
  #       "undefined" - we have no idea about the service
  #       "running" - the service is up and running
  #       "stopped" - the service is stopped
  #       "exited" - the service has exited
  #       "fatal" - the serivce has entered a fatal state
  #
  def doGetServiceStatus():
      # For now we just try to connect and if we don't succeed
      # we report service stopped (though more likely it's the
      # connection that is broken)
      try:
          con = getConnection()
          con.close()
          return { 'serviceStatus': 'running' }
      except:
          return { 'serviceStatus': 'stopped' }

  # Return all views available on the DNS server (no views in PowerDNS)
  def doGetViews():
      return { 'views': [''] }

  # Returns all zones in all views
  def doGetZones():
      con = getConnection()
      cur = con.cursor()
      rows = cur.execute("select name, notified_serial, type from domains where type like('MASTER') or type like('NATIVE') or type like('SLAVE');")
      zones = []
      if rows > 0:
          for row in cur.fetchall():
              if str(row[2]) != "SLAVE":
                  zones.append({'view':'','name': str(row[0])+".",'type': 'Master','dynamic': False,'serial': str(row[1])})
              else:
                  zones.append({'view':'','name': str(row[0])+".",'type': 'Slave','dynamic': False,'serial': str(row[1])})

      cur.close()
      con.close()
      return {'zones': zones}

  # Return information for a specific zone- it's type and current serial
  def doGetZone():
      # text = '{ "method": "GetZone", "params": {"view": "", "name": "zone1.com."}}'
      text = sys.stdin.read()
      input = json.loads(text)
      viewName= input['params']['view']
      zoneName= input['params']['name']
      zoneName = zoneName[:-1] # remove trailing dot
      con = getConnection()
      cur = con.cursor()
      numrows = cur.execute("select name,notified_serial from domains where (type like('MASTER') or type like('NATIVE')) and name='"+zoneName+"';")
      if numrows != 1:
          if con:
              cur.close()
              con.close()
          raise Exception("Zone '%s' not found!" % (zoneName))

      row = cur.fetchone()
      zone = { 'zone': {'view': '', 'name': str(row[0])+".", 'type': 'Master', 'dynamic': False, 'serial': str(row[1])} }

      cur.close()
      con.close()
      return zone

  # Return the content of a zone
  def doGetRecords():
      # text = '{ "method": "GetRecords", "params": {"view": "", "name": "zone1.com."}}'
      text = sys.stdin.read()
      input = json.loads(text)
      viewName= input['params']['view']
      zoneNameFQ= input['params']['name']
      zoneName = zoneNameFQ[:-1]

      con = getConnection()
      cur = con.cursor()
      numrows = cur.execute("select name,ttl,type,content,prio from records where domain_id = (select id from domains where (type like('MASTER') or type like('NATIVE') or type like('SLAVE')) and name='"+zoneName+"');")
      if numrows == 0:
          if con:
              cur.close()
              con.close()
          raise Exception("Error retrieving records of zone '%s'" %(zoneName))
      records = []
      for record in cur.fetchall():
          type = str(record[2]).upper()
          name = qualify(zoneName,str(record[0]),type)
          ttl = str(record[1])
          if ttl == "None" or ttl == "":
              ttl = ""

          content = qualify(zoneName,str(record[3]),type,True)
          # MX and SRV store the priority in the separate prio column (index 4) see select statement
          if type == "MX" or type == "SRV":
              content = str(record[4]) + "\t" + content
          elif type == "NAPTR":
              split = content.split(" ")
              split[2] = split[2].strip("\"")
              split[3] = split[3].strip("\"")
              split[4] = split[4].strip("\"")
              content = " ".join(split)
          # all other parameters are space separated, but we exclude TXT and SPF
          if " "  in content and type != "TXT" and type != "SPF":
              content = content.replace(" ", "\t")

          records.append({'name':name, 'ttl':ttl, 'type':type, 'data':content})
          #theLogger.info("name:%s type:%s data: %s" %(name,type,content))
      theLogger.info("Zone: '%s' number of records retrieved: %s" % (zoneName,len(records)) )
      return { 'dnsRecords': records }


  # Create a new zone
  def doCreateZone():
      # text = '{ "method": "CreateZone", "params": {"view": "", "name": "zone1.com.", "type": "Master", "dynamic": "0", "masters": [], "dnsRecords":[]}}'
      text = sys.stdin.read()
      input = json.loads(text)
      theLogger.info(json.dumps(input))
      viewName = input['params']['view']
      zoneNameFQ = input['params']['name']
      zoneName = zoneNameFQ[:-1]
      zoneType = input['params']['type']
      records  = input['params']['dnsRecords']
      if zoneType == "Slave":
          masters =  input['params']['masters'][0]

      if not (zoneType == "Master" or zoneType == "Slave"):
          raise Exception("Can't create zone '%s': Only zone type Master supported!" % (zoneName))
      con = getConnection()
      cur = con.cursor()
      nrows = cur.execute("select id from domains where (type like('MASTER') or type like('NATIVE') or type like('SLAVE')) and name='"+zoneName+"' limit 1;")
      row = cur.fetchone()
      if row:
          raise Exception("Zone '%s' already exists!" % zoneName)

      try:
          if zoneType == "Slave":
              cur.execute("insert into domains (name,type,master) values ('%s','SLAVE','%s');" % (zoneName, masters))
          else:
              cur.execute("insert into domains (name,type) values ('%s','%s');" % (zoneName, mmPDNSNewZoneType))
              cur.execute("select id from domains where (type like('MASTER') or type like('NATIVE')) and name='"+zoneName+"' limit 1;")
              row  = cur.fetchone()
              id = str(row[0])

              for record in records:
                  result = recToPDNS(zoneName, zoneNameFQ, record)
                  record = result[0]
                  prio = result[1]
                  ttl =  record['ttl']
                  if mmPDNSDnsSec:
                      cur.execute("insert into records(domain_id,name,ttl,type,content,prio,auth) values ('%s','%s',%s,'%s','%s',%s,1);" % (id,str(record['name']),ttl,str(record['type']),str(record['data']),str(prio)))
                  else:
                      cur.execute("insert into records(domain_id,name,ttl,type,content,prio) values ('%s','%s',%s,'%s','%s',%s);" % (id,str(record['name']),ttl,str(record['type']),str(record['data']),str(prio)))

          con.commit()
      except MySQLdb.Error, e:
          if con:
              con.rollback()
              cur.close()
              con.close()
              error =  "zone: '%s' creation failed. [Error %d: %s]" % (zoneName,e.args[0],e.args[1])
              raise Exception(error)
      cur.close()
      con.close()
      return {}


  # Delete a specific zone
  def doDeleteZone():
      # text = '{ "method": "DeleteZone", "params": {"view": "", "name": "zone1.com."}}'
      text = sys.stdin.read()
      input = json.loads(text)
      viewName= input['params']['view']
      zoneName= input['params']['name']
      zoneName = zoneName[:-1]
      con = getConnection()
      cur = con.cursor()
      nrows = cur.execute("select id from domains where (type like('MASTER') or type like('NATIVE') or type like('SLAVE')) and name='"+zoneName+"' limit 1;")
      row = cur.fetchone()
      if row == None:
          raise Exception('zone: "' + zoneName + '" does not exist.')
      try:
          cur.execute("delete from records where domain_id='" + str(row[0]) + "';")
          cur.execute("delete from domains where id='" + str(row[0]) + "';")
          con.commit()
      except MySQLdb.Error, e:
          if con:
              con.rollback()
              error =  "zone: '%s'deletion failed. [Error %d: %s]" % (zoneName,e.args[0],e.args[1])
              raise Exception(error)
      finally:
          if con:
              cur.close()
              con.close()
          return {}

  # Update a zone - not finished yet
  def doUpdateZone():
      #text = '''{ "method": "UpdateZone", "params": {"view": "", "name": "zone1.com.", "replaceZone": "0", "dnsRecordChanges":[
      #       {"type": "ModifyDNSRecord", "changeIndex": "23"
      #               , "dnsRecordBefore":    {"name":"newrec2", "ttl": "", "type": "A",      "data": "127.151.171.23", "comment":"a comment" }
      #               , "dnsRecordAfter":     {"name":"newrec2",      "ttl": "", "type": "A",         "data": "127.151.171.24"}
      #       }
      #]}}'''

      text = sys.stdin.read()
      input = json.loads(text)
      viewName= input['params']['view']
      zoneNameFQ= input['params']['name']
      zoneName = zoneNameFQ[:-1]
      failedUpdates= []
      newSerial = '1234'

      con = getConnection()
      cur = con.cursor()
      cur.execute("select id from domains where (type like('MASTER') or type like('NATIVE')) and name='"+zoneName+"' limit 1;")
      row  = cur.fetchone()
      id = str(row[0])

      # get current serial from zone SOA
      cur.execute("select content from records where domain_id="+id+" and type='SOA';")
      rdataarray = str(cur.fetchone()[0]).split(" ")
      newSerial =  str(int(rdataarray[2])+1)
      rdataarray[2] = newSerial
      rdata = " ".join(rdataarray)
      kTypeToErroMap = {'AddDNSRecord': mmErr_zoneUnableToAddRecord, 'ModifyDNSRecord': mmErr_zoneUnableToModifyRecord, 'RemoveDNSRecord': mmErr_zoneUnableToDeleteRecord}
      changedRecords = 0
      for dnsRecordChange in input['params']['dnsRecordChanges']:
          try:
              if dnsRecordChange['type'] == 'AddDNSRecord':
                  theLogger.info("AddDNSRecord")
                  addRecord(cur,id,zoneName,zoneNameFQ,dnsRecordChange['dnsRecordAfter'])
              elif dnsRecordChange['type'] == 'ModifyDNSRecord':
                  theLogger.info("ModifyDNSRecord")
                  if dnsRecordChange['dnsRecordAfter']['type'] == "SOA":
                     result = modSOARecord(newSerial, dnsRecordChange['dnsRecordAfter']['data'])
                     newSerial = result[0]
                     rdata = result[1]
                     theLogger.info("Special case SOA record. New rdata %s" % (rdata))
                  else:
                     modRecord(cur, id, zoneName, zoneNameFQ, dnsRecordChange['dnsRecordBefore'], dnsRecordChange['dnsRecordAfter'])
              elif dnsRecordChange['type'] == 'RemoveDNSRecord':
                  theLogger.info("RemoveDNSRecord")
                  delRecord(cur,id,zoneName,zoneNameFQ,dnsRecordChange['dnsRecordBefore'])
              # increase the number of successful updates
              changedRecords += 1
          except MySQLdb.Error, e:
              failedUpdates.append({'changeIndex': dnsRecordChange['changeIndex'], 'errorValue': kTypeToErroMap[dnsRecordChange['type']], 'errorMessage': e.message})

      if changedRecords > 0:
          # after change we increase the serial ID.
          cur.execute("update records set content='"+rdata+"' where domain_id="+id+" and type='SOA';")
          con.commit()
          cur.close()
          con.close()
          return { 'serial': newSerial, 'failedUpdates': failedUpdates }

      if con:
          con.rollback()
          cur.close()
          con.close()
          error =  "Update of zone: '%s' failed. [%]" % (zoneName,str(failedUpdates))
          raise Exception(error)

  if __name__ == '__main__':
      result = dict()
      try:
              if (len(sys.argv) <= 1):
                  raise Exception('missing argument')
              theLogger.info(sys.argv[1])
              if   (sys.argv[1] == 'GetViews'):
                  result['result']= doGetViews()
              elif (sys.argv[1] == 'GetServerInfo'):
                  result['result']= doGetServerInfo()
              elif (sys.argv[1] == 'GetServiceStatus'):
                  result['result'] = doGetServiceStatus()
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
                  # Unknown argument
                  raise Exception('unknown argument: "' + sys.argv[1] + '"')

      except Exception,e:
          result['error'] = {'code': 42, 'message' : 'error: ' + str(e) }

      #theLogger.info(json.dumps(result))
      theLogger.info("Convert result to json")
      resultstr =  json.dumps(result, indent=4, sort_keys=True)
      theLogger.info("Writing result to stdout")
      print(resultstr)
      theLogger.info("Done")
