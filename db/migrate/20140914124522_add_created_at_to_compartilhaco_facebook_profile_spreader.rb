class AddCreatedAtToCompartilhacoFacebookProfileSpreader < ActiveRecord::Migration
  def change
    add_column :compartilhaco_facebook_profile_spreaders, :created_at, :datetime
  end
end
