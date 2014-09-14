class AddUserIdToCompartilhacoCampaignSpreaders < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaign_spreaders, :user_id, :integer, foreign_key: false
  end
end
