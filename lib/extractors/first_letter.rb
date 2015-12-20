require_relative "distribution"

module Extractors
  class FirstLetter < Distribution
    def distribution_value(domain_hash)
      domain_hash[:name][0]
    end
  end
end
