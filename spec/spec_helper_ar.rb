require File.dirname(__FILE__) + '/spec_helper'

require 'active_record'
require 'symbolize/active_record'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:") #'postgresql', :database => 'symbolize_test', :username => 'postgres')

if ActiveRecord::VERSION::STRING >= "3.1"
  ActiveRecord::Migrator.migrate("spec/db")
else
  require "db/001_create_testing_structure"
  CreateTestingStructure.migrate(:up)
end

puts "Running AR #{ActiveRecord::VERSION::STRING}"
# Spec::Runner.configure do |config|
# end
