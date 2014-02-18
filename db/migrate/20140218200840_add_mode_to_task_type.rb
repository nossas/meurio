class AddModeToTaskType < ActiveRecord::Migration
  def change
    add_column :task_types, :mode, :string
  end
end
