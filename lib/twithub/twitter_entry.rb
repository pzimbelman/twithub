
module Twithub
  class TwitterEntry < FeedEntry
    include Twithub::EntryBuilderMethods
    def initialize
      @origin = TWITTER
    end
  end
end
