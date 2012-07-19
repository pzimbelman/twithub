require_relative '../../lib/twithub'
describe Twithub::FeedEntry do
  it "should have text content" do
    Twithub::FeedEntry.new("my post").content.should == "my post"
  end
end
