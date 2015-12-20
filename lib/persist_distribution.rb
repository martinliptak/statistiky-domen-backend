class PersistDistribution
  attr_reader :store, :limit

  def initialize(store, limit)
    @store = store
    @limit = limit
  end

  def call(date, distribution_result)
    store.delete_date(date)
    distribution_result.to_a.sort_by(&:last).last(limit).each do |entity_name, value|
      store.write_point(entity_name, date, value)
    end
  end
end
