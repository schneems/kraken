require 'logger'

module Kraken
  # This class displays the application state records.
  class Log
    def self.close
      @closed = true
    end

    def self.log
      @closed ||= false
      if @logger.nil?
        @logger = Logger.new STDOUT
        @logger.level = Logger::DEBUG
        @logger.datetime_format = '%Y-%m-%d %H:%M:%S '
      end
      @logger
    end

    def self.info(obj)
      return if @closed
      log.info obj
    end

    def self.unknown(obj)
      return if @closed
      log.unknown obj
    end

    def self.fatal(obj)
      return if @closed
      log.fatal obj
    end

    def self.error(obj)
      return if @closed
      log.error obj
    end

    def self.warn(obj)
      return if @closed
      log.warn obj
    end

    def self.debug(obj)
      return if @closed
      log.debug obj
    end
  end
end
