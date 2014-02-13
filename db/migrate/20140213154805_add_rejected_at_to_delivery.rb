class AddRejectedAtToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :rejected_at, :datetime
  end
end
