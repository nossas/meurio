class RemoveTaskSubscriptionIdFromDelivery < ActiveRecord::Migration
  def change
    remove_column :deliveries, :task_subscription_id, :integer
  end
end
