require_relative "distribution"

module Extractors
  class Holder < Distribution
    def distribution_value(domain_hash)
      domain_hash[:holder]
    end
  end
end
