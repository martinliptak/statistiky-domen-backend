require_relative "../../spec_helper"
require_relative "../../../lib/extractors/nameserver"

describe Extractors::Nameserver do
  before do
    @extractor = Extractors::Nameserver.new
  end

  describe "when initialized" do
    it "has empty results" do
      @extractor.result.must_equal({})
    end
  end

  describe "#extract" do
    it "increases count for nameserver" do
      @extractor.extract ns1: "ns1.websupport.sk"

      @extractor.result.must_equal "ns1.websupport.sk" => 1
    end

    describe "with multiple domains" do
      it "increases count for nameserver" do
        @extractor.extract ns1: "ns1.websupport.sk"
        @extractor.extract ns1: "ns1.websupport.sk"
        @extractor.extract ns1: "ns.exohosting.sk"

        @extractor.result.must_equal "ns1.websupport.sk" => 2, "ns.exohosting.sk" => 1
      end
    end
  end
end
