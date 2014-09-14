class AddCampaignIdToCompartilhacoCampaignSpreaders < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaign_spreaders, :campaign_id, :integer, foreign_key: false
  end
end
