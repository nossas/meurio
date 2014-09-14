class AddCreatedAtToCompartilhacoCampaignSpreaders < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaign_spreaders, :created_at, :datetime
  end
end
