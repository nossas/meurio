class AddOrganizationIdToMobilizations < ActiveRecord::Migration
  def change
    add_column :mobilizations, :organization_id, :integer, foreign_key: false
  end
end
