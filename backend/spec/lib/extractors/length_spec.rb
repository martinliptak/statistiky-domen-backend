require_relative "../../spec_helper"
require_relative "../../../lib/extractors/length"

describe Extractors::Length do
  before do
    @extractor = Extractors::Length.new
  end

  describe "when initialized" do
    it "has empty results" do
      @extractor.result.must_equal({})
    end
  end

  describe "#extract" do
    it "increases count for length" do
      @extractor.extract name: "auto.sk"

      @extractor.result.must_equal 4 => 1
    end

    describe "with multiple domains" do
      it "increases count for length" do
        @extractor.extract name: "auto.sk"
        @extractor.extract name: "autobus.sk"
        @extractor.extract name: "bicykel.sk"

        @extractor.result.must_equal 4 => 1, 7 => 2
      end
    end
  end
end
