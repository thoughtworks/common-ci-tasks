require 'ci_tasks/version'

require 'rake'

require 'ci_tasks/config'

if CiTasks::Config.rails?
  require 'ci_tasks/railtie'
else
  require 'rspec/core/rake_task'
  require 'rspec/core/version'

  load 'ci_tasks/tasks/ci.rake'
  load 'ci_tasks/tasks/whitespace.rake'
end

