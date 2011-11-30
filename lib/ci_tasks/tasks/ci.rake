task :set_ci_env do
  ENV['COVERAGE'] ||= '1'
  ENV['CC_BUILD_ARTIFACTS'] = 'On'
end

unless CiTasks::Config.rails?
  desc 'Run all examples'
  RSpec::Core::RakeTask.new(:spec)
end

namespace :spec do
  desc 'Run coverage'
  task :cov => [ 'set_ci_env', 'spec' ]
end

ci_tasks = [ 'set_ci_env', 'spec', 'metrics:all']
ci_tasks.push 'jasmine:ci', 'spinach' if CiTasks::Config.rails?

desc 'Runs specs, coverage, features and metrics. Should be run on the ci loop'
task :ci => ci_tasks
