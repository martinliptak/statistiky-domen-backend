require "sqlite3"

module Stores
  class Base
    def self.establish_connection(filepath)
      @@connection = SQLite3::Database.new(filepath)
    end

    private

    def connection
      @@connection
    end
  end
end
