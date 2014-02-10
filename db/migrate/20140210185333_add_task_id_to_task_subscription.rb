class AddTaskIdToTaskSubscription < ActiveRecord::Migration
  def up
    execute "ALTER TABLE task_subscriptions ADD COLUMN task_id integer"
  end

  def down
    execute "ALTER TABLE task_subscriptions DROP COLUMN IF EXISTS task_id"
  end
end
