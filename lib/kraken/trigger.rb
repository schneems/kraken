module Kraken
  class Trigger
    attr_reader :conn, :params
    def initialize(conn, params)
      @conn = conn
      @params = params
    end

    def run
      Log.warn "run method was not found for class '#{self.class}'"
    end
  end
end
