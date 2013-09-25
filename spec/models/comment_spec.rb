require 'spec_helper'

describe Comment do
  context "when it's a tweet" do
    subject { Comment.new relname: "tweets" }
    it { should be_tweet }
  end
end
