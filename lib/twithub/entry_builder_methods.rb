module Twithub
  module EntryBuilderMethods
    def with_content(content)
      @content = content
      self
    end
  
    def with_username(username)
      @username = username
      self
    end

    def with_posted_at(posted_at)
      @posted_at = posted_at
      self
    end
  end
end
