require 'simplecov'

SimpleCov.adapters.define 'sinatra' do
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/vendor/'
  
  add_group 'Models', 'lib/'
end

if ENV["COVERAGE"]
  SimpleCov.start 'sinatra'

  SimpleCov.at_exit do
    SimpleCov.result.format!
    puts "Code coverage: #{SimpleCov.result.covered_percent.round(2)}%"
  end
end
