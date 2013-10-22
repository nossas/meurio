class AddTwitterUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_url, :string
  end
end
