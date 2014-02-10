class AddPointsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :points, :integer, null: false
  end
end
