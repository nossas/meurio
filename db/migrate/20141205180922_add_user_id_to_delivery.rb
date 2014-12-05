class AddUserIdToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :user_id, :integer, foreign_key: false
  end
end
