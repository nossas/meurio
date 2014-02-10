class AddTaskTypeIdToTask < ActiveRecord::Migration
  def up
    execute "ALTER TABLE tasks ADD COLUMN task_type_id integer;"
  end

  def down
    execute "ALTER TABLE tasks DROP COLUMN task_type_id;"
  end
end
