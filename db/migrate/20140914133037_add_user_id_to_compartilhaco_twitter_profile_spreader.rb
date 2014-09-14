class AddUserIdToCompartilhacoTwitterProfileSpreader < ActiveRecord::Migration
  def change
    add_column :compartilhaco_twitter_profile_spreaders, :user_id, :integer, foreign_key: false
  end
end
