if ENV["COVERAGE"]
  require 'simplecov'
  require 'config'
  require "simplecov/#{Config.configuration}"
end

