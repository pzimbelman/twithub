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
    count_limit = params[:count] ? (params[:count] - 1) : -1
    entries = Twitter.entries_for(params[:twitter]) + Github.entries_for(params[:github])
    entries.sort[0..count_limit]
  end
  module_function :entries_for
end
