class AddUserIdToTaskSubscription < ActiveRecord::Migration
  def up
    execute "ALTER TABLE task_subscriptions ADD COLUMN user_id integer;"
  end

  def down
    execute "ALTER TABLE task_subscriptions DROP COLUMN user_id;"
  end
end
