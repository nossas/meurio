class AddIdToDeliveries < ActiveRecord::Migration
  def change
    if Rails.env.production? || Rails.env.staging?
      add_column :deliveries, :id, :integer
    end
  end
end
