module Twithub
  class FeedEntry
    TWITTER = "twitter"
    GITHUB = "github"
    attr_reader :content, :posted_at, :origin, :username
  end
end
