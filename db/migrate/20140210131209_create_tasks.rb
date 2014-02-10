class CreateTasks < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "CREATE FOREIGN TABLE tasks() SERVER multitude OPTIONS (table_name 'tasks');"
    else
      execute "CREATE TABLE tasks();"
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE tasks;"
    else
      execute "DROP TABLE tasks;"
    end
  end
end
