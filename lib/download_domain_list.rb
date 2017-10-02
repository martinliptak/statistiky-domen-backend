require "open-uri"
require "openssl"

class DownloadDomainList
  def call
    open("https://sk-nic.sk/subory/domains.txt")
  end
end
