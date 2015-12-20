module Stores
  class Count < Stores::Base
    attr_reader :series_name

    def initialize(series_name)
      @series_name = series_name
    end

    def set_point(date, value)
      connection.execute "DELETE FROM #{series_name} WHERE date = ?", date.to_s
      connection.execute "INSERT INTO #{series_name} VALUES (?, ?)", [date.to_s, value]
    end

    def first_date
      connection.execute("SELECT MIN(date) FROM #{series_name}").flatten.first
    end

    def read_series
      connection.execute("SELECT value FROM #{series_name} ORDER BY date ASC").flatten
    end
  end
end
