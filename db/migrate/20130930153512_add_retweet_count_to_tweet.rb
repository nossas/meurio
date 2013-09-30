class AddRetweetCountToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :retweet_count, :integer
  end
end
