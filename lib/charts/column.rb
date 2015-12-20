module Charts
  class Column
    attr_reader :extractor_result, :columns

    def initialize(extractor_result, columns)
      @extractor_result = extractor_result
      @columns = columns
    end

    def prepare
      r = extractor_result.sort_by(&:last).last(columns).reverse.to_h
      {
        categories: r.keys,
        series_data: r.values
      }
    end
  end
end
