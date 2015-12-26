#
# Imports trend data from JSON
#
# ruby import_json.rb path/to/data.json
#

require_relative "../config/environment"
require "json"

persist_aggregations = PersistAggregations.new

open ARGV[0] do |file|
  data = JSON.load(file)
  data.each do |d|
    date = d["date"]
    puts "Importing #{date}"

    aggregations = {
      registrars: d["registrars"].to_h,
      holders: d["holders"].to_h,
      nameservers: d["nameservers"].to_h,
      total: d["domains"]
    }
    persist_aggregations.call date, aggregations
  end
end
