module Extractors
  class Distribution
    attr_reader :result

    def initialize
      @result = Hash.new(0)
    end

    def extract(domain_hash)
      value = distribution_value(domain_hash)
      result[value] += 1
    end
  end
end
