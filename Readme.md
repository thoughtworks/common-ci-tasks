__Using__

add following in the development, test group in Gemfile

    gem 'rack-test'
Add Tasks via Rakefile

    require 'ci_tasks'
    require 'ci_tasks/metric_fu/sinatra'

Add to spec_helper.rb 
    require 'ci_tasks/simplecov/sinatra'


For Rails use the rails version of the files at

    require 'ci_tasks/simplecov/rails'
    require 'ci_tasks/metric_fu/rails'

__Build__

Update Gemversion in version.rb, Ensure all files are commited and run 
    rake build
__Sample push to gemserver__

    gem inabox pkg/ci-tasks-0.0.1.gem --host http://gemserver.dev



