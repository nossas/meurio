class AddDescriptionToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :description, :text
  end
end
