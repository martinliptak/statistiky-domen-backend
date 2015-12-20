require_relative "../../spec_helper"
require_relative "../../../lib/extractors/total"

describe Extractors::Total do
  before do
    @extractor = Extractors::Total.new
  end

  describe "when initialized" do
    it "has empty results" do
      @extractor.result.must_equal 0
    end
  end

  describe "#extract" do
    it "increases count" do
      @extractor.extract name: "auto.sk"

      @extractor.result.must_equal 1
    end

    describe "with multiple domains" do
      it "increases count" do
        @extractor.extract name: "auto.sk"
        @extractor.extract name: "autobus.sk"
        @extractor.extract name: "bicykel.sk"

        @extractor.result.must_equal 3
      end
    end
  end
end
