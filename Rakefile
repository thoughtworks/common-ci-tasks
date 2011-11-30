require "bundler/gem_tasks"

def built_gem_path
  Dir[File.join("pkg/ci_tasks-*.gem")].sort_by{|f| File.mtime(f)}.last
end

desc "push the gem to the gemserver"
task :pushgem do
  %x[bundle exec gem inabox #{built_gem_path} --host http://vm100-059.sc01.thoughtworks.com/]
end

task :deletegem do
  %x[curl -X DELETE http://vm100-059.sc01.thoughtworks.com/gems/#{built_gem_path.gsub('pkg/','')}]
end

task :updategem => [ :build, :deletegem, :pushgem ]
