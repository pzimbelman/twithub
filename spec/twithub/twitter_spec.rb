require_relative '../../lib/twithub'

describe Twithub::Twitter do
  describe "when given a valid login" do
    let(:early_time) { Time.parse("Jan 1 2011 1:00EST") }
    let(:recent_time) { Time.now }
    let(:username) { "pzimbelman" }
    let(:first_twitter_response) { double("twitter", :text => "the tweet!", :from_user => username, :created_at => recent_time, :id => 1234) }
    let(:second_twitter_response) { double("twitter", :text => "the early tweet!", :from_user => username, :created_at => early_time, :id => 123) }

    before do
      Twitter.should_receive(:user_timeline).with(username).and_return([first_twitter_response, 
                                                                        second_twitter_response])
    end

    it "should return twitter entries for the values fetched from twitter" do
      entries = Twithub::Twitter.entries_for("pzimbelman")  
      entries.size.should == 2
      entries.first.is_a?(Twithub::TwitterEntry).should be_true
      entries.first.content.should == "the tweet!"
      entries.first.username.should == username
      entries.first.posted_at.should == recent_time
      entries.first.url.should == "http://twitter.com/pzimbelman/status/1234"

      entries.last.is_a?(Twithub::TwitterEntry).should be_true
      entries.last.content.should == "the early tweet!"
      entries.last.username.should == username
      entries.last.posted_at.should == early_time
      entries.last.url.should == "http://twitter.com/pzimbelman/status/123"
    end
  end

  describe "when given nil" do
    before do
      ::Twitter.should_receive(:user_timeline).never
    end

    it "should not call twitter and return no entries" do
      Twithub::Twitter.entries_for(nil).should == []
    end
  end
end
