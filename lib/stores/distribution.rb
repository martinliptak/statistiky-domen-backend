module Stores
  class Distribution < Stores::Base
    attr_reader :series_name

    def initialize(series_name)
      @series_name = series_name
    end

    def delete_date(date)
      connection.execute "DELETE FROM #{series_name} WHERE date = ?", date.to_s
    end

    def write_point(entity_name, date, value)
      connection.execute "INSERT INTO #{series_name} VALUES (?, ?, ?)", [entity_name, date.to_s, value]
    end

    def first_date
      connection.execute("SELECT MIN(date) FROM #{series_name}").flatten.first
    end

    def top_entities(limit)
      connection.execute("SELECT entity_name FROM #{series_name} WHERE date = (SELECT MAX(date) FROM #{series_name})
          ORDER BY value DESC LIMIT #{limit}").flatten
    end

    def read_entity(entity_name)
      connection.execute("SELECT value FROM #{series_name} WHERE entity_name = ? ORDER BY date ASC", entity_name).flatten
    end
  end
end
