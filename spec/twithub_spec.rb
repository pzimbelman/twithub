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

  describe "when lots of entries are returned" do
    let(:fake_entries) { (1..100).to_a }

    before do
      Twithub::Twitter.stub(:entries_for).and_return(fake_entries)
    end

    it "should allow the user to limit the count of the returned entries" do
      Twithub.entries_for(:twitter => "stuff", :count => 7).size.should == 7
    end

    it "should return all entries if no count parameter is given or if count is larger than the number of entries" do
      Twithub.entries_for(:twitter => "stuff").size.should == 100
      Twithub.entries_for(:twitter => "stuff", :count => 200).size.should == 100
    end
  end

  describe "from_json" do
    let(:time) { Time.parse("Jan 1st 2011") }
    let(:entry) { Twithub::TwitterEntry.new.with_content("foobar").with_username("thing").with_posted_at(time) }

    it "should be able accept a json string for a single entry" do
      new_entry = Twithub.from_json(entry.to_json)
      new_entry.content.should == "foobar"
      new_entry.posted_at.should == time
    end 

    it "should be able to accept a json string of an array of entries" do
      json = [entry].to_json
      new_entry = Twithub.from_json(json).first
      new_entry.content.should == "foobar"
      new_entry.posted_at.should == time
    end
  end
end
