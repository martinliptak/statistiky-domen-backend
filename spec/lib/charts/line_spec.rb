require_relative "../../spec_helper"
require_relative "../../../lib/charts/line"

describe Charts::Line do
  describe "#initialize" do
    it "sets attributes" do
      chart = Charts::Line.new(:store)

      chart.store.must_equal :store
    end
  end

  describe "#prepare" do
    it "returns chart data" do
      store = Minitest::Mock.new
      chart = Charts::Line.new(store)

      store.expect :first_date, "2011-05-23"
      store.expect :top_entities, ["WEBS-0001", "WEBG-0001"], [7]
      store.expect :read_entity, [1, 2, 30, 50, 80], ["WEBS-0001"]
      store.expect :read_entity, [1, 2, 3, 5, 8], ["WEBG-0001"]

      chart.prepare.must_equal(
        series_start: "2011-05-23",
        series_data: {
          "WEBS-0001" => [1, 2, 30, 50, 80],
          "WEBG-0001" => [1, 2, 3, 5, 8]
        }
      )

      store.verify
    end
  end
end
