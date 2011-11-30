require 'ci_tasks/version'

require 'rake'
require 'rspec/core/rake_task'
require 'rspec/core/version'

require 'spinach'

require 'ci_tasks/config'

if CiTasks::Config.rails?
  require 'ci_tasks/railtie'
else
  load 'ci_tasks/tasks/ci.rake'
end
