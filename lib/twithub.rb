require 'json'
require 'twitter'
require 'feedzirra'
require_relative 'twithub/entry_builder_methods'
require_relative 'twithub/feed_entry'
require_relative 'twithub/twitter'
require_relative 'twithub/github'
require_relative 'twithub/twitter_entry'
require_relative 'twithub/github_entry'
require_relative 'twithub/entries'
require_relative 'twithub/twitter_status_url'

module Twithub
  TWITTER = "twitter"
  GITHUB = "github"
  def entries_for(params)
    entries = Twitter.entries_for(params[:twitter]) + Github.entries_for(params[:github])
    entries.sort.take(params[:count] || entries.size)
  end
  module_function :entries_for

  def from_json(json)
    Entries.new.from_json(json)
  end
  module_function :from_json
end
