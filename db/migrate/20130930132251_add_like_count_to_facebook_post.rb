class AddLikeCountToFacebookPost < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :like_count, :integer
  end
end
