require_relative '../../lib/twithub'
describe Twithub::FeedEntry do
  let(:time) { Time.now }
  let(:params) { {:content => "my post", :username => "pzimbelman", :posted_at => time,
                  :origin => "foo" } }
  describe "a basic entry with content and a time and a nonsense service" do
    it "should give access to its attribtues" do
      entry = Twithub::FeedEntry.new(params)
      entry.content.should == "my post"
      entry.username.should == "pzimbelman"
      entry.posted_at.should == time
      entry.origin.should == "foo"
    end
  end
end
