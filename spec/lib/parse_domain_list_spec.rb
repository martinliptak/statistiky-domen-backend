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
          :name => "0-0.sk",
          :registrar => "WEBS-0001",
          :holder => "JNFE-0002",
          :status => "DOM_OK",
          :ns1 => "ns2.websupport.sk",
          :ns2 => "ns3.websupport.sk",
          :ns3 => "ns1.websupport.sk",
          :ns4 => nil
        }
      ]
      extractor.expect :extract, nil, [
        {
          :name => "0-24.sk",
          :registrar => "WEBG-0001",
          :holder => "WEBG-0001",
          :status => "DOM_OK",
          :ns1 => "ns.webglobe.sk",
          :ns2 => "ns2.webglobe.sk",
          :ns3 => "ns3.webglobe.sk",
          :ns4 => nil
        }
      ]

      @parse_domain_list.call(domain_list, [extractor])

      extractor.verify
    end
  end
end
