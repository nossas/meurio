class AddTaskIdToTaskSubscription < ActiveRecord::Migration
  def up
    "ALTER TABLE task_subscriptions ADD COLUMN task_id integer"
  end

  def down
    "ALTER TABLE task_subscriptions DROP COLUMN task_id"
  end
end
