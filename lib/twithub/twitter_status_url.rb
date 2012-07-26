module Twithub
  class TwitterStatusUrl
    def initialize(id, username)
      @id = id
      @username = username
    end

    def to_s
        "http://twitter.com/#{@username}/status/#{@id}"
    end
  end
end
