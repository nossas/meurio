class AddAcceptedAtToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :accepted_at, :datetime
  end
end
