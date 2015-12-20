require_relative "../../spec_helper"
require_relative "../../../lib/extractors/status"

describe Extractors::Status do
  before do
    @extractor = Extractors::Status.new
  end

  describe "when initialized" do
    it "has empty results" do
      @extractor.result.must_equal({})
    end
  end

  describe "#extract" do
    it "increases count for status" do
      @extractor.extract status: "DOM_OK"

      @extractor.result.must_equal "DOM_OK" => 1
    end

    describe "with multiple domains" do
      it "increases count for status" do
        @extractor.extract status: "DOM_OK"
        @extractor.extract status: "DOM_OK"
        @extractor.extract status: "DOM_WARN"

        @extractor.result.must_equal "DOM_OK" => 2, "DOM_WARN" => 1
      end
    end
  end
end
