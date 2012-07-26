require_relative '../../lib/twithub'

describe Twithub::TwitterStatusUrl do
  it "should build a url of the correct format" do
    Twithub::TwitterStatusUrl.new(12, "theuser").to_s.should == "http://twitter.com/theuser/status/12"
  end
end
