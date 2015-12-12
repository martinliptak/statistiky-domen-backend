Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each {|file_path| require "./#{file_path}" }

download_domain_list = DownloadDomainList.new
domain_list = download_domain_list.call

parser_domain_list = ParseDomainList.new
extractors = {
  first_letter: Extractors::FirstLetter.new,
  length: Extractors::Length.new,
  length_extremes: Extractors::LengthExtremes.new,
  status: Extractors::Status.new,
  registrar: Extractors::Registrar.new,
  holder: Extractors::Holder.new,
  nameserver: Extractors::Nameserver.new
}
parser_domain_list.call(domain_list, extractors.values)

results = extractors.map { |key, extractor| [key, extractor.result] }.to_h
puts results.inspect
