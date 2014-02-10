class AddIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :id, :integer
  end
end
