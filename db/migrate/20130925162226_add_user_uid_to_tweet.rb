class AddUserUidToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :user_uid, :string
  end
end
