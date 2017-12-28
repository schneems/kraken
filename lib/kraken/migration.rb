module Kraken

  MIGRATION_DEFAULT = "
  require 'require_all'

  require_all app
  require_all config

  class Start < ActiveRecord::Migration

    def up; end

    def down; end

  end

  Start.migrate(:up)
  "

end
