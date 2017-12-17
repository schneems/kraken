require 'kraken/model'

module Kraken
  # The most trivial node
  class Connection < Model
    attribute :user
    attribute :pass
  end
end
