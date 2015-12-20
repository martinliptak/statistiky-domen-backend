require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

ROOT_PATH = File.dirname(__FILE__) + '/..'

Dir["#{ROOT_PATH}/lib/**/*.rb"].each {|file_path| require file_path }

Stores::Base.establish_connection("#{ROOT_PATH}/db/production.db")
