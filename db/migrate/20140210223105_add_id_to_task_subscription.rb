class AddIdToTaskSubscription < ActiveRecord::Migration
  def change
    add_column :task_subscriptions, :id, :integer
  end
end
