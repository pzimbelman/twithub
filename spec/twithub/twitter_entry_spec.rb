require_relative '../../lib/twithub'

describe Twithub::TwitterEntry do
  let(:time) { Time.now }
  let(:text) { "just a random content string" }
  let(:username) { "randomusername" }

  it "should allow building of a twitter entry" do
    entry = Twithub::TwitterEntry.new.with_content(text).with_username(username).with_posted_at(time)
    entry.content.should == text
    entry.username.should == username
    entry.posted_at.should == time
    entry.origin.should == Twithub::TWITTER
  end
end
