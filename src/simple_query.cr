require "crystal-monetdb-libmapi/monetdb"
require "crystal-monetdb-libmapi/monetdb_data"
require "crystal-monetdb-libmapi/tools"
require "colorize"

class ConnectionError < Exception; end
class QueryError < Exception; end
class InternalError < Exception; end
class TimeoutError < Exception; end

host = "127.0.0.1"
port = 50000
username = "monetdb"
password = "monetdb"
db = "test"

mero = MonetDB::ClientJSON.new
mero.host = host
mero.port = port
mero.username = username
mero.password = password
mero.db = db

myschema = "\"test\""
query = "SELECT * FROM #{myschema}.fruits;"
mero.connect
result_json = mero.query_json(query)
result = mero.json_to_hash(result_json)
puts "Hash Created:".colorize(:red)
p result
puts "Display specific fields".colorize(:red)
result.each {|k,v|
  puts "Hash Key: #{k} Name: #{v["name"]} Price: #{v["price"]}"
}

puts "Peach"
query = "SELECT * FROM #{myschema}.fruits WHERE name = 'Peach';"
result_json = mero.query_json(query)
result = mero.json_to_hash(result_json)
puts "Hash Created:".colorize(:red)
p result
puts "Display specific fields".colorize(:red)
result.each {|k,v|
  puts "Hash Key: #{k} Name: #{v["name"]} Price: #{v["price"]}"
}

puts "Collection of fruits of 9.99"
query = "SELECT * FROM #{myschema}.fruits WHERE price = '9.99';"
result_json = mero.query_json(query)
result = mero.json_to_hash(result_json)
puts "Hash Created:".colorize(:red)
p result
puts "Display specific fields".colorize(:red)
result.each {|k,v|
  puts "Hash Key: #{k} Name: #{v["name"]} Price: #{v["price"]}"
}

dur = Timers.new
dur.start
puts "GUID test"
query = "SELECT * FROM #{myschema}.guid_test;"
result_json = mero.query_json(query)
result = mero.json_to_hash(result_json)
puts "Hash Created:".colorize(:red)
p result
puts "Display specific fields".colorize(:red)
result.each {|k,v|
  puts "Hash Key: #{k} F1: #{v["f1"]} F2: #{v["f2"]}"
}
puts "Total time:"
dur.stop
puts dur.stats

