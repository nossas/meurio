class AddShareCountToFacebookPost < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :share_count, :integer
  end
end
