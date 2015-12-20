require "csv"

class ParseDomainList
  def call(domain_list, extractors = [])
    domain_list.each_line do |line|
      next if ignored?(line)

      row = line.parse_csv(col_sep: ";")
      domain_hash = domain_hash_from_row(row)

      extractors.each { |e| e.extract(domain_hash) }
    end
  end

  private

  def ignored?(line)
    return true if line.start_with? "-- "
    return true if line.start_with? "domena;ID reg;"
    return true if line == "\n"

    false
  end

  def domain_hash_from_row(row)
    {
      name: row[0],
      registrar: row[1],
      holder: row[2],
      new_or_old: row[3],
      status: row[4],
      ns1: row[5],
      ns2: row[6],
      ns3: row[7],
      ns4: row[8],
      holder_in: row[9]
    }
  end
end
