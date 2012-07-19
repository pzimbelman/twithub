
module Twithub
  class GithubEntry < FeedEntry
    include Twithub::EntryBuilderMethods
    def initialize
      @origin = GITHUB
    end
  end
end
