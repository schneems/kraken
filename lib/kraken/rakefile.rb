module Kraken
  RAKEFILE_DEFAULT = "
  require 'kraken'
  require 'require_all'\n
  require_all 'app/validators'
  require_all 'app'
  require_all 'config'\n
  Kraken::Migrations.load_tasks\n
  task :default do
    sh 'bundle exec kraken -s'
  end\n
  task :console do
    sh 'bundle exec kraken -d'
  end\n
  task :test do
    sh 'pronto run'
    sh 'bundle exec rspec'
  end\n
  task :migrate do
    sh 'bundle exec kraken -m'
  end
".freeze
end
