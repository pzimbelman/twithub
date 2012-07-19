module Twithub
  class Github
    def self.entries_for(username)
      url = "http://github.com/#{username}.atom"
      Feedzirra::Feed.fetch_and_parse(url).entries.map do |entry|
        GithubEntry.new.with_content(entry.title).with_username(entry.author).with_posted_at(entry.published)
      end 
    end
  end
end
