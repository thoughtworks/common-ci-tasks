begin
  require 'metric_fu'

  MetricFu::Configuration.run do |config|
    config.metrics  = [:churn, :flog, :flay, :reek]
    config.graphs   = [:flog, :flay, :reek]
    config.reek = { :dirs_to_reek => ['lib'] }    
  end

rescue LoadError
  puts 'metric_fu not found: metrics collection and generation disabled'
end
