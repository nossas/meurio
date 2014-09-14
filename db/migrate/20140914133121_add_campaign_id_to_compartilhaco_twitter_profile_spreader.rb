class AddCampaignIdToCompartilhacoTwitterProfileSpreader < ActiveRecord::Migration
  def change
    add_column :compartilhaco_twitter_profile_spreaders, :campaign_id, :integer, foreign_key: false
  end
end
