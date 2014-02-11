class AddIdToTask < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "ALTER TABLE tasks ADD COLUMN id integer;"
    else
      execute "CREATE SEQUENCE tasks_serial START 1;"
      execute "ALTER TABLE tasks ADD COLUMN id integer PRIMARY KEY DEFAULT nextval('tasks_serial');"
    end
  end

  def down
    execute "ALTER TABLE tasks DROP COLUMN id"
  end
end
