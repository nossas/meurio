class AddTaskSubscriptionIdToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :task_subscription_id, :integer
  end
end
