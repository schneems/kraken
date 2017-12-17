require 'kraken/model'

module Kraken
  # The most trivial node
  class Connection < Model
    attribute :user
    attribute :pass

    index :user

    def single_user?
      Kraken::Connection.find(user: user).size <= 1
    end
  end
end
