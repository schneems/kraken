module Kraken
  RAKEFILE_DEFAULT = "
  require 'kraken'
  require 'standalone_migrtions'

  require_all 'app/validators'
  require_all 'app'
  require_all 'config'

  StandaloneMigrations::Tasks.load_tasks

  task :default do
    sh 'bundle exec kraken -s'
  end

  task :console do
    sh 'bundle exec kraken -d'
  end

  task :test do
    sh 'pronto run'
    sh 'bundle exec rspec'
  end

  task :migrate do
    sh 'bundle exec kraken -m'
  end
".freeze
end
