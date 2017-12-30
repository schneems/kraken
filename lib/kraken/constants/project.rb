module Kraken
  APP_FILE = "
require 'yaml'\n
Kraken::Config.instance.setup do |config|
  config.server name: 'app name', version: '1.0'
  config.add_trigger klass: Kraken::Trigger
end".freeze

  CONNECTION_FILE = "
class Kraken::Connection < Kraken::MemoryModel
  def on_delete; end\n
  def authenticate
    true
  end
end".freeze

  DB_FILE = "
server:
  adapter: postgresql
  database: kraken
  encoding: utf8
  host: localhost
  username: postgres
  password: postgres".freeze

  RAKEFILE_FILE = "
require 'kraken'\n
Kraken::App.load_app
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
end".freeze

  GEMFILE_FILE = "
source 'https://rubygems.org' do
	gem 'krakenlab', '#{Kraken::VERSION}'
end
".freeze

  GITIGNORE_FILE = "
  *.lock
".freeze

  PROJECT_TREE = {
    'app' => { 'triggers' => {}, 'validators' => {}, 'models' => { 'database' => {}, 'memory' => {} } },
    'config' => { 'app.rb' => APP_FILE, 'connection.rb' => CONNECTION_FILE, 'db.yml' => DB_FILE },
    'db' => { 'seeds.rb' => '', 'migrate' => {} },
    'Rakefile' => RAKEFILE_FILE,
    'Gemfile' => GEMFILE_FILE,
    '.gitignore' => GITIGNORE_FILE
  }.freeze
end
