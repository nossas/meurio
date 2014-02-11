class AddIdToTask < ActiveRecord::Migration
  def up
    execute "CREATE SEQUENCE tasks_serial START 1"
    execute "ALTER TABLE tasks ADD COLUMN id integer PRIMARY KEY DEFAULT nextval('tasks_serial')"
  end

  def down
    execute "ALTER TABLE tasks DROP COLUMN id"
  end
end
