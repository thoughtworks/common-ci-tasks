require "bundler/gem_tasks"

desc "push the gem to the gemserver"
task :pushgem do
  built_gem_path = Dir[File.join("pkg/ci-tasks-*.gem")].sort_by{|f| File.mtime(f)}.last
  %x[bundle exec gem inabox #{built_gem_path} --host http://vm100-059.sc01.thoughtworks.com/]
end
