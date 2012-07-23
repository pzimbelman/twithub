module Twithub
  class Entries
    def from_json(json)
      parsed = JSON.parse(json)
      return entry_for(parsed) if parsed.is_a?(Hash)
      if parsed.is_a?(Array)
        return  parsed.map {|e| entry_for(e) } 
      end
    end

    private
    def entry_for(hash)
      entry = hash["origin"] == Twithub::TWITTER ? Twithub::TwitterEntry.new : Twithub::GithubEntry.new
      time = Time.parse(hash["posted_at"])
      entry.with_content(hash["content"]).with_username(hash["username"]).with_posted_at(time)
    end 
  end
end
