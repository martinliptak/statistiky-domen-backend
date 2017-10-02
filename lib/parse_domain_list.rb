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
      status: "DOM_#{row[3]}",
      ns1: row[4],
      ns2: row[5],
      ns3: row[6],
      ns4: row[7]
    }
  end
end
