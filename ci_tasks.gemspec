# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ci_tasks/version"

Gem::Specification.new do |s|
  s.name        = "ci_tasks"
  s.version     = Ci::Tasks::VERSION
  s.authors     = ["Carlos Villela, Rajat Vig, Irfan Shah et al"]
  s.email       = ["opensource@thoughtworks.com"]
  s.homepage    = ""
  s.summary     = %q{CI Tasks}
  s.description = %q{Common tasks to be executed in Continuous Integration environments. VERY ALPHA!}

  s.rubyforge_project = "ci_tasks"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "rspec"
  s.add_runtime_dependency "rake"
  s.add_runtime_dependency "metric_fu"
  s.add_runtime_dependency "simplecov"
  s.add_runtime_dependency "fattr"
  s.add_runtime_dependency "arrayfields"
  s.add_runtime_dependency "map"
  s.add_runtime_dependency "magic_encoding"
  
  s.add_development_dependency "geminabox"
end
