module Charts
  class SingleLine
    attr_reader :store

    def initialize(store)
      @store = store
    end

    def prepare
      {
        series_start: store.first_date,
        series_data: store.read_series
      }
    end
  end
end
