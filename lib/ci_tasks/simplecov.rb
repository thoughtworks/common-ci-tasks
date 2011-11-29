if ENV["COVERAGE"]
  require 'simplecov'
  require File.expand_path(File.dirname(__FILE__) + '/config')
  require File.expand_path(File.dirname(__FILE__) + "/simplecov/#{CITasks::Config.configuration}")
end
