require "crystal-monetdb-libmapi/monetdb"
require "crystal-monetdb-libmapi/monetdb_data"

class ConnectionError < Exception; end
class QueryError < Exception; end
class InternalError < Exception; end
class TimeoutError < Exception; end

host = "172.17.0.2"
port = 50000
username = "monetdb"
password = "monetdb"
db = "threatmonitor"

mero = MonetDB::ClientJSON.new
mero.host = host
mero.port = port
mero.username = username
mero.password = password
mero.db = db

myschema = "\"threatmonitor\""

query = "SELECT * FROM #{myschema}.fruits;"
mid = mero.connect
json_data = mero.query_json(mid, query)
json_data.each {|j|
  puts j
}
