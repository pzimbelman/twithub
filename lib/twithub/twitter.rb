module Twithub
  class Twitter
    def self.entries_for(username)
      return [] unless username
      ::Twitter.user_timeline(username).map do |status|
        TwitterEntry.new.with_content(status.text).with_username(status.from_user).with_posted_at(status.created_at) 
      end 
    end
  end
end
