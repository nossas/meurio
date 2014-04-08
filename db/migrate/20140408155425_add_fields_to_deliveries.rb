class AddFieldsToDeliveries < ActiveRecord::Migration
  def change
    if Rails.env.production? || Rails.env.staging?
      add_column :deliveries, :id, :integer
      add_column :deliveries, :task_subscription_id, :integer, foreign_key: false
      add_column :deliveries, :accepted_at, :datetime
      add_column :deliveries, :rejected_at, :datetime
    end
  end
end
