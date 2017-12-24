require 'ohm'
require 'active_record'
require 'kraken/db'

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
  class Model < Ohm::Model
    def delete
      on_delete
      super()
    end

    def on_delete(); end
  end

  # Create a map to MySql2
  # This uses the ActiveRecord library!
  class DatabaseModel < ActiveRecord::Base; end
end
