class AddTaskIdToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :task_id, :integer
  end
end
