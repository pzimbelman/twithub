module Twithub
  class FeedEntry
    attr_reader :content
    def initialize(content)
      @content = content
    end
  end
end
