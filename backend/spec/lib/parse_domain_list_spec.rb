require_relative "../spec_helper"
require_relative "../../lib/parse_domain_list"

describe ParseDomainList do
  before do
    @parse_domain_list = ParseDomainList.new
  end

  describe "#call" do
    it "sends domain data to extractors" do
      domain_list = read_fixture("domain_list.csv")
      extractor = Minitest::Mock.new
      extractor.expect :extract, nil, [
        {
          :name => "0-24.sk",
          :registrar => "WEBG-0001",
          :holder => "WEBG-0001",
          :new_or_old => "NEW",
          :status => "DOM_OK",
          :ns1 => "ns.webglobe.sk",
          :ns2 => "ns2.webglobe.sk",
          :ns3 => "ns3.webglobe.sk",
          :ns4 => nil,
          :holder_in => "36306444"
        }
      ]
      extractor.expect :extract, nil, [
        {
          :name => "00.sk",
          :registrar => "WEBG-0001",
          :holder => "MILO-0245",
          :new_or_old => "NEW",
          :status => "DOM_OK",
          :ns1 => "ns1.00.sk",
          :ns2 => "ns2.00.sk",
          :ns3 => nil,
          :ns4 => nil,
          :holder_in => "45593914"
        }
      ]

      @parse_domain_list.call(domain_list, [extractor])

      extractor.verify
    end
  end
end
