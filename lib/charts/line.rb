module Charts
  class Line
    attr_reader :store

    def initialize(store)
      @store = store
    end

    def prepare
      {
        series_start: series_start,
        series_data: series_data
      }
    end

    private

    def series_start
      store.first_date
    end

    def series_data
      store.top_entities(7).map do |entity_name|
        [
          entity_name,
          store.read_entity(entity_name)
        ]
      end.to_h
    end
  end
end
