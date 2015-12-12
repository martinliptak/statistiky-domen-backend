require_relative "distribution"

module Extractors
  class Status < Distribution
    def distribution_value(domain_hash)
      domain_hash[:status]
    end
  end
end
