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

    describe "two entries with stubbed out times" do
      let(:old_entry) { Twithub::FeedEntry.new }
      let(:new_entry) { Twithub::FeedEntry.new }

      before do
        old_entry.stub(:posted_at).and_return(Time.parse("Jan 1 2011"))
        new_entry.stub(:posted_at).and_return(Time.now)
      end

      it "should allow comparing the entries to one another" do
        (old_entry > new_entry).should be_true
        (old_entry < new_entry).should be_false
      end 
    end

    describe "an entry with stubbed out attributes" do
      let(:entry) { Twithub::FeedEntry.new }
      let(:time) { Time.now }
      let(:expected_hash) { {"posted_at" => time.to_s, "content" => "the content",
                             "username" => "pzimbelman", "origin" => "twitter" } }

      before do
        entry.stub(:posted_at).and_return(time)
        entry.stub(:content).and_return("the content")
        entry.stub(:username).and_return("pzimbelman")
        entry.stub(:origin).and_return("twitter")
      end

      it "should take the entry to json" do
        JSON.parse(entry.to_json).should == expected_hash
      end 
    end
  end
end
