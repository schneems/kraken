require 'kraken/models/model'

module Kraken
  # The most trivial node
  class Connection < MemoryModel
    attribute :user
    attribute :pass

    index :user

    # How are defined it is a uniq user authenticated in Kraken Network
    def single_user?
      Kraken::Connection.find(user: user).size <= 1
    end

    # Validate if the credentials are correct
    def authenticate
      true
    end
  end
end
