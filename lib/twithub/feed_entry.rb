module Twithub
  class FeedEntry
    TWITTER = "twitter"
    GITHUB = "github"
    attr_reader :content, :posted_at, :origin
    def initialize(content, posted_at, origin)
      @content = content
      @posted_at = posted_at
      @origin = origin
    end

    def self.from_twitter(content, posted_at)
      new(content, posted_at, TWITTER)
    end

    def self.from_github(content, posted_at)
      new(content, posted_at, GITHUB)
    end
  end
end
