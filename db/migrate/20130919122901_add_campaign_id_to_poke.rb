class AddCampaignIdToPoke < ActiveRecord::Migration
  def change
    add_column :pokes, :campaign_id, :integer
  end
end
