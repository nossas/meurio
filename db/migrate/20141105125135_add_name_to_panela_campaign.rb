class AddNameToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :name, :string
  end
end
