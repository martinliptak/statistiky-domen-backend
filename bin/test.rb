Dir[File.dirname(__FILE__) + '/../spec/**/*_spec.rb'].each {|file_path| require "./#{file_path}" }
