class AddOrganizationIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :organization_id, :integer, foreign_key: false
  end
end
