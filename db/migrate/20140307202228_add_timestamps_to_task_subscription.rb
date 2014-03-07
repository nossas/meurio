class AddTimestampsToTaskSubscription < ActiveRecord::Migration
  def change
    add_timestamps :task_subscriptions
  end
end
