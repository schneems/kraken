module Kraken
  MIGRATION_DEFAULT = "
require 'kraken'
require 'require_all'\n
require_all app
require_all config\n
class Start < Kraken::Migration
  def up; end
  def down; end
end\n
Start.migrate(:up)".freeze
end
