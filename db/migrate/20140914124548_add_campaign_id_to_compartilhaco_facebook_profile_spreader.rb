class AddCampaignIdToCompartilhacoFacebookProfileSpreader < ActiveRecord::Migration
  def change
    add_column :compartilhaco_facebook_profile_spreaders, :campaign_id, :integer, foreign_key: false
  end
end
