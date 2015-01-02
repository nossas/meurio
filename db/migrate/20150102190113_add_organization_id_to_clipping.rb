class AddOrganizationIdToClipping < ActiveRecord::Migration
  def change
    add_column :clippings, :organization_id, :integer, foreign_key: false
  end
end
