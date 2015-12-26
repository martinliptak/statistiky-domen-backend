#
# Exports data for charts
#
# ruby export_chart_data.rb path/to/data.json
#

require_relative "../config/environment"
require "json"

download_domain_list = DownloadDomainList.new
compute_aggregations = ComputeAggregations.new
persist_aggregations = PersistAggregations.new
prepare_chart_data = PrepareChartData.new

domain_list = download_domain_list.call
aggregations = compute_aggregations.call(domain_list)
persist_aggregations.call(Date.today, aggregations)
results = prepare_chart_data.call(aggregations)

open ARGV[0], "w" do |file|
  file.write results.to_json
end
