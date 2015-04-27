class AddOrganizationIdToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :organization_id, :integer, foreign_key: false
  end
end
