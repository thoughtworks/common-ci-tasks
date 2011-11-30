task :set_ci_env do
  ENV['COVERAGE'] ||= '1'
  ENV['CC_BUILD_ARTIFACTS'] = 'On'
end

desc 'Run all examples'
RSpec::Core::RakeTask.new(:spec)

namespace :spec do
  desc 'Run coverage'
  task :cov => [ 'set_ci_env', 'spec' ]
end

desc 'Run spinach features'
task :spinach do
  exec 'bundle exec spinach'
end

desc 'Runs specs, coverage, features and metrics. Should be run on the ci loop'
task :ci => [ 'set_ci_env', 'spec', 'metrics:all', 'spinach']
