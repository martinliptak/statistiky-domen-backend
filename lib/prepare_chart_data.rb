class PrepareChartData
  def call(aggregations)
    results = {
      "value_total" => aggregations[:total],
      "value_length_extremes" => aggregations[:length_extremes],
      "distribution_status" => distribution_status(aggregations),
      "trend_total" => trend_total
    }

    %w{first_letter length registrars holders nameservers}.each do |series_name|
      results["distribution_#{series_name}"] = distribution(series_name, aggregations)
    end

    %w{registrars holders nameservers}.each do |series_name|
      results["trend_#{series_name}"] = trend(series_name)
    end

    results
  end

  private

  def distribution_status(aggregations)
    Charts::Pie.new(aggregations[:status]).prepare
  end

  def trend_total
    total_store = Stores::Count.new("total")
    Charts::SingleLine.new(total_store).prepare
  end

  def distribution(series_name, aggregations)
    Charts::Column.new(aggregations[series_name.to_sym], 10).prepare
  end

  def trend(series_name)
    distribution_store = Stores::Distribution.new(series_name)
    Charts::Line.new(distribution_store).prepare
  end
end
