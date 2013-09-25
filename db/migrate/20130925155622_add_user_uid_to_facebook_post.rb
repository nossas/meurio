class AddUserUidToFacebookPost < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :user_uid, :string
  end
end
