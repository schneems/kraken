require 'bundler/gem_tasks'

task default: :spec

task :console do
  sh './bin/console'
end

task :test do
  sh 'pronto run'
  sh 'bundle exec rspec'
end
