class AddIdToTaskSubscription < ActiveRecord::Migration
  def up
    execute "CREATE SEQUENCE task_subscriptions_serial START 1"
    execute "ALTER TABLE task_subscriptions ADD COLUMN id integer PRIMARY KEY DEFAULT nextval('task_subscriptions_serial')"
  end

  def down
    execute "ALTER TABLE task_subscriptions DROP COLUMN id"
  end
end
