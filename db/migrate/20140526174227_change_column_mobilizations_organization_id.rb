class ChangeColumnMobilizationsOrganizationId < ActiveRecord::Migration
  def change
    change_column :mobilizations, :organization_id, :integer, null: false
  end
end
