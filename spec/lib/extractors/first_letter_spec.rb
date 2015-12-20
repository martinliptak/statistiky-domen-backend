require_relative "../../spec_helper"
require_relative "../../../lib/extractors/first_letter"

describe Extractors::FirstLetter do
  before do
    @extractor = Extractors::FirstLetter.new
  end

  describe "when initialized" do
    it "has empty results" do
      @extractor.result.must_equal({})
    end
  end

  describe "#extract" do
    it "increases first letter count" do
      @extractor.extract name: "auto.sk"

      @extractor.result.must_equal "a" => 1
    end

    describe "when domain name starts with a number" do
      it "increases first letter count" do
        @extractor.extract name: "007.sk"

        @extractor.result.must_equal "0" => 1
      end
    end

    describe "with multiple domains" do
      it "increases first letter count" do
        @extractor.extract name: "auto.sk"
        @extractor.extract name: "autobus.sk"
        @extractor.extract name: "bicykel.sk"

        @extractor.result.must_equal "a" => 2, "b" => 1
      end
    end
  end
end
