require 'ohm'
require 'kraken/db'

module Kraken
  # Every class that represents data must inherit this object.
  class Model < Ohm::Model
  end
end
