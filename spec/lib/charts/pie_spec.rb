require_relative "../../spec_helper"
require_relative "../../../lib/charts/pie"

describe Charts::Pie do
  describe "#initialize" do
    it "sets attributes" do
      chart = Charts::Pie.new(:result)

      chart.extractor_result.must_equal :result
    end
  end

  describe "#prepare" do
    it "returns chart data" do
      extractor_result = {
        "WEBS-0001" => 60,
        "WEBG-0001" => 30,
        "OTHER" => 10
      }

      chart = Charts::Pie.new(extractor_result)

      chart.prepare.must_equal(
        series_data: [["WEBS-0001", 0.6], ["WEBG-0001", 0.3], ["OTHER", 0.1]]
      )
    end
  end
end
