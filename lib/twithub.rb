require 'twitter'
require 'feedzirra'
require_relative 'twithub/entry_builder_methods'
require_relative 'twithub/feed_entry'
require_relative 'twithub/twitter'
require_relative 'twithub/github'
require_relative 'twithub/twitter_entry'
require_relative 'twithub/github_entry'

module Twithub
  def entries_for(params)
    entries = Twitter.entries_for(params[:twitter]) + Github.entries_for(params[:github])
    entries.sort { |a,b| b.posted_at <=> a.posted_at }
  end
  module_function :entries_for
end
