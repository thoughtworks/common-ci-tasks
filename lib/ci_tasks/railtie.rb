require "rails/railtie"

module CiTasks
  class Railtie < Rails::Railtie
    rake_tasks do
      load "ci_tasks/tasks/ci.rake"
      load 'ci_tasks/tasks/whitespace.rake'
    end
  end
end
