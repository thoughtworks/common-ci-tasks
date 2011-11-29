if ENV["COVERAGE"]
  require 'metric_fu'
  require 'config'
  require "metric_fu/#{Config.configuration}"
end
