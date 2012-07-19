require_relative '../../lib/twithub'
describe Twithub::FeedEntry do
  describe "an empty base entry" do
    it "should have no attributes filled out by default" do
      entry = Twithub::FeedEntry.new
      entry.content.should be_nil
      entry.username.should be_nil
      entry.posted_at.should be_nil
      entry.origin.should be_nil
    end
  end
end
