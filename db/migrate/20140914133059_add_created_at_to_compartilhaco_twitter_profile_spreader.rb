class AddCreatedAtToCompartilhacoTwitterProfileSpreader < ActiveRecord::Migration
  def change
    add_column :compartilhaco_twitter_profile_spreaders, :created_at, :datetime
  end
end
