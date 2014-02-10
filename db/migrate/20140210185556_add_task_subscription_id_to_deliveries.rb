class AddTaskSubscriptionIdToDeliveries < ActiveRecord::Migration
  def up
    execute "ALTER TABLE deliveries ADD COLUMN task_subscription_id integer"
  end

  def down
    execute "ALTER TABLE deliveries DROP COLUMN IF EXISTS task_subscription_id"
  end
end
