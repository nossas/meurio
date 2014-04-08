class AddFieldsToTaskSubscription < ActiveRecord::Migration
  def change
    if Rails.env.production? || Rails.env.staging?
      add_column :task_subscriptions, :id, :integer
      add_column :task_subscriptions, :user_id, :integer, foreign_key: false
      add_column :task_subscriptions, :task_id, :integer, foreign_key: false
      add_timestamps :task_subscriptions
    end
  end
end
