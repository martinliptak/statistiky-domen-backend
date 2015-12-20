require_relative "../../spec_helper"
require_relative "../../../lib/charts/column"

describe Charts::Column do
  describe "#initialize" do
    it "sets attributes" do
      chart = Charts::Column.new(:result, 10)

      chart.extractor_result.must_equal :result
      chart.columns.must_equal 10
    end
  end

  describe "#prepare" do
    it "returns chart data" do
      extractor_result = {
        "WEBG-0001" => 30_000,
        "WEBS-0001" => 77_000,
        "OTHER" => 10_000
      }

      chart = Charts::Column.new(extractor_result, 2)

      chart.prepare.must_equal(
        categories: ["WEBS-0001", "WEBG-0001"],
        series_data: [77_000, 30_000]
      )
    end
  end
end
