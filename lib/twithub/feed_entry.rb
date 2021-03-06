
module Twithub
  class FeedEntry
    include Comparable
    attr_reader :content, :posted_at, :origin, :username, :url

    def <=>(other_entry)
      other_entry.posted_at <=> posted_at
    end

    def to_json(*args)
      { :content => content, :username => username, :url => url,
        :posted_at => posted_at, :origin => origin }.to_json      
    end

    def from_twitter?
      origin == Twithub::TWITTER
    end

    def from_github?
      origin == Twithub::GITHUB
    end
  end
end
