require 'ohm'
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
  end
end
