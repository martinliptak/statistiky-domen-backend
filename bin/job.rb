require_relative "../config/environment"

download_domain_list = DownloadDomainList.new
compute_aggregations = ComputeAggregations.new
persist_aggregations = PersistAggregations.new
prepare_chart_data = PrepareChartData.new

domain_list = download_domain_list.call
aggregations = compute_aggregations.call(domain_list)
persist_aggregations.call(Date.today, aggregations)
results = prepare_chart_data.call(aggregations)

puts results.inspect
