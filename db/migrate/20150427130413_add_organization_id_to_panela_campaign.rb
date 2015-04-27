class AddOrganizationIdToPanelaCampaign < ActiveRecord::Migration
  def change
    add_column :panela_campaigns, :organization_id, :integer
  end
end
