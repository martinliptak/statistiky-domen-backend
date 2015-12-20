require_relative "distribution"

module Extractors
  class Length < Distribution
    def distribution_value(domain_hash)
      domain_hash[:name].length - 3
    end
  end
end
