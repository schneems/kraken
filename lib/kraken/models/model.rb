require 'ohm'
require 'kraken/models/db'

module Kraken
  # Every class that represents data must inherit this object.
  #
  #   class Event < Kraken::Model
  #     attribute :name
  #     reference :venue, :Venue
  #     set :participants, :Person
  #     counter :votes
  #
  #     index :name
  #   end
  #
  # More in: https://github.com/soveran/ohm
  class MemoryModel < Ohm::Model
    def delete
      on_delete
      super()
    end

    def on_delete(); end
  end
end
