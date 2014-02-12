class AddMaxDeliveriesToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :max_deliveries, :integer
  end
end
