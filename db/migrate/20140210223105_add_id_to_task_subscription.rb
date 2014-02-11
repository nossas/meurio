class AddIdToTaskSubscription < ActiveRecord::Migration
  def up
    if Rails.env.production? || Rails.env.staging?
      execute "ALTER TABLE task_subscriptions ADD COLUMN id integer"
    else
      execute "CREATE SEQUENCE task_subscriptions_serial START 1"
      execute "ALTER TABLE task_subscriptions ADD COLUMN id integer PRIMARY KEY DEFAULT nextval('task_subscriptions_serial')"
    end
  end

  def down
    execute "ALTER TABLE task_subscriptions DROP COLUMN id"
  end
end
