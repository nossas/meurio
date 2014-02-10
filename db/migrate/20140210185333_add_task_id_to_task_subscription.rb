class AddTaskIdToTaskSubscription < ActiveRecord::Migration
  def change
    add_column :task_subscriptions, :task_id, :integer
  end
end
