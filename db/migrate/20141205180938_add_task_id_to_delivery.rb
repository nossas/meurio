class AddTaskIdToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :task_id, :integer, foreign_key: false
  end
end
