module Extractors
  class Total
    def initialize
      @count = 0
    end

    def extract(domain_hash)
      @count += 1
    end

    def result
      @count
    end
  end
end
