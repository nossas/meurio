class AddSucceedToPanelaCampaigns < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :succeed, :boolean
  end
end
