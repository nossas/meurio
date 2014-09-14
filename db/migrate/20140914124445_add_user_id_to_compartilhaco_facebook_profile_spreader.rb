class AddUserIdToCompartilhacoFacebookProfileSpreader < ActiveRecord::Migration
  def change
    add_column :compartilhaco_facebook_profile_spreaders, :user_id, :integer, foreign_key: false
  end
end
