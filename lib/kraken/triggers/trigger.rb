module Kraken
  # This class is responsible for describing the events that can be
  # triggered by the connections.
  #
  #   class Example < Kraken::Trigger
  #     def run
  #       Kraken::Log.info params
  #     end
  #   end
  class Trigger
    attr_reader :handler, :params
    attr_accessor :callback, :connection

    def initialize(handler, params)
      @handler = handler
      @connection = handler.connection
      @params = params
      @callback = nil
    end

    def run
      Log.warn "run method was not found for class '#{self.class}'"
    end
  end
end
