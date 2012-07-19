require_relative '../lib/twithub'

describe Twithub do
  let(:twitter_name) { "twitteruser" }
  let(:github_name) {"gituser" }
  describe "with the twitter response being more recent" do
    let(:github_entry) {Twithub::GithubEntry.new.with_content("foo").with_username(twitter_name).with_posted_at(Time.parse("Jan 1 2011")) }
    let(:twitter_entry) {Twithub::TwitterEntry.new.with_content("bar").with_username(github_name).with_posted_at(Time.now) }

    before do
      Twithub::Github.should_receive(:entries_for).with(github_name).and_return([github_entry])
      Twithub::Twitter.should_receive(:entries_for).with(twitter_name).and_return([twitter_entry])
    end

    it "should call to the proper services and return sorted results" do
      Twithub.entries_for(:twitter => twitter_name, :github => github_name).should == [twitter_entry, github_entry]
    end
  end

  describe "with the github response being more recent" do
    let(:github_entry) {Twithub::GithubEntry.new.with_content("foo").with_username(twitter_name).with_posted_at(Time.now) }
    let(:twitter_entry) {Twithub::TwitterEntry.new.with_content("bar").with_username(github_name).with_posted_at(Time.parse("Jan 1 2011")) }

    before do
      Twithub::Github.should_receive(:entries_for).with(github_name).and_return([github_entry])
      Twithub::Twitter.should_receive(:entries_for).with(twitter_name).and_return([twitter_entry])
    end

    it "should call to the proper services and return sorted results" do
      Twithub.entries_for(:twitter => twitter_name, :github => github_name).should == [github_entry, twitter_entry]
    end
  end
end
