class CreateTaskSubscriptions < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "CREATE FOREIGN TABLE task_subscriptions SERVER multitude OPTIONS (table_name 'task_subscriptions');"
    else
      create_table :task_subscriptions
    end
  end

  def down
    if Rails.env.production? || Rails.env.staging?
      execute "DROP FOREIGN TABLE task_subscriptions;"
    else
      drop_table :task_subscriptions
    end
  end
end
