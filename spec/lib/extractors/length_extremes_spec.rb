require_relative "../../spec_helper"
require_relative "../../../lib/extractors/length_extremes"

describe Extractors::LengthExtremes do
  before do
    @extractor = Extractors::LengthExtremes.new
  end

  describe "when initialized" do
    it "has empty results" do
      @extractor.result.must_equal longest: {}, shortest: {}
    end
  end

  describe "#extract" do
    it "finds longest domain" do
      @extractor.extract name: "auto.sk"

      @extractor.result[:longest].must_equal length: 4, name: "auto.sk"
    end

    it "finds shortest domain" do
      @extractor.extract name: "auto.sk"

      @extractor.result[:shortest].must_equal length: 4, name: "auto.sk"
    end

    describe "with multiple domains" do
      it "finds longest and shortest domains" do
        @extractor.extract name: "auto.sk"
        @extractor.extract name: "bicykel.sk"
        @extractor.extract name: "kolobezka.sk"

        @extractor.result.must_equal longest: { length: 9, name: "kolobezka.sk" }, shortest: { length: 4, name: "auto.sk" }
      end
    end
  end
end
