require_relative "distribution"

module Extractors
  class Registrar < Distribution
    def distribution_value(domain_hash)
      domain_hash[:registrar]
    end
  end
end
