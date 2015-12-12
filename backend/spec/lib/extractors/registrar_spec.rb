require_relative "../../spec_helper"
require_relative "../../../lib/extractors/registrar"

describe Extractors::Registrar do
  before do
    @extractor = Extractors::Registrar.new
  end

  describe "when initialized" do
    it "has empty results" do
      @extractor.result.must_equal({})
    end
  end

  describe "#extract" do
    it "increases count for registrar" do
      @extractor.extract registrar: "WEBS-0001"

      @extractor.result.must_equal "WEBS-0001" => 1
    end

    describe "with multiple domains" do
      it "increases count for registrar" do
        @extractor.extract registrar: "WEBS-0001"
        @extractor.extract registrar: "WEBS-0001"
        @extractor.extract registrar: "ISKI-0001"

        @extractor.result.must_equal "WEBS-0001" => 2, "ISKI-0001" => 1
      end
    end
  end
end
