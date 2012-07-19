module Twithub
  class FeedEntry
    include Comparable
    TWITTER = "twitter"
    GITHUB = "github"
    attr_reader :content, :posted_at, :origin, :username

    def <=>(other_entry)
      other_entry.posted_at <=> posted_at
    end
  end
end
