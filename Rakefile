require 'bundler/gem_tasks'
require 'redis'

task default: :spec

task :console do
  sh './bin/console'
end

task :test do
  sh 'pronto run'
  sh 'bundle exec rspec'
end

task :dbreset do
  db = Redis.new
  db.each_key { |key| db.del key }
end
