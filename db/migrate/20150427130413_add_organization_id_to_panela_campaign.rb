class AddOrganizationIdToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :organization_id, :integer, foreign_key: false
  end
end
