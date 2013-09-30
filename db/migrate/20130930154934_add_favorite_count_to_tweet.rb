class AddFavoriteCountToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :favorite_count, :integer
  end
end
