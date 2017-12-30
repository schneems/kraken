require 'irb'
require 'require_all'
require 'project_creator'
require 'kraken/constants/project'

module Kraken
  # This class are used for load and create kraken applications!
  class App
    def self.load_app
      require_all 'app/validators' if File.exist? 'app/validators'
      require_all 'app' if File.exist? 'app'
      require_all 'config' if File.exist? 'config'
    end

    def self.create_app(name)
      { name.to_s => PROJECT_TREE }.create_project
      exit 0
    end

    def self.print_version
      puts 'KrakenLab'
      puts "-v #{Kraken::VERSION}"
      exit 0
    end

    def self.start_console
      IRB.start(__FILE__)
      exit 0
    end

    def self.start_server
      Kraken::Listener.new.join
    end
  end
end
