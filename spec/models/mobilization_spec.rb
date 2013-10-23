require 'spec_helper'

describe Mobilization do
  it { should validate_presence_of :title }
  it { should validate_presence_of :short_title }
  it { should validate_presence_of :hashtag }
  it { should validate_presence_of :description }
  it { should validate_presence_of :image }
  it { should validate_presence_of :user_id }
  it { should have_many(:campaigns) }
  it { should have_many(:problems) }
  it { should belong_to(:user) }

  describe "#share_count" do
    subject { Mobilization.make! }

    context "when there is no Facebook post or tweet" do
      its(:share_count) { should be_zero }
    end

    context "when there is a Facebook post with one share" do
      before { FacebookPost.make! hashtag: subject.hashtag, share_count: 1 }
      its(:share_count) { should be_== 1 }
    end

    context "when there is a Facebook post with one like" do
      before { FacebookPost.make! hashtag: subject.hashtag, like_count: 1 }
      its(:share_count) { should be_== 1 }
    end
    
    context "when there is a tweet with one retweet" do
      before { Tweet.make! hashtag: subject.hashtag, retweet_count: 1 }
      its(:share_count) { should be_== 1 }
    end
  end
end
