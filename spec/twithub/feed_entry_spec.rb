require_relative '../../lib/twithub'
describe Twithub::FeedEntry do
  let(:time) { Time.now }
  describe "a basic entry with content and a time and a nonsense service" do
    it "should give access to its attribtues" do
      entry = Twithub::FeedEntry.new("my post", time, "foo")
      entry.content.should == "my post"
      entry.posted_at.should == time
      entry.origin.should == "foo"
    end
  end

  describe "creating a twitter feed entry" do
    it "should create a valid entry with an origin of twitter" do
      entry = Twithub::FeedEntry.from_twitter("the content", time)
      entry.content.should == "the content"
      entry.posted_at.should == time
      entry.origin.should == Twithub::FeedEntry::TWITTER
    end
  end

  describe "creating a github feed entry" do
    it "should create a valid entry with an origin of github" do
      entry = Twithub::FeedEntry.from_github("the content", time)
      entry.content.should == "the content"
      entry.posted_at.should == time
      entry.origin.should == Twithub::FeedEntry::GITHUB
    end
  end
end
