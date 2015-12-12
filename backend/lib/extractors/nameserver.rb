require_relative "distribution"

module Extractors
  class Nameserver < Distribution
    def distribution_value(domain_hash)
      domain_hash[:ns1]
    end
  end
end
