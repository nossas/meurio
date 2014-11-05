class AddCampaignIdToPanelaPoke < ActiveRecord::Migration
  def change
    add_column :panela_pokes, :campaign_id, :integer, foreign_key: false
  end
end
