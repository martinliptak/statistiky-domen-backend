#
# Imports trend data from GIT
#
# ruby import_git.rb path/to/repo 2014-12-31
#

require_relative "../config/environment"
require "logger"

compute_aggregations = ComputeAggregations.new
persist_aggregations = PersistAggregations.new

repo = ARGV[0]
start_date = ARGV[1]

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

git = Git.open(repo, :log => Logger.new(false))
commits = git.log(1_000_000).since("#{start_date} 00:00:00").select { |commit|
  commit.author.email == "statistiky@statistiky"
}
commits.reverse!

commits.each do |c|
  date = c.date.to_date.to_s
  puts "Importing #{date}"

  domain_list = c.gtree.blobs["domeny_1.txt"].contents
  aggregations = compute_aggregations.call(domain_list)
  persist_aggregations.call(date, aggregations)
end
