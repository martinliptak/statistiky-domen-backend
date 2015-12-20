module Charts
  class Pie
    attr_reader :extractor_result

    def initialize(extractor_result)
      @extractor_result = extractor_result
    end

    def prepare
      total = extractor_result.values.inject(:+)
      {
        series_data: extractor_result.map { |entity_name, value| [entity_name, value.to_f / total] }
      }
    end
  end
end
