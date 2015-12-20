require_relative "../../spec_helper"
require_relative "../../../lib/extractors/holder"

describe Extractors::Holder do
  before do
    @extractor = Extractors::Holder.new
  end

  describe "when initialized" do
    it "has empty results" do
      @extractor.result.must_equal({})
    end
  end

  describe "#extract" do
    it "increases count for holder" do
      @extractor.extract holder: "WEBS-0001"

      @extractor.result.must_equal "WEBS-0001" => 1
    end

    describe "with multiple domains" do
      it "increases count for holder" do
        @extractor.extract holder: "WEBS-0001"
        @extractor.extract holder: "WEBS-0001"
        @extractor.extract holder: "ISKI-0001"

        @extractor.result.must_equal "WEBS-0001" => 2, "ISKI-0001" => 1
      end
    end
  end
end
