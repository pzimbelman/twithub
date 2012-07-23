module Twithub
  class Github
    def self.entries_for(username)
      return [] unless username
      feed_url = "http://github.com/#{username}.atom"
      Feedzirra::Feed.fetch_and_parse(feed_url).entries.map do |entry|
        GithubEntry.new.with_content(entry.title).with_username(entry.author).with_posted_at(entry.published).with_url(entry.url)
      end 
    end
  end
end
