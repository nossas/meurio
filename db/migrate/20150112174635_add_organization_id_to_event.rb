class AddOrganizationIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :organization_id, :integer, foreign_key: false
  end
end
