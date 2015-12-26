#
# Find gaps in data
#
# ruby find_gaps.rb
#

require_relative "../config/environment"

%w{total registrars holders nameservers}.each do |table|
  puts "Gaps in #{table}"

  dates = Stores::Base.established_connection.execute "SELECT DISTINCT date FROM #{table} ORDER BY date ASC;"
  dates.flatten!
  last = dates.shift
  dates.each do |date|
    puts "After #{last}" if Date.parse(last) + 1 != Date.parse(date)

    last = date
  end
end
