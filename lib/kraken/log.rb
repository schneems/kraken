require 'logger'

module Kraken
  # This class displays the application state records.
  class Log
    def self.log
      if @logger.nil?
        @logger = Logger.new STDOUT
        @logger.level = Logger::DEBUG
        @logger.datetime_format = '%Y-%m-%d %H:%M:%S '
      end
      @logger
    end

    def self.info(obj)
      log.info obj
    end

    def self.unknown(obj)
      log.unknown obj
    end

    def self.fatal(obj)
      log.fatal obj
    end

    def self.error(obj)
      log.error obj
    end

    def self.warn(obj)
      log.warn obj
    end

    def self.debug(obj)
      log.debug obj
    end
  end
end
