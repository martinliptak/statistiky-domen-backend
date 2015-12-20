require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, :test)

require "minitest/autorun"

def read_fixture(path)
  File.read(fixture_path(path))
end

def fixture_path(path)
  File.dirname(__FILE__) + "/support/fixtures/#{path}"
end
