require 'magic_encoding'

desc "Adds the magic encoding comment (Ruby 1.9) to all Ruby files"
task :magic_encoding do
  AddMagicComment.process []
end
