class RemoveMobilizationIdFromProblem < ActiveRecord::Migration
  def change
    remove_column :problems, :mobilization_id, :integer
  end
end
