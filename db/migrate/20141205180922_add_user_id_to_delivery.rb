class AddUserIdToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :user_id, :integer
  end
end
