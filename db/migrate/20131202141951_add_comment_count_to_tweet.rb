class AddCommentCountToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :comment_count, :integer
  end
end
