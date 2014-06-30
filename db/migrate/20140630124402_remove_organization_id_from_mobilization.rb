class RemoveOrganizationIdFromMobilization < ActiveRecord::Migration
  def change
    remove_column :mobilizations, :organization_id, :integer
  end
end
