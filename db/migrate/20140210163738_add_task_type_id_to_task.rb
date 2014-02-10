class AddTaskTypeIdToTask < ActiveRecord::Migration
  def up
    "ALTER TABLE tasks ADD COLUMN task_type_id integer;"
  end

  def down
    "ALTER TABLE tasks DROP COLUMN task_type_id;"
  end
end
