module Extractors
  class LengthExtremes
    def initialize
      @longest = {}
      @shortest = {}
    end

    def extract(domain_hash)
      length = domain_hash[:name].length - 3

      if longest?(length)
        @longest[:length] = length
        @longest[:name] = domain_hash[:name]
      end

      if shortest?(length)
        @shortest[:length] = length
        @shortest[:name] = domain_hash[:name]
      end
    end

    def result
      {
        longest: @longest,
        shortest: @shortest
      }
    end

    private

    def longest?(length)
      !@longest[:length] || length > @longest[:length]
    end

    def shortest?(length)
      !@shortest[:length] || length < @shortest[:length]
    end
  end
end
