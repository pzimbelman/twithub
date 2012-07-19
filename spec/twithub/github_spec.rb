require_relative '../../lib/twithub'

describe Twithub::Github do
  let(:early_time) { Time.parse("Jan 1 2011 1:00EST") }
  let(:recent_time) { Time.now }
  let(:username) { "pzimbelman" }
  let(:url) { "http://github.com/#{username}.atom" }
  let(:first_github_response) { double("git", :title => "pushed to master!", :author => username, :published => recent_time) }
  let(:second_github_response) { double("git", :title => "pushed to branch", :author => username, :published => early_time) }
  let(:responses) { [first_github_response, second_github_response] }

  before do
    Feedzirra::Feed.should_receive(:fetch_and_parse).with(url).and_return(responses)
  end

  it "should return twitter entries for the values fetched from twitter" do
    entries = Twithub::Github.entries_for("pzimbelman")  
    entries.size.should == 2
    entries.first.is_a?(Twithub::GithubEntry).should be_true
    entries.first.content.should == first_github_response.title
    entries.first.username.should == username
    entries.first.posted_at.should == recent_time

    entries.last.is_a?(Twithub::GithubEntry).should be_true
    entries.last.content.should == second_github_response.title
    entries.last.username.should == username
    entries.last.posted_at.should == early_time
  end
end
