class AddTaskTypeIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :task_type_id, :integer
  end
end
