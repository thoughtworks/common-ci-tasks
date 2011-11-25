begin
  require 'metric_fu'

  MetricFu::Configuration.run do |config|
    config.metrics  = [:churn, :stats, :flog, :flay, :reek, :rails_best_practices]
    config.graphs   = [:flog, :flay, :stats, :reek]
  end

rescue LoadError
  puts 'metric_fu not found: metrics collection and generation disabled'
end
