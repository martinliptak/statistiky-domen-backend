class PersistAggregations
  PERSISTED_ENTITIES = 100

  def call(date, aggregations)
    %w{registrars holders nameservers}.each do |series_name|
      persist_distribution(date, aggregations, series_name)
    end

    persist_count(date, aggregations, "total")
  end

  private

  def persist_distribution(date, aggregations, series_name)
    store = Stores::Distribution.new(series_name)
    persist_distribution = PersistDistribution.new(store, PERSISTED_ENTITIES)
    persist_distribution.call(date, aggregations[series_name.to_sym])
  end

  def persist_count(date, aggregations, series_name)
    store = Stores::Count.new(series_name)
    store.set_point(date, aggregations[series_name.to_sym])
  end
end
