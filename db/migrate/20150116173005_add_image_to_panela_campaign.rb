class AddImageToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :image, :string
  end
end
