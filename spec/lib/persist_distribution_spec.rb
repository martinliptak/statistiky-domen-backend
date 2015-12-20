require_relative "../spec_helper"
require_relative "../../lib/persist_distribution"

describe PersistDistribution do
  describe "#initialize" do
    it "sets attributes" do
      persist_distribution = PersistDistribution.new(:store, 100)

      persist_distribution.store.must_equal :store
      persist_distribution.limit.must_equal 100
    end
  end

  describe "#call" do
    it "writes points for top entities" do
      store = Minitest::Mock.new
      persist_distribution = PersistDistribution.new(store, 2)

      store.expect :delete_date, nil, [Date.today]
      store.expect :write_point, nil, ["b", Date.today, 20]
      store.expect :write_point, nil, ["c", Date.today, 30]

      persist_distribution.call Date.today, {
        "a" => 10,
        "b" => 20,
        "c" => 30
      }

      store.verify
    end
  end
end
