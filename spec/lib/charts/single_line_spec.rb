require_relative "../../spec_helper"
require_relative "../../../lib/charts/single_line"

describe Charts::SingleLine do
  describe "#initialize" do
    it "sets attributes" do
      chart = Charts::SingleLine.new(:store)

      chart.store.must_equal :store
    end
  end

  describe "#prepare" do
    it "returns chart data" do
      store = Minitest::Mock.new
      chart = Charts::SingleLine.new(store)

      store.expect :first_date, "2011-05-23"
      store.expect :read_series, [1, 2, 3, 5, 8]

      chart.prepare.must_equal(
        series_start: "2011-05-23",
        series_data: [1, 2, 3, 5, 8]
      )

      store.verify
    end
  end
end
