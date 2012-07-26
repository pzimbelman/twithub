module Twithub
  class Twitter
    def self.entries_for(username)
      return [] unless username
      ::Twitter.user_timeline(username).map do |status|
        url = Twithub::TwitterStatusUrl.new(status.id, status.from_user)
        TwitterEntry.new.with_content(status.text).with_username(status.from_user).with_posted_at(status.created_at).with_url(url.to_s)
      end 
    end
  end
end
