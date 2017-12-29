require 'require_all'

module Kraken
  class App
    def self.load_app
      require_all 'app/validators' if File.exist? 'app/validators'
      require_all 'app' if File.exist? 'app'
      require_all 'config' if File.exist? 'config'
    end
  end
end
