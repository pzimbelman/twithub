module Twithub
  class FeedEntry
    TWITTER = "twitter"
    GITHUB = "github"
    attr_reader :content, :posted_at, :origin, :username
    def initialize(params)
      @content = params[:content]
      @posted_at = params[:posted_at]
      @username = params[:username]
      @origin = params[:origin]
    end
  end
end
