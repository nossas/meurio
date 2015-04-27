class AddOrganizationIdToCompartilhacoCampaign < ActiveRecord::Migration
  def change
    add_column :compartilhaco_campaigns, :organization_id, :integer, foreign_key: false
  end
end
