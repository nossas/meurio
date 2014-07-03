class AddOrganizationIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :organization_id, :integer, foreign_key: false
  end
end
