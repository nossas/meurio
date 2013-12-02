class AddCommentCountToFacebookPost < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :comment_count, :integer
  end
end
