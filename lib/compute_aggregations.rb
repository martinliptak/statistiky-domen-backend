class ComputeAggregations
  def call(domain_list)
    extractors = {
      first_letter: Extractors::FirstLetter.new,
      length: Extractors::Length.new,
      length_extremes: Extractors::LengthExtremes.new,
      status: Extractors::Status.new,
      registrars: Extractors::Registrar.new,
      holders: Extractors::Holder.new,
      nameservers: Extractors::Nameserver.new,
      total: Extractors::Total.new
    }

    parse_domain_list = ParseDomainList.new
    parse_domain_list.call(domain_list, extractors.values)

    results(extractors)
  end

  private

  def results(extractors)
    extractors.map do |name, extractor|
      [name, extractor.result]
    end.to_h
  end
end
