class AddTaskSubscriptionIdToDeliveries < ActiveRecord::Migration
  def up
    "ALTER TABLE deliveries ADD COLUMN task_subscription_id integer"
  end

  def down
    "ALTER TABLE deliveries DROP COLUMN task_subscription_id"
  end
end
