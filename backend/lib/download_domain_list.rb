require "open-uri"
require "openssl"

class DownloadDomainList
  def call
    gzipped_file = open("https://www.sk-nic.sk/documents/domeny.txt.gz")

    Zlib::GzipReader.new(gzipped_file)
  end
end
